/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author nguye
 */
public class ProductError {

    private int ProductID;
    private String Model;
    private double Price;
    private String Color;
    private String ImageURL;
    private int Status;

    public ProductError() {
        this.ProductID = 0;
        this.Model = "";
        this.Price = 0.0;
        this.Color = "";
        this.ImageURL = "";
        this.Status = 0;
    }

    public ProductError(int ProductID, String Model, double Price, String Color, String ImageURL, int Status) {
        this.ProductID = ProductID;
        this.Model = Model;
        this.Price = Price;
        this.Color = Color;
        this.ImageURL = ImageURL;
        this.Status = Status;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getModel() {
        return Model;
    }

    public void setModel(String Model) {
        this.Model = Model;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String ImageURL) {
        this.ImageURL = ImageURL;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }
  
}
