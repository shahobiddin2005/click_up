package uz.click.repository;

import jakarta.persistence.EntityManager;
import uz.click.config.Configuration;
import uz.click.entity.Transaction;

public class TransactionRepository {

    public void save(Transaction transaction) {
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        try{
            entityManager.getTransaction().begin();
            entityManager.persist(transaction);
        }finally {
            entityManager.getTransaction().commit();
        }
    }

    private static TransactionRepository instance;

    public static TransactionRepository getInstance() {
        if (instance == null) {
            instance = new TransactionRepository();
        }
        return instance;
    }
}
