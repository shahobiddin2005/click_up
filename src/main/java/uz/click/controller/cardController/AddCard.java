package uz.click.controller.cardController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.click.entity.Card;
import uz.click.enums.CardType;
import uz.click.repository.CardRepository;

import java.io.IOException;
import java.util.Objects;
import java.util.Optional;

@WebServlet("/cards/add")
public class AddCard extends HttpServlet {
    CardRepository cardRepository = new CardRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("cardExists", false);
        req.setAttribute("message", "");
        req.getRequestDispatcher("/views/cards/add_card.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String number = req.getParameter("number");
        String surname = req.getParameter("surname");
        String name = req.getParameter("name");
        String exp = req.getParameter("exp");
        String cvv = req.getParameter("cvv");
        Double balance = Double.parseDouble(req.getParameter("balance"));
        String phone = req.getParameter("phone");
        Card card = Card.builder()
                .balance(balance)
                .cvv(cvv)
                .exp(exp)
                .name(name)
                .number(number)
                .surname(surname)
                .phone(phoneFormat(phone))
                .build();

        if (number.startsWith("9860")) {
            card.setType(CardType.HUMO);
        } else if (number.startsWith("8600") || number.startsWith("5614")) {
            card.setType(CardType.UZCARD);
        }else if (number.startsWith("5")) {
            card.setType(CardType.MASTERCARD);
        }else if (number.startsWith("4")) {
            card.setType(CardType.VISA);
        }else {
            req.setAttribute("cardExists", true);
            req.setAttribute("message", "Card type not detected!");
            req.getRequestDispatcher("/views/cards/add_card.jsp").forward(req, resp);
            return;
        }

        Optional<Card> any = cardRepository.getCards().stream().filter((card1 -> {
            return Objects.equals(card1.getNumber(), number);
        })).findAny();
        if (any.isPresent()) {
            req.setAttribute("cardExists", true);
            req.setAttribute("message", "This card already exists");
            req.getRequestDispatcher("/views/cards/add_card.jsp").forward(req, resp);
            return;
        }
        cardRepository.save(card);
        resp.sendRedirect("/cards");
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
