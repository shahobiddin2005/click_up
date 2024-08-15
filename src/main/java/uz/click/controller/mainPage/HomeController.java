package uz.click.controller.mainPage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.click.config.Context;
import uz.click.entity.Card;
import uz.click.entity.Transaction;
import uz.click.repository.CardRepository;
import uz.click.repository.TransactionRepository;
import uz.click.repository.UserRepository;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/home")
public class HomeController extends HttpServlet {
    UserRepository userRepository = UserRepository.getInstance();
    CardRepository cardRepository  = CardRepository.getInstance();
    TransactionRepository transactionRepository = TransactionRepository.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       Double totalBalance = 0.;
        for (Card card : cardRepository.getCardsByUser(Context.getUser())) {
            totalBalance += card.getBalance();
        }

        List<Transaction> transactions = transactionRepository.getTransactionsByUser(Context.getUser());

        req.setAttribute("user", Context.getUser());
        req.setAttribute("transactions", transactions);
        req.setAttribute("totalBalance", totalBalance);
        req.setAttribute("serverTime", LocalDateTime.now());
        req.getRequestDispatcher("/views/main.jsp").forward(req, resp);
    }
}
