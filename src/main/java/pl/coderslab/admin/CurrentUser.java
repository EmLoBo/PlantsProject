package pl.coderslab.admin;
import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;


import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public class CurrentUser extends User {
    private final pl.coderslab.admin.User user;
    public CurrentUser(String username, String password,
                       Collection<? extends GrantedAuthority> authorities,
                       pl.coderslab.admin.User user) {
        super(username, password, authorities);
        this.user = user;
    }
    public pl.coderslab.admin.User getUser() {return user;}
}
