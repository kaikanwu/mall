package com.mall.service.impl;

import com.mall.dao.CategoryMapper;
import com.mall.pojo.Category;
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
        return categoryMapper.list();
    }

    @Override
    public void addCategory(Category category) {
        categoryMapper.add(category);
    }

    @Override
    public void deleteCategory(int id) {
        categoryMapper.delete(id);
    }


    @Override
    public Category editCategory(int id){
        return  categoryMapper.edit(id);
    }


    @Override
    public void updateCategory(Category category) {
        categoryMapper.update(category);
    }
}
