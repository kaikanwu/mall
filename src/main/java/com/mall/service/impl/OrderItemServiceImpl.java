package com.mall.service.impl;

import com.mall.dao.OrderItemMapper;

import com.mall.pojo.OrderItem;
import com.mall.pojo.OrderItemExample;
import com.mall.pojo.Orders;

import com.mall.pojo.Product;
import com.mall.service.IOrderItemService;
import com.mall.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemServiceImpl implements IOrderItemService {

    @Autowired
    OrderItemMapper orderItemMapper;
    @Autowired
    IProductService iProductService;

    @Override
    public void add(OrderItem orderItem) {
        orderItemMapper.insert(orderItem);
    }

    @Override
    public void delete(int id) {
        orderItemMapper.deleteByPrimaryKey(id);

    }

    @Override
    public OrderItem get(int id) {

        OrderItem orderItem = orderItemMapper.selectByPrimaryKey(id);
        setProduct(orderItem);
        return orderItem;
    }

    @Override
    public void update(OrderItem orderItem) {

    }

    @Override
    public List<OrderItem> list() {
        OrderItemExample orderItemExample =new OrderItemExample();
        orderItemExample.setOrderByClause("id desc");
        return orderItemMapper.selectByExample(orderItemExample);

    }

    @Override
    public void fill(List<Orders> ordersList) {

        for (Orders orders : ordersList) {

            fill(orders);
        }

    }

    @Override
    public void fill(Orders orders) {

        float totalPrice = 0;
        int itemNumber = 0;

        OrderItemExample orderItemExample =new OrderItemExample();
        orderItemExample.createCriteria().andOidEqualTo(orders.getId());
        orderItemExample.setOrderByClause("id desc");
        List<OrderItem> orderItemList =orderItemMapper.selectByExample(orderItemExample);
        setProduct(orderItemList);


        for (OrderItem orderItem : orderItemList) {
            totalPrice+=orderItem.getNumber()*orderItem.getProduct().getPrice();
            itemNumber+=orderItem.getNumber();
        }
        orders.setTotalPrices(totalPrice);
        orders.setItemNumber(itemNumber);
        orders.setOrderItemList(orderItemList);
    }



    public void setProduct(List<OrderItem> orderItemList){
        for (OrderItem orderItem: orderItemList) {
            setProduct(orderItem);
        }
    }

    private void setProduct(OrderItem orderItem) {
        Product product = iProductService.getProduct(orderItem.getPid());
        orderItem.setProduct(product);
    }
}
