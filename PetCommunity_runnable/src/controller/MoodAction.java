package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Model;

import org.genericdao.RollbackException;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;

import service.Sentiment140Response;
import service.SentimentExec;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;
import formbeans.MoodForm;

public class MoodAction extends Action {
	private FormBeanFactory<MoodForm> formBeanFactory = FormBeanFactory
			.getInstance(MoodForm.class);
	
	public MoodAction(Model model) {
		
	}

	public String getName() {
		return "mood.do";
	}

	public String perform(HttpServletRequest request) {
		List<String> errors = new ArrayList<String>();
		request.setAttribute("errors", errors);
		HttpSession session = request.getSession(false);

		List<String> success = new ArrayList<String>();
		request.setAttribute("success", success);
		int count = 0;
		try {

			MoodForm form = formBeanFactory.create(request);
			request.setAttribute("form", form);
			// If no params were passed, return with no errors so that the form
			// will be
			// presented (we assume for the first time).
			if (!form.isPresent()) {
				return "mood.jsp";
			}

			// Any validation errors?
			errors.addAll(form.getValidationErrors());
			if (errors.size() != 0) {
				return "mood.jsp";
			}
//			ArrayList<String> twitList = new ArrayList<String>();
//			ConfigurationBuilder cb = new ConfigurationBuilder();
//			cb.setDebugEnabled(true)
//					.setOAuthConsumerKey("S92yH8Tf3Tw6LmVtE5vZgOzZB")
//					.setOAuthConsumerSecret(
//							"5Z2yj5Xz5VBXra5R6BIi18mtAlGeon2k7v3mOX5T0RH1VJC1BH")
//					.setOAuthAccessToken(
//							"29456871-a2SB6usJMY8ch9z2Jn1jyL28yxRjvae5iyLHSpMha")
//					.setOAuthAccessTokenSecret(
//							"ZDOF1RZmOZeEXl4xzGi4wkHbjp36LPn52kvrQBNbddQrE");
//			Twitter twitter = new TwitterFactory(cb.build()).getInstance();
//			try {
//				Query query = new Query(form.getQuery());
//				query.setCount(10);
//				
//				QueryResult result;
//				// do {
//				result = twitter.search(query);
//				List<Status> tweets = result.getTweets();
//				for (Status tweet : tweets) {
//					twitList.add("@" + tweet.getUser().getScreenName() + " - "
//							+ tweet.getText());
//				}
//				// } while (count++<20 && (query = result.nextQuery()) != null);
//			} catch (TwitterException te) {
//				errors.add("Failed to search tweets: " + te.getMessage());
//				return "mood.jsp";
//			}
			SentimentExec se = new SentimentExec(form.getQuery());
			Sentiment140Response response = se.getResponse();
			session.setAttribute("result",response.getData());
			session.setAttribute("positive",response.positive());
			session.setAttribute("negative",response.negative());
			session.setAttribute("neutral",response.neutral());
			return "mood.jsp";
		} catch (FormBeanException e) {
			errors.add(e.getMessage());
			return "mood.jsp";
		}
	}

}
