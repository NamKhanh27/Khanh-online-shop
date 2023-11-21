/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Cart;
import Model.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author toden
 */
public class OrderDAO extends DAO {

    public OrderDAO() {
        super();
    }

    public List<Order> getAllOrder() {
        String sql = "select * from [Order]";
        List<Order> ord = new ArrayList<Order>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord.add(new Order(rs.getInt(1), rs.getDate(2), rs.getInt(3), rs.getDouble(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            status = "Error at read Category " + e.getMessage();

        }
        return ord;
    }

    public Order getOneOrder(int id) {
        String sql = "Select * from [Order] where order_id = ?";
        Order ord = new Order();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord = new Order(rs.getInt(1), rs.getDate(2), rs.getInt(3), rs.getDouble(4), rs.getInt(5));
            }
        } catch (Exception e) {
            status = "Error at read Category " + e.getMessage();

        }
        return ord;
    }

    @Override
    public boolean addOrder(int aid, List<Cart> carts) {
        double total = 0;
        for (Cart c : carts) {
            total += c.getPrice() * c.getAmmount();
        }
        String sql = "insert into [Order] values (?,?,?)";
        Date date = new Date();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(date.getTime()));
            ps.setInt(2, aid);
            ps.setDouble(3, total);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            status = "Error at addOrder " + e.getMessage();
        }
        return false;
    }

    @Override
    public boolean addOrder(int aid, Cart c) {
        String sql = "insert into [Order] values (?,?,?)";
        Date date = new Date();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(date.getTime()));
            ps.setInt(2, aid);
            ps.setDouble(3, c.getAmmount() * c.getPrice());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            status = "Error at addOrder " + e.getMessage();
        }
        return false;
    }

    @Override
    public int getNewestOrderId() {
        String sql = "select top 1 * from [Order] order by order_id desc";
        int id = 1;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            status = "Error at getNewestOrderId " + e.getMessage();
        }
        return id;
    }

    @Override
    public boolean addOrderDetail(List<Cart> carts) {
        String sql = "insert into OrderDetail values (?,?,?,?)";
        for (Cart c : carts) {
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, getNewestOrderId());
                ps.setInt(2, c.getProductId());
                ps.setInt(3, c.getAmmount());
                ps.setDouble(4, c.getPrice() * c.getAmmount());
                ps.executeUpdate();
                return true;
            } catch (Exception e) {
                status = "Error at addOrderDetail " + e.getMessage();
                return false;
            }
        }

        return true;
    }

    @Override
    public boolean addOrderDetail(Cart c) {
        String sql = "insert into OrderDetail values (?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, getNewestOrderId());
            ps.setInt(2, c.getProductId());
            ps.setInt(3, c.getAmmount());
            ps.setDouble(4, c.getPrice() * c.getAmmount());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            status = "Error at addOrderDetail " + e.getMessage();

        }
        return false;
    }

    public void updateOrder(Order order) {
        String sql = "update [Order] set total = ?,[status] = ? where order_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, order.getTotal());
            ps.setInt(2, order.getStatus());
            ps.setInt(3, order.getOrderId());
            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at addOrderDetail " + e.getMessage();

        }
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.getAllOrder());
    }
}
