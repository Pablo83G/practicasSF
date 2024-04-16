package com.formacionspringframework.ejercicios.ui.model.response;

import java.util.ArrayList;

public class Personas {
    // Vamos a guardar una lista de personas
    private ArrayList<PersonRest> personsList;

    public Personas() {
        personsList = new ArrayList<>(); // Inicializamos la lista

        //1
        addPerson("00000001A","Pablo","Valverde",
                "Olmos","26-05-1983","Male");
        //2
        addPerson("00000002B","Maria","Martín",
                "Bolaños","22-08-1978","Female");
        //3
        addPerson("00000003C","Antonio","Pichin",
                "Pachan","11-02-1988","Male");
        //4
        addPerson("00000004D","Juan","Perez",
                "Calamidad","06-11-1994","Male");
        //5
        addPerson("00000005E","Ruth","Palito",
                "Pelota","16-11-2000","Female");
        //6
        addPerson("00000006F","Asier","Bruto",
                "Cordero","22-10-1967","Male");
        //7
        addPerson("00000007G","Pepito","Marmota",
                "Podenco","07-01-1985","Male");
        //8
        addPerson("00000008H","Sara","Perez",
                "Romina","06-09-1997","Female");
        //9
        addPerson("00000009I","Arya","Stark",
                "Nimeria","07-01-1985","Female");
        //10
        addPerson("00000010J","Charly","Santos",
                "Galdos","30-05-2001","Female");

    }

    public void addPerson(String dni, String firstName, String firstSurName, String secondSurName,
                          String birthdate, String sex){
        PersonRest person = new PersonRest(dni,firstName,firstSurName,secondSurName,birthdate,sex);
        personsList.add(person);
    }

    public ArrayList<PersonRest> getPersonsList() {
        return personsList;
    }

    public void setPersonsList(ArrayList<PersonRest> personsList) {
        this.personsList = personsList;
    }
}
