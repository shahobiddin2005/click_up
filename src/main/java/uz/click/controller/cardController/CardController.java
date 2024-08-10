package uz.click.controller.cardController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.click.repository.CardRepository;

import java.io.IOException;

@WebServlet("/cards")
public class CardController extends HttpServlet {
    CardRepository cardRepository = CardRepository.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("cards", cardRepository.getCards());
        req.getRequestDispatcher("/views/cards.jsp").forward(req, resp);
    }
}
