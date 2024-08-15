package uz.click.controller.paymentsControllers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.click.entity.Card;
import uz.click.entity.Transaction;
import uz.click.enums.TransactionStatus;
import uz.click.enums.TransactionType;
import uz.click.repository.CardRepository;
import uz.click.repository.TransactionRepository;

import java.sql.Timestamp;
import java.util.Optional;

public class MobilePayment {

    CardRepository cardRepository = CardRepository.getInstance();
    TransactionRepository transactionRepository = TransactionRepository.getInstance();

    private static MobilePayment instance = null;
    public static MobilePayment getInstance() {
        if (instance == null) {
            instance = new MobilePayment();
        }
        return instance;
    }

    public Transaction pay(HttpServletRequest req, HttpServletResponse resp) {
        Transaction transaction = new Transaction();
        String phone = phoneFormat(req.getParameter("phone"));
        Double amount = Double.parseDouble(req.getParameter("amount"));
        String sender = req.getParameter("sender");

        transaction.setStatus(TransactionStatus.FAILED);
        transaction.setAmount(amount);
        transaction.setSender(sender);
        transaction.setType(trType(phone));
        transaction.setReceiver(phone);
        transactionRepository.save(transaction);

        Optional<Card> optionalCard = cardRepository.getCardByNumber(sender);
        if (optionalCard.isEmpty() || transaction.getType() == null) {
            return transaction;
        }
        Card card = optionalCard.get();
        if (card.getBalance() < amount){
            transaction.setStatus(TransactionStatus.FAILED);
            transactionRepository.save(transaction);
            return transaction;
        }

        card.setBalance(card.getBalance() - amount);
        cardRepository.save(card);
        transaction.setStatus(TransactionStatus.COMPLETED);
        transactionRepository.save(transaction);
        return transaction;
    }

    private TransactionType trType(String phone){
        String start = phone.substring(4, 6);
        if (start.equals("99") || start.equals("77") || start.equals("95")) return TransactionType.UZMOBILE;
        else if (start.equals("93") || start.equals("94")) return TransactionType.UCELL;
        else if (start.equals("90") || start.equals("91")) return TransactionType.BEELINE;
        else if (start.equals("88") || start.equals("97")) return TransactionType.MOBIUZ;
        else if (start.equals("33")) return TransactionType.HUMANS;
        else if (start.equals("20")) return TransactionType.OQ;
        else return null;
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
