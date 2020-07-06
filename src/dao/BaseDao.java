package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

public class BaseDao {
    final static String url = "jdbc:mysql://101.200.56.162:3306/javaweb?user=canace&password=123456&useUnicode=true&characterEncoding=utf8";
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

    private static String MD5(String password) {

        try {
            // 得到一个信息摘要器
            MessageDigest digest = MessageDigest.getInstance("md5");
            byte[] result = digest.digest(password.getBytes());
            StringBuffer buffer = new StringBuffer();
            // 把每一个byte 做一个与运算 0xff;
            for (byte b : result) {
                // 与运算
                int number = b & 0xff;// 加盐
                String str = Integer.toHexString(number);
                if (str.length() == 1) {
                    buffer.append("0");
                }
                buffer.append(str);
            }

            // 标准的md5加密后的结果
            return buffer.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return "";
        }

    }

    public static boolean updatePassword(String name, String pass1, String pass2) {
        if (!login(name, pass1)) {
            System.err.println("初始密码错误");
            return false;
        }
        String sql = "update user set password='" + MD5(pass2) + "' where username='" + name + "'";

        boolean result = executeUpdate(sql);
        if (result) {
            System.err.println("修改密码成功");
        } else {
            System.err.println("修改密码失败");
        }
        return result;
    }

    public static boolean login(String name, String pass) {
        String sql = "select username,password from user where username='" + name + "' and password='" +MD5(pass) + "' LIMIT 1";

   //     System.err.println(sql);
        boolean result = executeQuery(sql);
        if (result) {
            System.err.println("登录成功,username=" + name + ",password=" + pass);
        } else {
            System.err.println("登录失败,username=" + name + ",password=" + pass);
        }
        return result;
    }

    private static boolean executeQuery(String sql) {
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
      //  System.err.println(sql);

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
        sql = "insert into user(username,password) VALUE('" + name + "','" + MD5(pass) + "')";
     //   System.err.println(sql);
        boolean result = executeUpdate(sql);
        if (result) {
            System.err.println("注册成功,username=" + name + ",password=" + pass);
        } else {
            System.err.println("注册失败,username=" + name + ",password=" + pass);
        }
        return result;
    }

    public static boolean insert(String name,String time,String studytime,String content,String remark) {
        String sql = "insert into daka(username,dakatime,studytime,studycontent,remark) VALUE('" + name + "','" + time + "','" + studytime + "','" + content + "','" + remark + "')";
           System.err.println(sql);
        boolean result = executeUpdate(sql);
        if (result) {
            System.err.println("打卡成功");
        } else {
            System.err.println("打卡失败");
        }
        return result;
    }


    public static boolean insert_schedule(String name,String time,String starttime,String endtime,String studycontent) {
        String sql = "insert into schedule(username,inserttime,starttime,endtime,studycontent) VALUE('" + name + "','" + time + "','" + starttime + "','" + endtime + "','" + studycontent + "')";
        System.err.println(sql);
        boolean result = executeUpdate(sql);
        if (result) {
            System.err.println("计划表插入成功！");
        } else {
            System.err.println("计划表插入失败！");
        }
        return result;
    }


    public static boolean insert_num(String name,int num) {
        String sql = "update user set num='"+num+"'where username='"+name+"'";
        System.err.println(sql);
        boolean result = executeUpdate(sql);
        if (result) {
            System.err.println("连续打卡成功");
        } else {
            System.err.println("打卡失败");
        }
        return result;
    }

    private static boolean executeUpdate(String sql) {
        try {
            int affectedRows = stmt.executeUpdate(sql);
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}