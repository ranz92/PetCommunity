package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.RollbackException;

import databeans.BusinessBean;
import model.Model;
import model.YelpBusinessDAO;

public class BusinessAction extends Action{
	private YelpBusinessDAO  busDAO;

	public BusinessAction(Model model) {
    	busDAO = model.getBusinessDAO();
	}

    public String getName() { return "business.do"; }

    public String perform(HttpServletRequest request) {
    	HttpSession session = request.getSession();

    	List<String> errors = new ArrayList<String>();
        request.setAttribute("errors",errors);
        
        try {
			BusinessBean[] businessList = busDAO.getAllBusiness();
			session.setAttribute("businessList",businessList);
			//request.setAttribute("businessList",businessList);
	        return "yelpSearch.jsp";
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			errors.add(e.getMessage());
        	return "error.jsp";		} 
        
    }
}
