package com.example.ijangmin.stock;



public class Content {
    String num;
    String content;
    String date;
    String conManu;

    public String getNum(){
        return num;
    }

    public void setNum(String num){
        this.num= num;
    }

    public String getContent(){
        return content;
    }

    public void setContent(String content){
        this.content= content;
    }

    public String getDate(){
        return date;
    }

    public void setDate(String date){
        this.date = date;
    }

    public String getConManu(){
        return conManu;
    }

    public void setConManu(){
        this.conManu=conManu;
    }

    public Content(String content,String num, String conManu, String date){
        this.content=content;
        this.num = num;
        this.conManu=conManu;
        this.date=date;
    }
}
