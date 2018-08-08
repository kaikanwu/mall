package com.mall.service;

import com.mall.pojo.OrderItem;
import com.mall.pojo.Orders;


import java.util.List;

public interface IOrderItemService {

    void add(OrderItem orderItem);

    void delete(int id);

    OrderItem get(int id);

    void update(OrderItem orderItem);

    List list();

    void fill(List<Orders> ordersList);


    void fill(Orders orders);
}
