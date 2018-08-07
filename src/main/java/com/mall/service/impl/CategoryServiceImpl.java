package com.mall.service.impl;

import com.mall.dao.CategoryMapper;
import com.mall.pojo.Category;
import com.mall.pojo.CategoryExample;
import com.mall.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements ICategoryService {


    @Autowired
    private CategoryMapper categoryMapper;


    @Override
    public List<Category> list() {
        CategoryExample categoryExample = new CategoryExample();
        categoryExample.setOrderByClause("id desc");
        return categoryMapper.selectByExample(categoryExample);
    }

    @Override
    public void addCategory(Category category) {
        categoryMapper.insert(category);
    }

    @Override
    public void deleteCategory(int id) {
        categoryMapper.deleteByPrimaryKey(id);
    }


    @Override
    public Category editCategory(int id){
        return categoryMapper.selectByPrimaryKey(id);
    }


    @Override
    public void updateCategory(Category category) {
        categoryMapper.updateByPrimaryKeySelective(category);
    }
}
