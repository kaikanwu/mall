package com.mall.service;

import com.mall.pojo.Product;

import java.util.List;

public interface IProductService {

    void addProduct(Product product);

    void deleteProduct(int id);

    Product getProduct(int id);

    void updateProduct(Product product);

    List<Product> list(int cid);

    void setFirstProductImage(Product product);

}
