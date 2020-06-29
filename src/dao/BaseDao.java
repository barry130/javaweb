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
        String sql = "select username,password from user where username='" + name + "' and password='" + pass + "' LIMIT 1";

   //     System.err.println(sql);
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

    public static boolean isdaka(String name,String time1,String time2)
    {
        String sql="select * from daka where username='" + name + "'AND dakatime between '"+ time1 +"' AND '"+ time2 +"' ";
        System.err.println(sql);

        boolean result = executeQuery(sql);
        if (result) {
            System.err.println("今日已打卡");
        } else {
            System.err.println("打卡成功");
        }
        return result;
    }


    public static boolean register(String name, String pass) {
        String sql = "select username from user where username='" + name + "'";
        if (executeQuery(sql)) {
            System.err.println("用户名已经存在,name=" + name);
            return false;
        }
        sql = "insert into user(username,password,qx) VALUE('" + name + "','" + pass + "','0')";
        System.err.println(sql);
        boolean result = executeUpdate(sql);
        if (result) {
            System.err.println("注册成功,username=" + name + ",password=" + pass);
        } else {
            System.err.println("注册失败,username=" + name + ",password=" + pass);
        }
        return result;
    }

    public static boolean insert(String name,String time,String num,String content)
    {
        String sql="insert into daka(username,dakatime,num,remark) VALUE('" + name + "','" + time + "','" + num + "','" + content + "')";
    //    System.err.println(sql);
        boolean result = executeUpdate(sql);
        if (result) {
            System.err.println("打卡成功");
        } else {
            System.err.println("打卡失败");
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