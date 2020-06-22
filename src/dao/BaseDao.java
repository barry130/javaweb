package dao;

import java.sql.*;

public class BaseDao {
    final static String url = "jdbc:mysql://101.200.56.162:3306/javaweb?user=canace&password=123456";
    static Connection con = null;
    static Statement stmt = null;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url);
            stmt = con.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }



    public static boolean updatePassword(String name, String pass1, String pass2) {
        if (!login(name, pass1)) {
            System.err.println("初始密码错误");
            return false;
        }
        String sql = "update user set password='" + pass2 + "' where username='" + name + "'";

        boolean result = executeUpdate(sql);
        if (result) {
            System.err.println("修改密码成功");
        } else {
            System.err.println("修改密码失败");
        }
        return result;
    }

    public static boolean login(String name, String pass) {
        String sql = "select 1 from user where username='" + name + "' and password='" + pass + "' LIMIT 1";

        System.err.println(sql);
        boolean result = executeQuery(sql);
        if (result) {
            System.err.println("登录成功,username=" + name + ",password=" + pass);
        } else {
            System.err.println("登录失败,username=" + name + ",password=" + pass);
        }
        return result;
    }

    public static boolean executeQuery(String sql) {
        try {
            ResultSet rs = stmt.executeQuery(sql);
            return rs.next();
        } catch (SQLException e) {
            return false;
        }

    }

    public static boolean register(String name, String pass) {
        String sql = "select 1 from user where username='" + name + "'";
        if (executeQuery(sql)) {
            System.err.println("用户名已经存在,name=" + name);
            return false;
        }
        sql = "insert into user(username,password) VALUE('" + name + "','" + pass + "')";
        System.err.println(sql);
        boolean result = executeUpdate(sql);
        if (result) {
            System.err.println("注册成功,username=" + name + ",password=" + pass);
        } else {
            System.err.println("注册失败,username=" + name + ",password=" + pass);
        }
        return result;
    }

    public static boolean executeUpdate(String sql) {
        try {
            int affectedRows = stmt.executeUpdate(sql);
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}