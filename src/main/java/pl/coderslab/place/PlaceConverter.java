package pl.coderslab.place;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class PlaceConverter implements Converter<String, Place> {

    @Autowired
    private PlaceRepository placeRepository;

    @Override
    public Place convert(String source) {
        return placeRepository.findById(Long.parseLong(source));
    }
}
