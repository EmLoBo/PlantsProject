package pl.coderslab.api;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class TempAndWind {
    private Main main;
    private Wind wind;

    public TempAndWind() {
    }

    public Main getMain() {
        return main;
    }

    public void setMain(Main main) {
        this.main = main;
    }

    public Wind getWind() {
        return wind;
    }

    public void setWind(Wind wind) {
        this.wind = wind;
    }

    @Override
    public String toString() {
        return "TempAndWind{" +
                "main=" + main +
                ", wind=" + wind +
                '}';
    }
}
