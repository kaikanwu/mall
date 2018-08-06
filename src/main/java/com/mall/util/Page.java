package com.mall.util;

public class Page {

    private int startPage;

    private int numbersOfEachPage;

    private int total;

    private String param;


    public Page() {
        numbersOfEachPage = 2;
    }


    public Page(int startPage, int numbersOfEachPage){

        this();
        this.startPage =startPage;
        this.numbersOfEachPage = numbersOfEachPage;
    }


    public boolean isHasPrevious() {
        if (startPage == 0) {
            return false;
        }

        return true;
    }

    public boolean isHasNext() {
        if (startPage == getLast()) {
            return false;
        }

        return true;

    }


    public int getTotalPage() {
        int totalPage;

        if (0 == total % numbersOfEachPage) {
            totalPage = total/numbersOfEachPage;
        }
        else totalPage = total/numbersOfEachPage +1 ;

        if (totalPage == 0)
            totalPage =1;
        return totalPage;

    }


    public int getLast() {
        int last;
        if (0 == total % numbersOfEachPage) {
            last = total- numbersOfEachPage;
        }


        else
            last = total- total%numbersOfEachPage;
        last = last<0?0:last;
        return last;
    }


    @Override
    public String toString() {
        return "Page{" +
                "startPage=" + startPage +
                ", numbersOfEachPage=" + numbersOfEachPage +
                ", total=" + total +
                ", param='" + param + '\'' +
                '}';
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getNumbersOfEachPage() {
        return numbersOfEachPage;
    }

    public void setNumbersOfEachPage(int numbersOfEachPage) {
        this.numbersOfEachPage = numbersOfEachPage;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }


}
