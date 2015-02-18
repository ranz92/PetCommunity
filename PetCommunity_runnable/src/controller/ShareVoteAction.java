// 08-600 Java and J2EE Programming, 2014 Fall
// Homework 9: 		Favorite Link Sharing System
// Compiled by: 	Xinjun Chen, Backy
// Andrew ID:		xinjunc	
// Submitted on:	Dec 04, 2014

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
import databeans.TweetBean;
import formbeans.PhotoForm;

/*
 * Action called when viewing a link given it's "id" number.
 * 
 * If successful, looks up the Favorite bean by id and sets the
 * "favorite" attribute to that bean.  Also sets the "title"
 * attribute to the link's comments.
 * 
 * On success, forward to view.jsp for formatting.
 * 
 */
public class ShareVoteAction extends Action {
	private FormBeanFactory<PhotoForm> formBeanFactory = FormBeanFactory.getInstance(PhotoForm.class);

	private PhotoDAO photoDAO;
	private UserDAO  userDAO;
	
    public ShareVoteAction(Model model) {
    	photoDAO = model.getPhotoDAO();
    	userDAO  = model.getUserDAO();
	}

    public String getName() { return "sharevote.do"; }

    public String perform(HttpServletRequest request) {
        List<String> errors = new ArrayList<String>();
        request.setAttribute("errors",errors);
        String tweetbox = null;
        try{
        	tweetbox = request.getParameterValues("tweetbox")[0];
        } catch (Exception e) {
//        	errors.add("Please enter your reason");
//        	return "error.jsp";
        }
//		PhotoBean photo = (PhotoBean) request.getSession().getAttribute("photo");
//		request.getSession().removeAttribute("photo");
//		request.setAttribute("photo", photo);
		request.setAttribute("tweetbox", tweetbox);
        return "sharevote.jsp";
    }
}
