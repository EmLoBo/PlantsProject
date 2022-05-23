package pl.coderslab.admin;


import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@Controller
public class LoginController {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final UserService userService;
    private final BCryptPasswordEncoder passwordEncoder;

    public LoginController(UserRepository userRepository, RoleRepository roleRepository, UserService userService, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() {

        return "admin/login";
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.POST)
    public String login(@RequestParam String username, @RequestParam String password) {
        User byUsername = userRepository.findByUsername(username);

        if (byUsername.getPassword().equals(password)) {

            Role userRole = roleRepository.findByName("ROLE_USER");
            byUsername.setRoles((Set<Role>) userRole);

        } else {
            Role userRole = roleRepository.findByName("ROLE_GUEST");
            byUsername.setRoles((Set<Role>) userRole);
            return "redirect:/plants";
        }
        return "redirect:/plants";
    }


    @RequestMapping(value = {"/register"}, method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("role", roleRepository.findAll());

        return "admin/register";
    }


    @PostMapping("/register")
    public String createUser(@Valid User user, BindingResult result, Model model) {

       if(result.hasErrors() ) {

           return "admin/register";
       }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<>(Arrays.asList(userRole)));
        userRepository.save(user);

        return "admin/login";
    }

    @RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
    public String logout(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User entityUser = customUser.getUser();
        entityUser.getUsername();
        entityUser.setEnabled(0);

       return "plantsStartEmpty";
    }


}
