package pl.coderslab;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface EmailRepository extends JpaRepository<Emails, Long> {

    Emails findEmailByName(String name);
    Emails findEmailById(Long id);


    void deleteEmailsById(Long id);




}
