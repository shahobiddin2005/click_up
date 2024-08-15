package uz.click.config;

import uz.click.entity.User;

public class Context {
    static ThreadLocal<User> userThreadLocal = new ThreadLocal<>();
    private static User user;
    public static User getUser() {
        return userThreadLocal.get();
    }
    public static void setUser(User user) {
        userThreadLocal.set(user);
    }
}
