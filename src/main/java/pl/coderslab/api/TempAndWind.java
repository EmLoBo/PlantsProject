package pl.coderslab.api;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class TempAndWind {
    private final String drought = "Susza! Wieczorem podlej rośliny!!";
    private final String frost = "Przymrozek! Okryj delikatne rośliny!";
    private final String strongWind = "Mocny wiatr! Nie siej!";
    private final String normal = "Wiatr i temperatura w normie, dbaj o ogród jak zwykle";

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

    public String GardenerAllert(Double wind, Double temp) {

        if (temp > 25.0) {
            return drought;
        } else if (wind < 0) {
            return frost;
        } else if (wind > 20) {
            return strongWind;
        } else {
            return normal;
        }

    }
}
