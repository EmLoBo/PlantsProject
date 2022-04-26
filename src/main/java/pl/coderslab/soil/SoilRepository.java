package pl.coderslab.soil;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SoilRepository extends JpaRepository<Soil, String> {

    Soil findById(Long id);
    Soil findByName(String name);

}
