package uz.click.repository;

public class TransactionRepository {

    private static TransactionRepository instance;

    public static TransactionRepository getInstance() {
        if (instance == null) {
            instance = new TransactionRepository();
        }
        return instance;
    }
}
