package com.foodordering.model;

/*
 * OOP Concepts:
 * - Encapsulation: All fields are private and accessed through public getter and setter methods.
 * - Data Abstraction: This class hides internal data representation from external classes.
 */

public class CustomerRead {

    // Private fields (Encapsulation)
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String email;

    // Public Getter and Setter for firstName
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    // Public Getter and Setter for lastName
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    // Public Getter and Setter for phoneNumber
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    // Public Getter and Setter for email
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
}
