package uz.click.controller.transferController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.click.entity.Card;
import uz.click.entity.Transaction;
import uz.click.enums.TransactionStatus;
import uz.click.enums.TransactionType;
import uz.click.repository.CardRepository;
import uz.click.repository.TransactionRepository;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Optional;

@WebServlet("/transfer")
public class TransferController extends HttpServlet {
    CardRepository cardRepository = CardRepository.getInstance();
    TransactionRepository transactionRepository = TransactionRepository.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("amountReject", false);
        req.setAttribute("cardNotFound", false);
        req.setAttribute("message", "");
        req.setAttribute("cards", cardRepository.getCards());
        req.getRequestDispatcher("/views/transfer.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("success", false);
        req.setAttribute("message", "");
        req.setAttribute("cards", cardRepository.getCards());
        String cardNumber = req.getParameter("cardNumber").replace(" ", "");
        String sender = req.getParameter("sender");
        String description = req.getParameter("description");
        Double amount = Double.parseDouble(req.getParameter("amount"));

        Optional<Card> optionalCard = cardRepository.getCardByNumber(cardNumber);
        Optional<Card> optionalSender = cardRepository.getCardByNumber(sender);
        if (optionalCard.isEmpty()) {
            req.setAttribute("cardNotFound", true);
            req.setAttribute("message", "Card not found!");
            req.getRequestDispatcher("/views/transfer.jsp").forward(req, resp);
            return;
        }
        if (optionalSender.isEmpty()) {
            req.setAttribute("cardNotFound", true);
            req.setAttribute("message", "Sender not found!");
            req.getRequestDispatcher("/views/transfer.jsp").forward(req, resp);
            return;
        }
        Card senderCard = optionalSender.get();
        Card card = optionalCard.get();

        if (senderCard.getBalance() < amount) {
            req.setAttribute("amountReject", true);
            req.setAttribute("message", "Your balance is insufficient!");
            req.getRequestDispatcher("/views/transfer.jsp").forward(req, resp);
            return;
        }

        if (sender.equals(cardNumber)){
            req.setAttribute("cardNotFound", true);
            req.setAttribute("message", "It is not possible to transfer money between the same cards!");
            req.getRequestDispatcher("/views/transfer.jsp").forward(req, resp);
            return;
        }

        Transaction transaction = new Transaction();
        transaction.setSender(senderCard.getNumber());
        transaction.setReceiver(card.getNumber());
        transaction.setAmount(amount);
        transaction.setStatus(TransactionStatus.COMPLETED);
        transaction.setDate(new Timestamp(System.currentTimeMillis()));
        transaction.setType(TransactionType.TRANSFER);
        transaction.setDescription(description);

        card.setBalance(card.getBalance() + amount);
        senderCard.setBalance(senderCard.getBalance() - amount);

        transactionRepository.save(transaction);
        cardRepository.update(card);
        cardRepository.update(senderCard);

        req.setAttribute("success", true);
        req.setAttribute("transaction", transaction);
        req.setAttribute("sender", senderCard);
        req.setAttribute("receiver", card);
        req.getRequestDispatcher("/views/transferResult.jsp").forward(req, resp);
    }
}
