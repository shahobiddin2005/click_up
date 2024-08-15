package uz.click.controller.regester;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.click.entity.User;
import uz.click.enums.Role;
import uz.click.repository.UserRepository;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/auth/sign-up")
public class SignUpController extends HttpServlet {
    UserRepository userRepository =UserRepository.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/sign-up.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String phone = phoneFormat(req.getParameter("phone"));
        String password = req.getParameter("password");

        Optional<User> optionalUser = userRepository.getUserByNumber(phone);
        if (optionalUser.isPresent()) {
            req.setAttribute("isExist", true);
            req.setAttribute("message", "Phone number already in use");
            req.getRequestDispatcher("views/sign-up.jsp").forward(req, resp);
        }

        User user = new User();
        user.setName(name);
        user.setSurname(surname);
        user.setPassword(password);
        user.setPhoneNumber(phone);
        user.setRole(Role.USER);
        user.setIsActive(true);
        user.setIsConfirmed(true);

        userRepository.save(user);
        resp.sendRedirect("/auth/sign-in");
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
