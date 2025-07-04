package vn.Hieu.laptopshop.domain.dto;

import java.io.Serializable;

public class SaleDTO implements Serializable {

    private String month;
    private double revenue;

    // Constructor
    public SaleDTO(String month, double revenue) {
        this.month = month;
        this.revenue = revenue;
    }

    // Getters and Setters
    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    // Override toString()
    @Override
    public String toString() {
        return "SaleDTO{" +
                "month='" + month + '\'' +
                ", revenue=" + revenue +
                '}';
    }
}
