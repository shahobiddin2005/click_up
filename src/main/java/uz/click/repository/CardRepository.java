package uz.click.repository;

public class CardRepository {
    private static CardRepository instance;

    public static CardRepository getInstance() {
        if (instance == null) {
            instance = new CardRepository();
        }
        return instance;
    }
}
