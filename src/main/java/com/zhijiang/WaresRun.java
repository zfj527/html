package com.zhijiang;
import java.sql.*;

import java.util.ArrayList;

public class WaresRun {
    public WaresRun(){

    }
    public ArrayList<Wares> GetAllGood() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Wares>  list = new ArrayList<Wares>();    //商品集合
        try {
            conn = GetMysql.getConnection();
            String sql = "SELECT * FROM good;";           //SQL语句
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Wares it = new Wares();
                it.setId(rs.getInt("id"));
                it.setName(rs.getString("name"));
                it.setCity(rs.getString("city"));
                it.setNumber(rs.getInt("number"));
                it.setPrice(rs.getInt("price"));
                it.setPicture(rs.getString("picture"));
                list.add(it);    //把一个商品加入集合
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            //释放数据集对象
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            //释放语句对象
            if(stmt != null) {
                try {
                    stmt.close();
                    stmt = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
    //根据商品编号获得商品信息
    public Wares FindGoodById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = GetMysql.getConnection();
            String sql = "SELECT * FROM good WHERE id=?;";           //SQL语句
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                Wares it = new Wares();
                it.setId(rs.getInt("id"));
                it.setName(rs.getString("name"));
                it.setCity(rs.getString("city"));
                it.setNumber(rs.getInt("number"));
                it.setPrice(rs.getInt("price"));
                it.setPicture(rs.getString("picture"));
                return it;
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            //释放数据集对象
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            //释放语句对象
            if(stmt != null) {
                try {
                    stmt.close();
                    stmt = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
}

