package com.formacionspringframework.ejercicios.ui.services.implement;

import com.formacionspringframework.ejercicios.ui.model.response.PersonRest;
import com.formacionspringframework.ejercicios.ui.model.response.Personas;
import com.formacionspringframework.ejercicios.ui.services.PersonService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class PersonServiceImpl implements PersonService {
    Personas personas = new Personas();

    @Override
    public PersonRest getPerson() {
        PersonRest personRest = new PersonRest();

        personRest.setFirstName("Arya");
        personRest.setFirstSurName("Stark");
        personRest.setSecondSurName("Nimeria");
        personRest.setBirthdate("07-01-1985");
        personRest.setSex("Female");
        personRest.setCompleteName(
                personRest.getFirstName(),
                personRest.getFirstSurName(),
                personRest.getSecondSurName()
        );

        return personRest;
    }

    @Override
    public ResponseEntity<PersonRest> getDniPerson(String dni) {
        for(PersonRest personDni : personas.getPersonsList()){
            if(personDni.getDni().equals(dni)){
                return new ResponseEntity<PersonRest>(personDni, HttpStatus.OK);
            }
        }

        return new ResponseEntity<PersonRest>(HttpStatus.NO_CONTENT);
    }

    @Override
    public ResponseEntity updatePerson(PersonRest newPerson, String dni) {
        PersonRest updatePer = new PersonRest();
        for(PersonRest personRest: personas.getPersonsList()){
            if(personRest.getDni().equals(dni)){
                personRest.setFirstName(newPerson.getFirstName());
                personRest.setFirstSurName(newPerson.getFirstSurName());
                personRest.setSecondSurName(newPerson.getSecondSurName());
                personRest.setBirthdate(newPerson.getBirthdate());
                personRest.setSex(newPerson.getSex());
                personRest.setCompleteName(newPerson.getCompleteName());

                updatePer = personRest;
                return new ResponseEntity(updatePer, HttpStatus.OK);
            }
        }
        return new ResponseEntity(HttpStatus.NO_CONTENT);
    }


}
