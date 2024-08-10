package uz.click.repository;

import jakarta.persistence.EntityManager;
import uz.click.config.Configuration;
import uz.click.entity.Card;

import java.util.List;

public class CardRepository {
    public void save(Card card) {
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(card);
        } finally {
            entityManager.getTransaction().commit();
        }
    }

    public List<Card> getCards(){
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        List<Card> cards;
        try {
            entityManager.getTransaction().begin();
            cards = (List<Card>)entityManager.createQuery("SELECT c FROM Card c").getResultList();
        }finally {
            entityManager.getTransaction().commit();
        }
        return cards;
    }

    private static CardRepository instance;

    public static CardRepository getInstance() {
        if (instance == null) {
            instance = new CardRepository();
        }
        return instance;
    }
}
