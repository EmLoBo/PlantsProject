package pl.coderslab.weather;


import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Weather {
    private Long id;

    public void setId(Long id) {
        this.id = id;
    }

    @Id
    public Long getId() {
        return id;
    }
}
