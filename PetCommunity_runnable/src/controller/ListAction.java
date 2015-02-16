package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
public class ListAction extends Action {
	private FormBeanFactory<UserForm> formBeanFactory = FormBeanFactory.getInstance(UserForm.class);

	private PhotoDAO photoDAO;
	private UserDAO  userDAO;

    public ListAction(Model model) {
    	photoDAO = model.getPhotoDAO();
    	userDAO  = model.getUserDAO();
	}

    public String getName() { return "list.do"; }

    public String perform(HttpServletRequest request) {
//    	System.out.println("Logining in");
        // Set up the request attributes (the errors list and the form bean so
        // we can just return to the jsp with the form if the request isn't correct)

        List<String> errors = new ArrayList<String>();
        request.setAttribute("errors",errors);

		try {
            // Set up user list for nav bar
			request.setAttribute("userList",userDAO.getUsers());

//			UserForm form = formBeanFactory.create(request);

//			int userId = form.getIdAsInt();
			int userId = 1; //Fake user login !!!!!!!!!!!!!!!

	        // Set up favorite list
			
        	UserBean user = userDAO.read(userId);
        	if (user == null) {
    			errors.add("Invalid User: "+userId);
    			return "error.jsp";
    		} else {
    			request.setAttribute("firstName", user.getFirstName());
    			request.setAttribute("lastName", user.getLastName());    			
    		}

        	PhotoBean[] photoList = photoDAO.getAllPhotos();
	        request.setAttribute("photoList",photoList);
	        return "list.jsp";
        } catch (RollbackException e) {
        	errors.add(e.getMessage());
        	return "error.jsp";
        } 
    }
    
//    public String perform(HttpServletRequest request) {
//    	System.out.println("Hello!!!");
//    	return "list.jsp";
//    }
}
