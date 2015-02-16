package service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

import com.google.gson.Gson;

public class SentimentExec {
	/**
	 * The term to search for.
	 */
	private String search;

	/**
	 * The number of positive Tweets.
	 */
	private int positive;

	/**
	 * The number of neutral Tweets.
	 */
	private int neutral;

	/**
	 * The number of negative Tweets.
	 */
	private int negative;

	/**
	 * The total number of Tweets analyzed not including errors.
	 */
	private int total;

	/**
	 * The number of Tweets that produced an error from the Alchemy API.
	 */
	private int errors;

	public SentimentExec(String search) {
		this.search = search;
	}

	/**
	 * Executes the query to search for the given String.
	 */
	public void run() {
		try {
			Sentiment140Response response = sentiment140Analysis(getTweets());
			this.positive = response.positive();
			this.negative = response.negative();
			this.neutral = response.neutral();

			this.total = this.positive + this.neutral + this.negative;

			System.out.println(toString());
		} catch (NullPointerException e) {
			this.positive = 0;
			this.negative = 0;
			this.neutral = 0;
			this.total = 0;
		}

	}
	public Sentiment140Response getResponse(){
		return sentiment140Analysis(getTweets());
	}
	
	/**
	 * Gathers the Tweets to be analyzed and converts them into a list of their
	 * text.
	 * 
	 * @return The list of the text.
	 */
	private List<String> getTweets() {
		ArrayList<String> twitList = new ArrayList<String>();
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
				.setOAuthConsumerKey("S92yH8Tf3Tw6LmVtE5vZgOzZB")
				.setOAuthConsumerSecret(
						"5Z2yj5Xz5VBXra5R6BIi18mtAlGeon2k7v3mOX5T0RH1VJC1BH")
				.setOAuthAccessToken(
						"29456871-a2SB6usJMY8ch9z2Jn1jyL28yxRjvae5iyLHSpMha")
				.setOAuthAccessTokenSecret(
						"ZDOF1RZmOZeEXl4xzGi4wkHbjp36LPn52kvrQBNbddQrE");
		Twitter twitter = new TwitterFactory(cb.build()).getInstance();
		Query query = new Query(search);
		query.setCount(10);
		query.setLang("en");
		QueryResult result = null;
		// do {
		try {
			result = twitter.search(query);
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Status> tweets = result.getTweets();
		List<String> tweetsText = new ArrayList<String>();
		for (Status tweet : tweets) {
			tweetsText.add(tweet.getText());
		}
		return tweetsText;
	}

	public Sentiment140Response sentiment140Analysis(List<String> tweets) {
		List<String> newTweets = new ArrayList<String>();
		for (String tweet : tweets) {
			// would not let me do tweet = tweet.replace() for some reason?
			String newTweet = tweet.replace("\"", " ");
			newTweets.add(newTweet);
		}
		tweets = newTweets;

		String body = this.packageTweets(tweets);

		CloseableHttpResponse response = this.sendHttpPostWithTweets(body);
		System.out.print(response);

		Gson gson = new Gson();

		try {
			return gson.fromJson(EntityUtils.toString(response.getEntity()),
					Sentiment140Response.class);
		} catch (Exception e) {
			// something bad went wrong and we can't recover
			return null;
		}
	}

	/**
	 * Performs the http post with the body contents as the Tweets to the
	 * Sentiment140 API.
	 * 
	 * @param body
	 *            The tweets to set as the body of the response.
	 * @return The HttpResponse.
	 */
	private CloseableHttpResponse sendHttpPostWithTweets(String body) {
		CloseableHttpClient httpclient = HttpClients.createDefault();

		HttpPost post = new HttpPost(
				"http://www.sentiment140.com/api/bulkClassifyJson?appid=quriola@gmail.com");

		// add the Tweets to the body
		try {
			StringEntity se = new StringEntity(body);
			post.setEntity(se);

			return httpclient.execute(post);
		} catch (Exception e) {
			// probably cannot recover. No data.
			return null;
		}
	}

	private String packageTweets(List<String> tweets) {
		String json = "{\"data\": [";
		for (String tweet : tweets) {
			json = json + "{\"text\": \"" + tweet + "\", \"query\": \""
					+ this.search + "\"},";
		}
		json = json.substring(0, json.length() - 1);
		json = json + "]}";

		return json;
	}

	/**
	 * Creates a JSON representation of the results from this query.
	 */
	public String toString() {
		return "\"sentiment\": { \"positive\" : \"" + this.positive
				+ "\", \"negative\" : \"" + this.negative
				+ "\", \"neutral\" : \"" + this.neutral + "\", \"total\" : \""
				+ this.total + "\", " + "\"errors\": \"" + this.errors + "\" }";
	}

	/**
	 * Tests the <code>SentimentExec</code> class.
	 * 
	 * @throws UnsupportedEncodingException
	 */
	public static void main(String[] args) throws Exception {
		SentimentExec sentiment = new SentimentExec("cat");
		sentiment.run();

		System.out.println(sentiment);
	}
}
