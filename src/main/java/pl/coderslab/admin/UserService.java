package pl.coderslab.admin;

import pl.coderslab.admin.User;

public interface UserService {

    User findByUserName(String name);

    void saveUser(User user);
}
