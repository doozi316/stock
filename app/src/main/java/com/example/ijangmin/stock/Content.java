package com.example.ijangmin.stock;



public class Content {

    String productName;
    String productNum;
    String productDate;
    String productManu;

    public String getNum(){
        return productNum;
    }

    public void setNum(String productNum){
        this.productNum= productNum;
    }

    public String getContent(){
        return productName;
    }

    public void setContent(String productName){
        this.productName= productName;
    }

    public String getDate(){
        return productDate;
    }

    public void setDate(String productDate){
        this.productDate = productDate;
    }

    public String getConManu(){
        return productManu;
    }

    public void setConManu(){
        this.productManu=productManu;
    }

    public Content(String productName,String productNum, String productManu, String productDate){
        this.productName=productName;
        this.productNum = productNum;
        this.productManu=productManu;
        this.productDate=productDate;

    }
}
