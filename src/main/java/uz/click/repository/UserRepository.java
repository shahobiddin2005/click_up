package uz.click.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import lombok.Cleanup;
import uz.click.config.Configuration;
import uz.click.entity.Card;
import uz.click.entity.User;

import java.util.List;
import java.util.Optional;

public class UserRepository {


    private static UserRepository instance;

    public static UserRepository getInstance() {
        if (instance == null) {
            instance = new UserRepository();
        }
        return instance;
    }

    public void save(User user) {
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        try {
            entityManager.getTransaction().begin();
            if (user.getId() == null)
                entityManager.persist(user);
            else
                entityManager.merge(user);
        }finally {
            entityManager.getTransaction().commit();
        }
    }


    public Optional<User> getUserByNumber(String number) {
        @Cleanup
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        List<User> users;
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNativeQuery("SELECT * FROM users where phonenumber = :phone", User.class);
            query.setParameter("phone", number);
            users = (List<User>) query.getResultList();
        } finally {
            entityManager.getTransaction().commit();
        }
        if (users.isEmpty())
            return Optional.empty();
        return Optional.of(users.get(0));
    }


    public Optional<User> getUser(String userId) {
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        User user;
        try{
            entityManager.getTransaction().begin();
            user = entityManager.find(User.class, userId);
        } finally {
            entityManager.getTransaction().commit();
        }
        if (user == null) {
            return Optional.empty();
        }
        return Optional.of(user);
    }

    public List<User> getUsers() {
        @Cleanup
        EntityManager entityManager = Configuration.getEntityManagerFactory().createEntityManager();
        List<User> cards;
        try {
            entityManager.getTransaction().begin();
            cards = (List<User>) entityManager.createQuery("SELECT c FROM User c").getResultList();
        } finally {
            entityManager.getTransaction().commit();
        }
        return cards;
    }
}
