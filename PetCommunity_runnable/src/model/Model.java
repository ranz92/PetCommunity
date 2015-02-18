package model;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.RollbackException;

import crawler.YelpAPITestV2;
import databeans.PhotoBean;
import databeans.UserBean;

public class Model {
	private PhotoDAO photoDAO;
	private UserDAO  userDAO;
	private TweetDAO tweetDAO;
	private YelpBusinessDAO bizDAO;
	
	

	public Model(ServletConfig config) throws ServletException {
		try {
			String jdbcDriver = config.getInitParameter("jdbcDriverName");
			String jdbcURL    = config.getInitParameter("jdbcURL");
			
			ConnectionPool pool = new ConnectionPool(jdbcDriver, jdbcURL);
			userDAO  = new UserDAO("user", pool);
			photoDAO = new PhotoDAO("photo", pool);
			tweetDAO = new TweetDAO("tweet", pool);
			bizDAO   =new YelpBusinessDAO("business",pool);
			
			YelpAPITestV2.execute();
			if(userDAO.getUsers().length==0) {
				UserBean user1 = new UserBean("aaa","aaa","aaa","aaa");
				PhotoBean photo11 = new PhotoBean();
				photo11.setUrl("http://www.sparkyhub.com/wp-content/uploads/2012/04/30-cute-puppies-you-will-want-to-take-home-with-you-27.jpg?d3b0cd");
//				photo11.setUrl("src/cat1.jpg");
				photo11.loadByteByURL();
				photo11.setContentType("jpg");
				photo11.setTweetId(1);
				photo11.setUserId(1);
				photo11.setCaption("Dog1");
				userDAO.create(user1);
				photoDAO.create(photo11);
				PhotoBean photo12 = new PhotoBean();
//				photo12.setUrl("http://www.hdwallpapers11.com/wallpapers/2560x1600/cute-white-dog-2560x1600.jpg");
				photo12.setUrl("http://fc00.deviantart.net/fs48/f/2009/152/3/5/About_World_by_BakaSaku.png");
				photo12.loadByteByURL();
				photo12.setContentType("jpg");
				photo12.setTweetId(2);
				photo12.setUserId(1);
				photo12.setCaption("Cat1");
				userDAO.create(user1);
				photoDAO.create(photo12);
				
				
				UserBean user2 = new UserBean("bbb","bbb","bbb","bbb");
				userDAO.create(user2);
				PhotoBean photo21 = new PhotoBean();
//				photo21.setUrl("https://www.petfinder.com/wp-content/uploads/2012/11/122163343-conditioning-dog-loud-noises-632x475.jpg");
				photo21.setUrl("http://upload.wikimedia.org/wikipedia/commons/9/99/Brooks_Chase_Ranger_of_Jolly_Dogs_Jack_Russell.jpg");
				photo21.loadByteByURL();
				photo21.setContentType("jpg");
				photo21.setTweetId(1);
				photo21.setUserId(2);
				photo21.setCaption("Dog2");
				photoDAO.create(photo21);
				PhotoBean photo22 = new PhotoBean();
//				photo12.setUrl("http://www.hdwallpapers11.com/wallpapers/2560x1600/cute-white-dog-2560x1600.jpg");
				photo22.setUrl("http://www.wallpaperhi.com/thumbnails/detail/20120117/White-Cat-1-9RQWRVR05W-1024x768.jpg");
				photo22.loadByteByURL();
				photo22.setContentType("jpg");
				photo22.setTweetId(2);
				photo22.setUserId(2);
				photo22.setCaption("Cat2");
				photoDAO.create(photo22);				
			}
		} catch (DAOException e) {
			throw new ServletException(e);
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public PhotoDAO getPhotoDAO() { return photoDAO; }
	public UserDAO  getUserDAO()  { return userDAO;  }
	public TweetDAO  getTweetrDAO()  { return tweetDAO;  }
	public YelpBusinessDAO  getBusinessDAO()  { return bizDAO;  }
	
}
