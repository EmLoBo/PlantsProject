package pl.coderslab.place;

import org.springframework.data.jpa.repository.JpaRepository;


public interface PlaceRepository extends JpaRepository<Place, String> {
    Place findByName(String name);
    Place findById(Long id);

}
