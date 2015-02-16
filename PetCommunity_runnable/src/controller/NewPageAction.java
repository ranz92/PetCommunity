package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Model;
import model.PhotoDAO;
import model.UserDAO;

import org.genericdao.RollbackException;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;

import databeans.PhotoBean;
import databeans.UserBean;
import formbeans.UserForm;

/*
 * Looks up the favorite links for a given "user".
 * 
 * If successful:
 *   (1) Sets the "userList" request attribute in order to display
 *       the list of users on the navbar.
 *   (2) Sets the "favoriteList" request attribute in order to display
 *       the list of given user's links for selection.
 *   (3) Forwards to list.jsp.
 */
public class NewPageAction extends Action {
	private UserDAO  userDAO;
    public NewPageAction(Model model) {
    	userDAO  = model.getUserDAO();
	}

    public String getName() { return "newpage.do"; }

    public String perform(HttpServletRequest request) {
    	try {
			UserBean user = userDAO.read(1); // Fake login!!!!!!!!!!!!!!
			HttpSession session     = request.getSession(true);
			session.setAttribute("user", user);
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return "index.jsp";
    }
}
