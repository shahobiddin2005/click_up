package uz.click.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import uz.click.config.Configuration;
import uz.click.entity.Card;
import uz.click.entity.Transaction;
import uz.click.entity.User;
import uz.click.enums.TransactionType;

import java.time.LocalDateTime;
import java.util.*;

public class TransactionRepository {

    public void save(Transaction transaction) {
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        try {
            entityManager.getTransaction().begin();
            if (transaction.getId() == null)
                entityManager.persist(transaction);
            else
                entityManager.merge(transaction);
        } finally {
            entityManager.getTransaction().commit();
        }
    }

    public List<Transaction> getTransactionsBySender(Card card) {
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNativeQuery("SELECT * FROM transaction WHERE sender = :sender", Transaction.class);
            query.setParameter("sender", card.getNumber());
            return query.getResultList();
        } finally {
            entityManager.getTransaction().commit();
        }
    }

    public List<Transaction> getTransactionsByUser(User user) {
        CardRepository cardRepository = CardRepository.getInstance();
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        List<Transaction> transactions = new ArrayList<>();
        try {
            entityManager.getTransaction().begin();
            List<Card> cardsByUser = cardRepository.getCardsByUser(user);
            for (Card card : cardsByUser) {
                transactions.addAll(getTransactionsBySender(card));
            }
            for (Transaction transaction : transactions) {
                boolean found = false;
                for (Card card : cardsByUser) {
                    if (card.getNumber().equals(transaction.getSender()) || !transaction.getType().equals(TransactionType.TRANSFER)) {
                        found = true;
                    }
                }
                if (found) {
                    found = false;
                }
            }
            return sortTransactions(transactions);
        } finally {
            entityManager.getTransaction().commit();
        }
    }

    public Optional<Transaction> getTransactionById(String id) {
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        Transaction transaction = null;
        try {
            entityManager.getTransaction().begin();
            transaction = entityManager.find(Transaction.class, id);

        } finally {
            entityManager.getTransaction().commit();
        }
        if (transaction == null)
            return Optional.empty();
        return Optional.of(transaction);
    }

    private List<Transaction> sortTransactions(List<Transaction> transactions) {
        Collections.sort(transactions, new Comparator<Transaction>() {
            @Override
            public int compare(Transaction t1, Transaction t2) {
                return t2.getDate().compareTo(t1.getDate());
            }
        });

        return transactions;
    }

    private static TransactionRepository instance;

    public static TransactionRepository getInstance() {
        if (instance == null) {
            instance = new TransactionRepository();
        }
        return instance;
    }
}
