package pl.coderslab;


import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import pl.coderslab.admin.CurrentUser;
import pl.coderslab.admin.User;
import pl.coderslab.admin.UserRepository;
import pl.coderslab.api.TempAndWind;
import pl.coderslab.category.CategoryRepository;
import pl.coderslab.place.PlaceRepository;
import pl.coderslab.size.SizeRepository;
import pl.coderslab.soil.SoilRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.time.LocalDate;
import java.util.List;


@Controller
@RequestMapping("/plants")
public class PlantsController {

    private final PlantsRepository plantsRepository;
    private final CategoryRepository categoryRepository;
    private SizeRepository sizeRepository;
    private PlaceRepository placeRepository;
    private SoilRepository soilRepository;
    private final Validator validator;
    private final EmailRepository emailRepository;

    private final UserRepository userRepository;


    public PlantsController(PlantsRepository plantsRepository,
                            CategoryRepository categoryRepository, SizeRepository sizeRepository, PlaceRepository placeRepository, SoilRepository soilRepository, Validator validator, EmailRepository emailRepository, UserRepository userRepository) {
        this.plantsRepository = plantsRepository;
        this.categoryRepository = categoryRepository;
        this.sizeRepository = sizeRepository;
        this.placeRepository = placeRepository;
        this.soilRepository = soilRepository;
        this.validator = validator;
        this.emailRepository = emailRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("")
    public String plantsStart(@AuthenticationPrincipal CurrentUser customUser, RestTemplate restTemplate, Model model) throws Exception {

        if (customUser != null) {
            User entityUser = customUser.getUser();
            String yourLat = entityUser.getLatitude();
            String yourLon = entityUser.getLongitude();
            String firstName = entityUser.getFirstName();

            TempAndWind tempAndWind = restTemplate.getForObject(
                    "https://fcc-weather-api.glitch.me/api/current?lat=" + yourLon + "&lon=" + yourLat, TempAndWind.class);


            Double yourWind = tempAndWind.getWind().getSpeed();
            Double yourTemp = tempAndWind.getMain().getTemp();
            String drought = "Susza! Wieczorem podlej rośliny!!";
            String frost = "Przymrozek! Okryj delikatne rośliny!";
            String strongWind = "Mocny wiatr! Nie siej!";
            String gardenerAlert = "";
            if (yourTemp > 25.0) {
                gardenerAlert = drought;
            } else if (yourTemp < 0) {
                gardenerAlert = frost;
            } else if (yourWind > 20) {
                gardenerAlert = strongWind;
            } else {
                gardenerAlert = "Wiatr i temperatura w normie, dbaj o ogród jak zwykle";
            }


            model.addAttribute("yourWind", yourWind);
            model.addAttribute("yourTemp", yourTemp);
            model.addAttribute("yourLat", yourLat);
            model.addAttribute("yourLon", yourLon);
            model.addAttribute("gardenerAlert", gardenerAlert);
            model.addAttribute("firstName", firstName);

            return "plantsStart";
        } else {

            model.addAttribute("userEmail", new Emails());
            return "plantsStartEmpty";
        }

    }

    @PostMapping("")
    public String getUserEmail(@RequestParam Emails email, Model model) {
        emailRepository.save(email);
        return "plantsStart";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<Plants> allPlants = plantsRepository.findAll();
        model.addAttribute("plants", allPlants);
        return "plantsList3";
    }

    @PostMapping("/searchValue")
    public String search(@RequestParam String name, Model model) {
        Plants plant = plantsRepository.findPlantsByName(name);
        model.addAttribute("uPlants", plant);
        return "searchingPlant";
    }


    @Secured("ROLE_ADMIN")
    @GetMapping("/add")
    public String plantsForm(Model model) {
        model.addAttribute("plants", new Plants());

        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("sizes", sizeRepository.findAll());
        model.addAttribute("places", placeRepository.findAll());
        model.addAttribute("soiles", soilRepository.findAll());

        return "plantsAdd2";
    }


    @PostMapping(value = "/add")
    public String savePlants(@Valid Plants plants, BindingResult result, Model model) {

        if (result.hasErrors()) {
            model.addAttribute("categories", categoryRepository.findAll());
            model.addAttribute("sizes", sizeRepository.findAll());
            model.addAttribute("places", placeRepository.findAll());
            model.addAttribute("soiles", soilRepository.findAll());
            return "plantsAdd2";
        }

        plantsRepository.save(plants);
        return "redirect:/plants/list/";

    }

    @Secured("ROLE_ADMIN")
    @GetMapping(value = "/delete/{id}")
    public String deletePlant(@PathVariable long id) {
        plantsRepository.deleteById(id);
        return "redirect:/plants/list";
    }

    @Secured("ROLE_ADMIN")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable long id, Model model) {

        model.addAttribute("plants", plantsRepository.getById(id));

        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("sizes", sizeRepository.findAll());
        model.addAttribute("places", placeRepository.findAll());
        model.addAttribute("soiles", soilRepository.findAll());

        return "plantsAdd2";
    }

    @PostMapping("/edit/{id}")
    public String updateAdd(@PathVariable long id, Plants plants, BindingResult result, Model model) {
        model.addAttribute("plants", plantsRepository.getById(id));

        if (result.hasErrors()) {
            model.addAttribute("categories", categoryRepository.findAll());
            model.addAttribute("sizes", sizeRepository.findAll());
            model.addAttribute("places", placeRepository.findAll());
            model.addAttribute("soiles", soilRepository.findAll());
            return "plants/edit/{id}";
        }
        plantsRepository.save(plants);
        return "redirect:/plants/list";
    }

    @GetMapping("/getSpecification")
    public String getSpecification(Model model) {
        model.addAttribute("plants", new Plants());

        model.addAttribute("places", placeRepository.findAll());
        model.addAttribute("soiles", soilRepository.findAll());

        return "placeSpecification";
    }

    @GetMapping("/getSpecificationValue")
    public String userPlants(@RequestParam Long soil, @RequestParam Long place, Model model) {

        List<Plants> userPlants = plantsRepository.findPlantsBySoilAndPlace(soil, place);

        model.addAttribute("uPlants", userPlants);
        return "userPlantsList2";

    }


    @GetMapping("/calendar")
    public String calendar() {
        int month = LocalDate.now().getMonthValue();
        int day = LocalDate.now().getDayOfMonth();   //poprawna data

//        int day = ZonedDateTime.now().plus(Period.ofDays(143)).getDayOfMonth(); //do testowania
//        int month = ZonedDateTime.now().plus(Period.ofDays(143)).getMonthValue();

        if (month <= 6 && day <= 9) {
            return "redirect:/plants/leaf";
        }
        if (month <= 6 && day > 9 && day <= 18) {
            return "redirect:/plants/fruit";
        }
        if (month <= 6 && day > 18 && day <= 24) {
            return "redirect:/plants/bulb";
        }
        if (month <= 6 && day > 24 && day <= 31) {

            return "redirect:/plants/crop";
        }
        if (month >= 7 && month <= 10 && (day <= 5 || day > 27)) {
            return "redirect:/plants/leaf";
        }
        if (month >= 7 && month <= 10 && (day > 5 && day <= 11)) {
            return "redirect:/plants/fruit";
        }
        if ((month >= 7 && month <= 10) && (day > 11 && day <= 18)) {
            return "redirect:/plants/bulb";
        }
        if (month == 11 || month == 12 && day <= 10) {
            return "redirect:/plants/fruit";
        }
        if (month == 11 || month == 12 && day > 10 && day <= 16) {
            return "redirect:/plants/bulb";
        }
        if (month == 11 || month == 12 && day > 16 && day <= 25) {
            return "redirect:/plants/crop";
        }
        if (month == 11 || month == 12 && day > 25) {
            return "redirect:/plants/leaf";
        }

        return null;
    }

    @GetMapping("/bulb")
    public String bulb(Model model, String userDate) {
        model.addAttribute("userDate", userDate);
        return "bulb";
    }

    @GetMapping("/crop")
    public String crop(Model model, String userDate) {
        model.addAttribute("userDate", userDate);
        return "crop";
    }


    @GetMapping("/leaf")
    public String leaf(Model model, String userDate) {
        model.addAttribute("userDate", userDate);
        return "leaf";
    }

    @GetMapping("/fruit")
    public String fruit(Model model, String userDate) {
        model.addAttribute("userDate", userDate);
        return "fruit";
    }

    @GetMapping("/userCalendar")
    public String userCalendar(@RequestParam String userDate, Model model) {

        LocalDate userDate1 = LocalDate.parse(userDate);
        int month = userDate1.getMonthValue();
        int day = userDate1.getDayOfMonth();


        if (month <= 6 && day <= 9) {
            return "redirect:/plants/leaf";
        }
        if (month <= 6 && day > 9 && day <= 18) {
            return "redirect:/plants/fruit";
        }
        if (month <= 6 && day > 18 && day <= 24) {
            return "redirect:/plants/bulb";
        }
        if (month <= 6 && day > 24 && day <= 31) {
            return "redirect:/plants/crop";
        }
        if (month >= 7 && month <= 10 && (day <= 5 || day > 27)) {
            return "redirect:/plants/leaf";
        }
        if (month >= 7 && month <= 10 && (day > 5 && day <= 11)) {
            return "redirect:/plants/fruit";
        }
        if ((month >= 7 && month <= 10) && (day > 11 && day <= 18)) {
            return "redirect:/plants/bulb";
        }
        if (month == 11 || month == 12 && day <= 10) {
            return "redirect:/plants/fruit";
        }
        if (month == 11 || month == 12 && day > 10 && day <= 16) {
            return "redirect:/plants/bulb";
        }
        if (month == 11 || month == 12 && day > 16 && day <= 25) {
            return "redirect:/plants/crop";
        }
        if (month == 11 || month == 12 && day > 25) {
            return "redirect:/plants/leaf";
        }

        return null;
    }


}
