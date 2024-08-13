package uz.click.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import lombok.Cleanup;
import uz.click.config.Configuration;
import uz.click.entity.Card;

import java.util.List;
import java.util.Optional;

public class CardRepository {
    public void save(Card card) {
        @Cleanup
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(card);
        } finally {
            entityManager.getTransaction().commit();
        }
    }

    public void update(Card card) {
        @Cleanup
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        try {
            entityManager.getTransaction().begin();
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
