package com.mall.service.impl;

import com.mall.dao.ProductImageMapper;
import com.mall.pojo.ProductImage;
import com.mall.pojo.ProductImageExample;
import com.mall.service.IProductImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductImageServiceImpl implements IProductImageService {

    @Autowired
    ProductImageMapper productImageMapper;

    @Override
    public void add(ProductImage productImage) {
        productImageMapper.insert(productImage);

    }

    @Override
    public void delete(int id) {
        productImageMapper.deleteByPrimaryKey(id);
    }

    @Override
    public ProductImage get(int id) {

        return productImageMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(ProductImage productImage) {

        productImageMapper.updateByPrimaryKeySelective(productImage);
    }

    @Override
    public List list(int pid, String imageType) {

        ProductImageExample productImageExample = new ProductImageExample();
        productImageExample.createCriteria().andPidEqualTo(pid).andTypeEqualTo(imageType);

        productImageExample.setOrderByClause("id desc");
        return productImageMapper.selectByExample(productImageExample);
    }
}
