package pl.coderslab;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.category.Category;
import pl.coderslab.place.Place;
import pl.coderslab.soil.Soil;

import java.util.List;


public interface PlantsRepository extends JpaRepository<Plants, Long> {

    Plants findPlantsByName(String name);
    Plants findPlantsById(Long id);


    void deletePlantsById(Long id);

    @Query("select p from Plants  p where p.soil.id=?1 and p.place.id=?1")
    List<Plants> findPlantsBySoilAndPlace(Long soilId, Long placeId);



}
