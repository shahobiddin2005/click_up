package uz.click.config;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.Getter;

public class Configuration {
    @Getter
    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("db_connector");
}
