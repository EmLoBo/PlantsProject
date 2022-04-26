package pl.coderslab.admin;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.NumberFormat;
import pl.coderslab.admin.Role;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.Set;

@Entity
@Getter
@Setter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    private String firstName;
    @NotBlank
    private String lastName;
    @Column(nullable = false, unique = true, length = 60)
    @NotBlank
    private String username;
    @NotBlank
    private String password;
    private int enabled;
    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Role> roles;
    @Pattern(regexp = "^-?([1]?[1-7][1-9]|[1]?[1-8][0]|[1-9]?[0-9])\\.{1}\\d{1,6}")
    private String longitude;
    @Pattern(regexp = "^-?([1-8]?[1-9]|[1-9]0)\\.{1}\\d{1,6}")
    private String latitude;

}
