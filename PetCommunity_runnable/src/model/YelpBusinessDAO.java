package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;
import org.genericdao.RollbackException;
import org.genericdao.Transaction;

import databeans.BusinessBean;

public class YelpBusinessDAO extends GenericDAO<BusinessBean>{
	public YelpBusinessDAO(String tableName, ConnectionPool pool) throws DAOException {
		super(BusinessBean.class, tableName, pool);
	}
	

	public void create(BusinessBean newBusiness) throws RollbackException {
		try {
			Transaction.begin();
			createAutoIncrement(newBusiness);
			Transaction.commit();
		} finally {
			if (Transaction.isActive()) Transaction.rollback();
		}
	}
	
	public BusinessBean[] getAllBusiness() throws RollbackException {
		BusinessBean[] bizList = match();
		//Arrays.sort(list, new Comparator<BusinessBean>(){

		return bizList;
	}
	
}
