package model;

import java.util.Arrays;
import java.util.Comparator;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;
import org.genericdao.MatchArg;
import org.genericdao.RollbackException;
import org.genericdao.Transaction;

import databeans.PhotoBean;

public class PhotoDAO extends GenericDAO<PhotoBean> {
	public PhotoDAO(String tableName, ConnectionPool pool) throws DAOException {
		super(PhotoBean.class, tableName, pool);
	}

	public void create(PhotoBean newPhoto) throws RollbackException {
		try {
			Transaction.begin();
			createAutoIncrement(newPhoto);
			Transaction.commit();
		} finally {
			if (Transaction.isActive()) Transaction.rollback();
		}
	}

	public void delete(int photoId, int userId) throws RollbackException {
		try {
			Transaction.begin();
			PhotoBean p = read(photoId);

    		if (p == null) {
				throw new RollbackException("Photo does not exist: id="+photoId);
    		}

    		if (!(userId == p.getUserId())) {
				throw new RollbackException("Photo not owned by "+userId);
    		}

			delete(photoId);
			Transaction.commit();
		} finally {
			if (Transaction.isActive()) Transaction.rollback();
		}
	}
	
	public PhotoBean[] getPhotos(int userId) throws RollbackException {
		PhotoBean[] list = match(MatchArg.equals("userId",userId));
		return list;
	}
	
	public PhotoBean getPhotoById(int photoId) throws RollbackException {
		PhotoBean[] list = match(MatchArg.equals("photoId",photoId));
		return list[0];
	}
	
	public PhotoBean[] getAllPhotos() throws RollbackException {
		PhotoBean[] list = match(MatchArg.notEquals("userId",-1));
		Arrays.sort(list, new Comparator<PhotoBean>(){

			@Override
			public int compare(PhotoBean o1, PhotoBean o2) {
				// TODO Auto-generated method stub
				return o1.getUserId() - o2.getUserId();
			}
			
		});
		return list;
	}
	
	public void vote(int id) throws RollbackException {
		try {
			Transaction.begin();
			PhotoBean p = read(id);
			p.setVote(p.getVote()+1);
			update(p);
			Transaction.commit();
		} finally {
			if (Transaction.isActive()) Transaction.rollback();
		}
		
	}
}
