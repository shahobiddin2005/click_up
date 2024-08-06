package uz.click.repository;

public class MonitoringRepository {
    private static MonitoringRepository instance = null;

    public static MonitoringRepository getInstance() {
        if (instance == null) {
            instance = new MonitoringRepository();
        }
        return instance;
    }
}
