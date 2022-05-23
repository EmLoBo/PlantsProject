package pl.coderslab.category;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.category.Category;


public interface CategoryRepository extends JpaRepository<Category, String> {
   Category findByName(String name);
    Category findById(Long Id);

}
