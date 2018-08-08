package com.mall.service;

import com.mall.pojo.Product;
import com.mall.pojo.ProductImage;

import java.util.List;

public interface IProductImageService {

    String firstImage = "firstImage";
    String detailImage = "detailImage";

    void add(ProductImage productImage);

    void delete(int id);

    ProductImage get(int id);

    void update(ProductImage productImage);

    List list(int pid, String imageType);

}
