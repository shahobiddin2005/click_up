package uz.click.controller;

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

import javax.swing.text.html.HTML;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/monitoring")
public class MonitoringController extends HttpServlet {
    TransactionRepository transactionRepository = TransactionRepository.getInstance();
    CardRepository cardRepository = CardRepository.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id == null) {
            req.setAttribute("transactions", transactionRepository.getTransactionsByUser(Context.getUser()));
            req.getRequestDispatcher("/views/monitoring.jsp").forward(req, resp);
        } else {
            Optional<Transaction> optionalTransaction = transactionRepository.getTransactionById(id);
            if (optionalTransaction.isPresent()) {
                req.setAttribute("transaction", optionalTransaction.get());
                req.setAttribute("sender", cardRepository.getCardByNumber(optionalTransaction.get().getSender()).get());
                Optional<Card> optionalCard = cardRepository.getCardByNumber(optionalTransaction.get().getReceiver());
                if (optionalCard.isPresent()) {
                    req.setAttribute("receiver", optionalCard.get());
                }
                req.getRequestDispatcher("/views/transferResult.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
