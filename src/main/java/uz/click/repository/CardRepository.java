package uz.click.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import lombok.Cleanup;
import uz.click.config.Configuration;
import uz.click.entity.Card;
import uz.click.entity.Transaction;
import uz.click.entity.User;

import java.util.List;
import java.util.Optional;

public class CardRepository {
    public void save(Card card) {
        @Cleanup
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        try {
            entityManager.getTransaction().begin();
            if (card.getId() == null)
                entityManager.persist(card);
            else
                entityManager.merge(card);
        } finally {
            entityManager.getTransaction().commit();
        }
    }

    public List<Card> getCards() {
        @Cleanup
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        List<Card> cards;
        try {
            entityManager.getTransaction().begin();
            cards = (List<Card>) entityManager.createQuery("SELECT c FROM Card c").getResultList();
        } finally {
            entityManager.getTransaction().commit();
        }
        return cards;
    }

    public List<Card> getCardsByUser(User user) {
        @Cleanup
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        List<Card> cards;
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNativeQuery("SELECT * FROM card where phone = :phone", Card.class);
            query.setParameter("phone", user.getPhoneNumber());
            cards = (List<Card>) query.getResultList();
        } finally {
            entityManager.getTransaction().commit();
        }
        return cards;
    }

    public Optional<Card> getCardByNumber(String number) {
        @Cleanup
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        List<Card> cards;
        try {
            entityManager.getTransaction().begin();
            TypedQuery<Card> query = entityManager.createNamedQuery("by.number", Card.class);
            query.setParameter("number", number);
            cards = query.getResultList();
        } finally {
            entityManager.getTransaction().commit();
        }
        if (cards.isEmpty()) return Optional.empty();
        return Optional.of(cards.get(0));
    }

    private static CardRepository instance;

    public static CardRepository getInstance() {
        if (instance == null) {
            instance = new CardRepository();
        }
        return instance;
    }
}
