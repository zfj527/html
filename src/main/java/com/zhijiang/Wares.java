package com.zhijiang;

/**
 * by zfj 527
 */
public class Wares {

    private int number;
    private int price;
    private String name;
    private String city;
    private int id;
    private  String picture;

    public Wares(int number, int price, String name, String city, int id, String picture) {
        this.number = number;
        this.price = price;
        this.name = name;
        this.city = city;
        this.id = id;
        this.picture = picture;
    }
    public Wares(){

    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
    public int getNumber() {
        return number;
    }

    public int getPrice() {
        return price;
    }

    public String getName() {
        return name;
    }

    public String getCity() {
        return city;
    }

    public int getId() {
        return id;
    }

    public String getPicture() {
        return picture;
    }
}
