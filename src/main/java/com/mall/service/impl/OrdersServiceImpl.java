package com.mall.service.impl;

import com.mall.dao.OrdersMapper;
import com.mall.pojo.Orders;
import com.mall.pojo.OrdersExample;
import com.mall.pojo.User;
import com.mall.service.IOrderItemService;
import com.mall.service.IOrdersService;
import com.mall.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements IOrdersService {

    @Autowired
    OrdersMapper ordersMapper;

    @Autowired
    IUserService iUserService;

    @Override
    public void add(Orders orders) {

        ordersMapper.insert(orders);

    }

    @Override
    public void delete(int id) {

        ordersMapper.deleteByPrimaryKey(id);

    }

    @Override
    public Orders get(int id) {
        return ordersMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Orders orders) {

        ordersMapper.updateByPrimaryKeySelective(orders);
    }

    @Override
    public List<Orders> list() {

        OrdersExample ordersExample = new OrdersExample();
        ordersExample.setOrderByClause("id desc");
        List<Orders> ordersList = ordersMapper.selectByExample(ordersExample);
        setUser(ordersList);
        return ordersList;
    }


    public void setUser(List<Orders> ordersList){
        for (Orders orders : ordersList)
            setUser(orders);
    }
    public void setUser(Orders orders){
        int uid = orders.getUid();
        User user = iUserService.get(uid);
        orders.setUser(user);
    }
}
