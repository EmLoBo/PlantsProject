package pl.coderslab.calendar;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.*;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class EkoCalendar {
    private Long id;


    public static void main(String[] args) {
//
//        ZonedDateTime warsawDateTime= ZonedDateTime.now(ZoneId.of("Europe/Warsaw"));
//        System.out.println(warsawDateTime);

        LocalDate localDate = LocalDate.now();
        String dataString = String.valueOf(localDate);
        System.out.println(localDate);

        ZonedDateTime Zonaday= ZonedDateTime.now().plus(Period.ofDays(3));
//        int day = Integer.parseInt(String.valueOf(Zonaday));

        int day= ZonedDateTime.now().plus(Period.ofDays(150)).getDayOfMonth();
        int month = ZonedDateTime.now().plus(Period.ofDays(150)).getMonthValue();
        System.out.println(day);
        System.out.println(month);

        if(dataString.equals("2022-04-14")){
            System.out.println("jesteś w kwadrze owocu,  sadź owocowe!");
        }



        if(localDate.isAfter(LocalDate.of(LocalDate.now().getYear(),  4, 10 ) )
                && localDate.isBefore(LocalDate.of(LocalDate.now().getYear(), 04, 16))){
            System.out.println("jesteś w kwadrze owocu,  tnij!");
        }

    }























    public void setId(Long id) {
        this.id = id;
    }

    @Id
    public Long getId() {
        return id;
    }
}
