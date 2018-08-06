package com.mall.service;

import com.mall.pojo.Category;

import java.util.List;

public interface ICategoryService {

    List<Category> list();

    void addCategory(Category category);

    void deleteCategory(int id);

    Category editCategory(int id);

    void updateCategory(Category category);

}
