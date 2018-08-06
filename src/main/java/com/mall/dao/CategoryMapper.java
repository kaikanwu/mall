package com.mall.dao;

import com.mall.pojo.Category;

import java.util.List;

public interface CategoryMapper {

    List<Category> list();

    void add(Category category);

    void delete(int id);

    Category edit(int id);

    void update(Category category);
}
