package com.formacionspringframework.ejercicios.ui.services;

import com.formacionspringframework.ejercicios.ui.model.response.PersonRest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

public interface PersonService {

    PersonRest getPerson();
    ResponseEntity<PersonRest> getDniPerson(@PathVariable String dni);

    ResponseEntity updatePerson(@RequestBody PersonRest newPerson, @PathVariable String dni);

}
