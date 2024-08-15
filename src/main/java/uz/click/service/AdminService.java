package uz.click.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;
import uz.click.entity.Card;
import uz.click.entity.User;
import uz.click.enums.Role;
import uz.click.repository.CardRepository;
import uz.click.repository.UserRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class AdminService {

    private static AdminService instance = null;
    public static AdminService getInstance() {
        if (instance == null) {
            instance = new AdminService();
        }
        return instance;
    }

    UserRepository userRepository = UserRepository.getInstance();
    CardRepository cardRepository = CardRepository.getInstance();

    @SneakyThrows
    public void adminPage(HttpServletRequest req, HttpServletResponse resp) {
        List<User> users = userRepository.getUsers();
        req.setAttribute("users", users);
        req.getRequestDispatcher("/views/admin-page.jsp").forward(req, resp);
    }

    @SneakyThrows
    public void getEditPage(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        Optional<User> optionalUser = userRepository.getUser(id);
        if (optionalUser.isEmpty()) {
            req.setAttribute("message", "user not found");
            req.getRequestDispatcher("/views/error-page.jsp").forward(req, resp);
            return;
        }
        User user = optionalUser.get();
        req.setAttribute("user", user);
        List<String> roles = new ArrayList<>();
        for (Role role : Role.values()) {
            roles.add(role.name());
        }
        req.setAttribute("roles", roles);
        req.getRequestDispatcher("/views/edit-page.jsp").forward(req, resp);

    }

    @SneakyThrows
    public void edit(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String phoneNumber = req.getParameter("phoneNumber");
        Optional<User> optionalUser = userRepository.getUser(id);
        if (optionalUser.isEmpty()) {
            req.setAttribute("message", "user not found");
            req.getRequestDispatcher("/views/error-page.jsp").forward(req, resp);
            return;
        }
        User user = optionalUser.get();
        user.setPassword(password);
        user.setRole(Role.valueOf(role));
        user.setPhoneNumber(phoneNumber);
        userRepository.save(user);
        resp.sendRedirect("/admin/page");
    }

}
