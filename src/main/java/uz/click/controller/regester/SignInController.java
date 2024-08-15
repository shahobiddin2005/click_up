package uz.click.controller.regester;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.click.entity.User;
import uz.click.repository.UserRepository;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/auth/sign-in")
public class SignInController extends HttpServlet {
    UserRepository userRepository = UserRepository.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/sign-in.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = phoneFormat(req.getParameter("phone"));
        String password = req.getParameter("password");

        Optional<User> optionalUser = userRepository.getUserByNumber(phone);
        if (optionalUser.isEmpty() || !optionalUser.get().getPassword().equals(password) || !optionalUser.get().getIsActive()) {
            req.setAttribute("notFound", true);
            req.setAttribute("message", "Phone number or password is incorrect");
            req.getRequestDispatcher("/views/sign-in.jsp").forward(req, resp);
            return;
        }

        User user = optionalUser.get();

        HttpSession session = req.getSession();
        session.setAttribute("userId",user.getId());

        resp.sendRedirect("/home");
    }

    private String phoneFormat(String phone) {
        StringBuilder sb = new StringBuilder("+");
        for (char c : phone.toCharArray()) {
            if (Character.isDigit(c))
                sb.append(c);
        }
        return sb.toString();
    }
}
