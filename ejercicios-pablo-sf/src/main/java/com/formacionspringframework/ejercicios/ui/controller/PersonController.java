package com.formacionspringframework.ejercicios.ui.controller;


import com.formacionspringframework.ejercicios.ui.model.response.PersonRest;
import com.formacionspringframework.ejercicios.ui.services.implement.PersonServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping //http://localhost:8080/persons
public class PersonController {

    @Autowired
    PersonServiceImpl personService;

    PersonRest personRest;
    //EJERCICIO 1
    // Método para obtener información de usuarios
    @GetMapping(path = "/persons",
            produces = {
                    MediaType.APPLICATION_JSON_VALUE
            })
     public ResponseEntity<PersonRest> getPerson(){
        PersonRest personRest = personService.getPerson();

        return new ResponseEntity<PersonRest>(personRest, HttpStatus.OK);
    }

    @GetMapping(path = "/persons/{dni}") // Método para mostrar  los datos de una persona correspondientes a un dni
    public ResponseEntity<PersonRest> getDniPerson(@PathVariable String dni){

        return personService.getDniPerson(dni);
    }

    // EJERCICIO 2
    // Método para establecer peticiones post
    @PostMapping(path = "/sendForm",
            consumes = {
                    MediaType.APPLICATION_JSON_VALUE
            },
            produces = {
                    MediaType.APPLICATION_JSON_VALUE
            })
    // Se establecen los parámetros que formarán la url
    public ResponseEntity<PersonRest> createPerson(
                        @RequestParam(value = "firstName") String firstName,
                        @RequestParam(value = "firstSurName") String firstSurName,
                        @RequestParam(value = "secondSurName") String secondSurName,
                        @RequestParam(value = "birthdate") String birthdate,
                        @RequestParam(value = "sex") String sex
    ){
        PersonRest personRest = new PersonRest();
        personRest.setFirstName(firstName);
        personRest.setFirstSurName(firstSurName);
        personRest.setSecondSurName(secondSurName);
        personRest.setBirthdate(birthdate);
        personRest.setSex(sex);


        System.out.println(personRest.printDataPerson());

    // El método devuelve el objeto de la persona que se ha creado y el estado de la solicitud http
        return new ResponseEntity<PersonRest>(personRest, HttpStatus.OK);

    }
    // Actualizar la información sobre los usuarios
    @PutMapping(path = "/persons/{dni}",
            consumes = {
                    MediaType.APPLICATION_JSON_VALUE
            },
            produces = {
                    MediaType.APPLICATION_JSON_VALUE
            })
    public ResponseEntity updatePerson(@RequestBody PersonRest newPerson, @PathVariable String dni){

        return personService.updatePerson(newPerson, dni);
    }

}


