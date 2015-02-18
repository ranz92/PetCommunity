package crawler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import databeans.BusinessBean;

public class CrawlerDB {

	BusinessBean b= new BusinessBean();
	public CrawlerDB(BusinessBean bean){
		
		
		b=bean;
	}
    /**
     * 入口函数
     * @param arg
     */
    public  void create() {
        try {
            Connection con = null; //定义一个MYSQL链接对象
            Class.forName("com.mysql.jdbc.Driver").newInstance(); //MYSQL驱动
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "root", "rootadmin"); //链接本地MYSQL
            //con = DriverManager.getConnection("jdbc:mysql://task7.cuxzelmgyd6x.us-east-1.rds.amazonaws.com:3306/test", "awsuser", "team10-fs"); 

            Statement stmt; //创建声明
            stmt = con.createStatement();

            //新增一条数据
        //    stmt.executeUpdate("INSERT INTO business (id, display_address, image_url, is_closed, latitude, longitude, name, phone,rating, rating_img_url_small, review_count, url) VALUES ('1', '123456','123','123','123','123','123','123','123','123','213','213')");
            stmt.executeUpdate("INSERT INTO business (id, display_address, image_url, is_closed, latitude, longitude, name, phone,rating, rating_img_url_small, review_count, url) VALUES ('"+b.getId()+"', '"+b.getDisplay_address()+"','"+b.getImage_url()+"','"+b.getIs_closed()+"','"+b.getLatitude()+"','"+b.getLongitude()+"','"+b.getName()+"','"+b.getPhone()+"','"+b.getRating()+"','"+b.getRating_img_url_small()+"','"+b.getReview_count()+"','"+b.getUrl()+"')");

            ResultSet res = stmt.executeQuery("select LAST_INSERT_ID()");
            int ret_id;
            if (res.next()) {
                ret_id = res.getInt(1);
                System.out.print(ret_id);
            }

        } catch (Exception e) {
            System.out.print("MYSQL ERROR:" + e.getMessage());
        }

    }
}
