package model;

import java.util.Arrays;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;
import org.genericdao.RollbackException;
import org.genericdao.Transaction;

import databeans.TweetBean;


public class TweetDAO extends GenericDAO<TweetBean> {
	
	public TweetDAO(String tableName, ConnectionPool pool) throws DAOException {
		super(TweetBean.class, tableName, pool);
	}

	public TweetBean[] getTweets() throws RollbackException {
		TweetBean[] tweets = match();
		Arrays.sort(tweets);  // We want them sorted by last and first names (as per User.compareTo());
		return tweets;
	}
	
}
