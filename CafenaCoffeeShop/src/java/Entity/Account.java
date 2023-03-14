/*
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Asus
 */
public class Account {

    private String firstName;
    private String lastName;
    private String phone;
    private String address;
    private String email;
    private String password;
    private String access;

    public Account() {
    }

    public Account(String firstName, String lastName, String phone, String address, String email, String password, String access) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.password = password;
        this.access = access;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public String getName() {
        return firstName + " " + lastName;
    }
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }

    @Override
    public String toString() {
        return "Account{" + "firstName=" + firstName + ", lastName=" + lastName + ", phone=" + phone + ", address=" + address + ", email=" + email + ", password=" + password + ", access=" + access + '}';
    }

}
