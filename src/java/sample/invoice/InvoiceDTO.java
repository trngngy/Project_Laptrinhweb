/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.invoice;

/**
 *
 * @author nguye
 */
public class InvoiceDTO {

    private String InvID;

    private String UserID;
    private String DateBuy;
    private String PhoneNumber;
    private String Email;
    private double Total;

    public InvoiceDTO() {
    }

    public InvoiceDTO(String InvID, String UserID, String DateBuy, String PhoneNumber, String Email, double Total) {
        this.InvID = InvID;
        this.UserID = UserID;
        this.DateBuy = DateBuy;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.Total = Total;
    }

    public String getInvID() {
        return InvID;
    }

    public void setInvID(String InvID) {
        this.InvID = InvID;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getDateBuy() {
        return DateBuy;
    }

    public void setDateBuy(String DateBuy) {
        this.DateBuy = DateBuy;
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

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }
    
   
}
