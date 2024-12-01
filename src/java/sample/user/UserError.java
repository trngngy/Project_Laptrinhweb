/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author nguye
 */
public class UserError {
    private String UserID;
    private String FullName;
    private String RoleID;
    private String Password;
    private String PhoneNumber;
    private String Email;
    private String Confirm;

    public UserError() {
        this.UserID = "";
        this.FullName = "";
        this.RoleID = "";
        this.Password = "";
        this.PhoneNumber = "";
        this.Email = "";
        this.Confirm = "";
    }

    public UserError(String UserID, String FullName, String RoleID, String Password, String PhoneNumber, String Email, String Confirm) {
        this.UserID = UserID;
        this.FullName = FullName;
        this.RoleID = RoleID;
        this.Password = Password;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.Confirm = Confirm;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getRoleID() {
        return RoleID;
    }

    public void setRoleID(String RoleID) {
        this.RoleID = RoleID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getConfirm() {
        return Confirm;
    }

    public void setConfirm(String Confirm) {
        this.Confirm = Confirm;
    }


    
}

