package com.mall.service.impl;

import com.mall.dao.CategoryMapper;
import com.mall.dao.ProductMapper;
import com.mall.pojo.Category;
import com.mall.pojo.Product;
import com.mall.pojo.ProductExample;
import com.mall.pojo.ProductImage;
import com.mall.service.ICategoryService;
import com.mall.service.IProductImageService;
import com.mall.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    private ICategoryService iCategoryService;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private IProductImageService iProductImageService;

    @Override
    public void addProduct(Product product) {
        productMapper.insert(product);
    }

    @Override
    public void deleteProduct(int id) {
        productMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Product getProduct(int id) {
        Product product = productMapper.selectByPrimaryKey(id);

        setFirstProductImage(product);
        setCategory(product);
        return product;
    }

    @Override
    public void updateProduct(Product product) {
        productMapper.updateByPrimaryKeySelective(product);
    }

    @Override
    public List<Product> list(int cid) {
        ProductExample productExample = new ProductExample();
        productExample.createCriteria().andCidEqualTo(cid);
        productExample.setOrderByClause("id desc");
        List productList = productMapper.selectByExample(productExample);
        setCategory(productList);

        setFirstProductImage(productList);
        return productList;
    }


    /**
     * set the category by product
     * @param product
     */
    public void setCategory(Product product) {
        int cid = product.getCid();
        Category category = iCategoryService.editCategory(cid);
        product.setCategory(category);
    }

    public void setCategory(List<Product> products) {
        for (Product product : products) {
            setCategory(product);
        }
    }


    @Override
    public void setFirstProductImage(Product product) {
        List<ProductImage> productImageList = iProductImageService.list(product.getId(), IProductImageService.firstImage);
        if (!productImageList.isEmpty()) {
            ProductImage productImage = productImageList.get(0);
            product.setFirstProductImage(productImage);
        }
    }

    public void setFirstProductImage(List<Product> productList) {
        for (Product product : productList) {
            setFirstProductImage(product);
        }
    }




}
