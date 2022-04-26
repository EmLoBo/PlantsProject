package pl.coderslab;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.format.FormatterRegistry;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.LocaleContextResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import pl.coderslab.api.TempAndWind;
import pl.coderslab.category.CategoryConverter;
import pl.coderslab.place.PlaceConverter;
import pl.coderslab.size.SizeConverter;
import pl.coderslab.soil.SoilConverter;

import javax.validation.Validator;
import java.util.Locale;

@SpringBootApplication
public class Application {
    private static final Logger log =
            LoggerFactory.getLogger(Application.class);

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);

    }


    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(getCategoryConverter());
        registry.addConverter(getPlaceConverter());
        registry.addConverter(getSizeConverter());
        registry.addConverter(getSoilConverter());

    }


    @Bean
    public CategoryConverter getCategoryConverter() {

        return new CategoryConverter();
    }

    @Bean
    public PlaceConverter getPlaceConverter() {
        return new PlaceConverter();
    }

    @Bean
    public SizeConverter getSizeConverter() {
        return new SizeConverter();
    }

    @Bean
    public SoilConverter getSoilConverter() {
        return new SoilConverter();
    }


    @Bean(name = "localeResolver")
    public LocaleContextResolver getLocaleContextResolver() {
        SessionLocaleResolver localeResolver = new SessionLocaleResolver();
        localeResolver.setDefaultLocale(new Locale("pl", "PL"));
        return localeResolver;
    }

    @Bean
    public Validator validator() {
        return new LocalValidatorFactoryBean();
    }


    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder) {
        return builder.build();
        //do przerobienia danych
    }

    @Bean
    public CommandLineRunner run(RestTemplate restTemplate) throws Exception {
        return args -> {
            TempAndWind tempAndWind = restTemplate.getForObject(
                    "https://fcc-weather-api.glitch.me/api/current?lat=50.79&lon=16.79", TempAndWind.class);
            log.info(tempAndWind.toString());
        };
    }

}
