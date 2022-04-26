package pl.coderslab.soil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;



public class SoilConverter implements Converter<String, Soil> {
    @Autowired
    private SoilRepository soilRepository;

    @Override
    public Soil convert(String source) {
        return soilRepository.findById(Long.parseLong(source));
    }
}
