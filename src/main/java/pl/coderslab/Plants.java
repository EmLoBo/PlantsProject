package pl.coderslab;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.category.Category;
import pl.coderslab.place.Place;
import pl.coderslab.size.Size;
import pl.coderslab.soil.Soil;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="plants")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Plants {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty
    private String name;
    @ManyToOne
    private Category category;
    @ManyToOne
    private Size size;
    @ManyToOne
    private Place place;
    @ManyToOne
    private Soil soil;



}
