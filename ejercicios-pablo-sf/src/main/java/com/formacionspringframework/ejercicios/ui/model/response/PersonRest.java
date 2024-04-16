package com.formacionspringframework.ejercicios.ui.model.response;

public class PersonRest {
    private String dni;
    private String firstName;
    private String firstSurName;
    private String secondSurName;
    private String birthdate;
    private String sex;
    private String completeName;

    public PersonRest(String firstName, String firstSurName, String secondSurName,
                      String birthdate, String sex) {
        this.firstName = firstName;
        this.firstSurName = firstSurName;
        this.secondSurName = secondSurName;
        this.birthdate = birthdate;
        this.sex = sex;
        this.completeName = this.getFirstName() + " " + this.getFirstSurName() + " " + this.getSecondSurName();
    }

    public PersonRest() {

    }

    public String getCompleteName() {
        return completeName;
    }

    public PersonRest(String dni, String firstName, String firstSurName, String secondSurName,
                  String birthdate, String sex) {
        this.dni = dni;
        this.firstName = firstName;
        this.firstSurName = firstSurName;
        this.secondSurName = secondSurName;
        this.birthdate = birthdate;
        this.sex = sex;
        this.completeName = this.getFirstName() + " " + this.getFirstSurName() + " " + this.getSecondSurName();
    }

    public void setCompleteName(String completeName) {
        this.completeName = completeName;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getFirstSurName() {
        return firstSurName;
    }

    public void setFirstSurName(String firstSurName) {
        this.firstSurName = firstSurName;
    }

    public String getSecondSurName() {
        return secondSurName;
    }

    public void setSecondSurName(String secondSurName) {
        this.secondSurName = secondSurName;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }


    public void setCompleteName(String firstName, String firstSurName, String secondSurName) {
        this.completeName = firstName + " " + firstSurName + " " + secondSurName;
    }

    public String printDataPerson() {
        return "Name: " + getFirstName() + ". " +
                "First surname: " + getFirstSurName() + ". " +
                "Second surname: " + getSecondSurName() + ". " +
                "Birthdate: " + getBirthdate() + ". " +
                "Sex: " + getSex() + ".";

    }


}