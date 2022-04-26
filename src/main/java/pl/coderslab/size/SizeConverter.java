package pl.coderslab.size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class SizeConverter implements Converter<String,Size> {

    @Autowired
    private SizeRepository sizeRepository;

    @Override
    public Size convert(String source) {
        return sizeRepository.findById(Long.parseLong(source));
    }
}
