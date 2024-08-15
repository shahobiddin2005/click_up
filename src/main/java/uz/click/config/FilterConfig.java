package uz.click.config;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.click.config.Context;
import uz.click.entity.User;
import uz.click.enums.Role;
import uz.click.repository.UserRepository;


import java.io.IOException;
import java.util.Optional;

@WebFilter("/*")
public class FilterConfig implements Filter {
    UserRepository userRepository = UserRepository.getInstance();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String requestURI = req.getRequestURI();

        HttpSession session = req.getSession();

        String userId = (String) session.getAttribute("userId");

        if (userId == null) {
            if (requestURI.contains("/auth")) {
                filterChain.doFilter(servletRequest, servletResponse);
            }else {
                resp.sendRedirect("/auth");
            }
            return;
        }

        Optional<User> optionalUser = userRepository.getUser(userId);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            Context.setUser(user);
            if (requestURI.contains("/admin")) {
                if (user.getRole().equals(Role.ADMIN)) {
                    filterChain.doFilter(servletRequest, servletResponse);
                    return;
                }
            } else {
                filterChain.doFilter(servletRequest, servletResponse);
                return;
            }
        }
        req.setAttribute("message","something went wrong with credentials");
        req.getRequestDispatcher("/views/error-page.jsp").forward(servletRequest, servletResponse);
    }
}
