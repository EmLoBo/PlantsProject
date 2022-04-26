package pl.coderslab.size;

import org.springframework.data.jpa.repository.JpaRepository;


public interface SizeRepository extends JpaRepository<Size, String> {

    Size findByName(String name);
    Size findById(Long Id);
}
