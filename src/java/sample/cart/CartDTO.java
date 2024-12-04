/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.cart;

/**
 *
 * @author nguye
 */
public class CartDTO {

    private String CartID;
    private int ProductID;
    private String InvID;
    private String UserID;
    private String ImageURL;
    private double Price;
    private double TotalPrice;
    private Integer Quantity;

    public CartDTO() {
    }

    public CartDTO(String CartID, int ProductID, String InvID, String UserID, String ImageURL, double Price, double TotalPrice, Integer Quantity) {
        this.CartID = CartID;
        this.ProductID = ProductID;
        this.InvID = InvID;
        this.UserID = UserID;
        this.ImageURL = ImageURL;
        this.Price = Price;
        this.TotalPrice = TotalPrice;
        this.Quantity = Quantity;
    }

    public String getCartID() {
        return CartID;
    }

    public void setCartID(String CartID) {
        this.CartID = CartID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
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

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String ImageURL) {
        this.ImageURL = ImageURL;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public double getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(double TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public Integer getQuantity() {
        return Quantity;
    }

    public void setQuantity(Integer Quantity) {
        this.Quantity = Quantity;
    }

}
