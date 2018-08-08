package com.mall.service;

import com.mall.pojo.Orders;

import java.util.List;

public interface IOrdersService {

    void add(Orders orders);

    void delete(int id);

    Orders get(int id);

    void update(Orders orders);

    List list();
}
