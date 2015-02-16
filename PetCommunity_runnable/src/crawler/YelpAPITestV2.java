package crawler;



import java.util.ArrayList;
import java.util.List;

import model.Model;
import model.YelpBusinessDAO;

import org.genericdao.RollbackException;
import org.json.simple.JSONArray;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.scribe.builder.ServiceBuilder;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuthService;
import org.scribe.oauth.OAuthService;

import com.beust.jcommander.JCommander;
import com.beust.jcommander.Parameter;

import databeans.BusinessBean;

/**
 * Code sample for accessing the Yelp API V2.
 * 
 * This program demonstrates the capability of the Yelp API version 2.0 by using the Search API to
 * query for businesses by a search term and location, and the Business API to query additional
 * information about the top result from the search query.
 * 
 * <p>
 * See <a href="http://www.yelp.com/developers/documentation">Yelp Documentation</a> for more info.
 * 
 */
public class YelpAPITestV2 {

  private static final String API_HOST = "api.yelp.com";
  private static final String DEFAULT_TERM = "pet friendly restaurant";
  private static final String DEFAULT_LOCATION = "Pittsburgh, PA";
  private static final int SEARCH_LIMIT =20;
  private static final String SEARCH_PATH = "/v2/search";
  private static final String BUSINESS_PATH = "/v2/business";
  private static final String DEFAULT_CA="";	
  private static final int DEFAULT_SORT= 1;
  private static final int DEFAULT_OFFSET= 0;
  

  /*
   * Update OAuth credentials below from the Yelp Developers API site:
   * http://www.yelp.com/developers/getting_started/api_access
   */
  private static final String CONSUMER_KEY = "2tkJYDcRgb9KhodAHGRKkQ";
  private static final String CONSUMER_SECRET = "ZnkCKd7tBj3mR2OPD53qmfMIRdc";
  private static final String TOKEN = "CgFG1rbePWEPkwO-r75i9tE_nByI0fmY";
  private static final String TOKEN_SECRET = "iv74raCyynrsMHNtm3g9A03ieNg";

  OAuthService service;
  Token accessToken;

  /**
   * Setup the Yelp API OAuth credentials.
   * 
   * @param consumerKey Consumer key
   * @param consumerSecret Consumer secret
   * @param token Token
   * @param tokenSecret Token secret
   */
  public YelpAPITestV2(String consumerKey, String consumerSecret, String token, String tokenSecret) {
    this.service =
        new ServiceBuilder().provider(TwoStepOAuth.class).apiKey(consumerKey)
            .apiSecret(consumerSecret).build();
    this.accessToken = new Token(token, tokenSecret);
  }

  /**
   * Creates and sends a request to the Search API by term and location.
   * <p>
   * See <a href="http://www.yelp.com/developers/documentation/v2/search_api">Yelp Search API V2</a>
   * for more info.
   * 
   * @param term <tt>String</tt> of the search term to be queried
   * @param location <tt>String</tt> of the location
   * @return <tt>String</tt> JSON Response
   */
  public String searchForBusinessesByLocation(String term, String location, String limit, String sort,String offset ) {
    OAuthRequest request = createOAuthRequest(SEARCH_PATH);
    request.addQuerystringParameter("term", term);
    request.addQuerystringParameter("location", location);
    request.addQuerystringParameter("limit", limit);
    request.addQuerystringParameter("sort", sort);
    request.addQuerystringParameter("offset", offset);
   // request.addQuerystringParameter("limit","100");
    return sendRequestAndGetResponse(request);
  }

  /**
   * Creates and sends a request to the Business API by business ID.
   * <p>
   * See <a href="http://www.yelp.com/developers/documentation/v2/business">Yelp Business API V2</a>
   * for more info.
   * 
   * @param businessID <tt>String</tt> business ID of the requested business
   * @return <tt>String</tt> JSON Response
   */
  public String searchByBusinessId(String businessID) {
    OAuthRequest request = createOAuthRequest(BUSINESS_PATH + "/" + businessID);
    return sendRequestAndGetResponse(request);
  }

  public JSONObject searchByBusinessIdJ(String businessID) {
	    OAuthRequest request = createOAuthRequest(BUSINESS_PATH + "/" + businessID);
	    return sendRequestAndGetResponseJ(request);
	  }
  
  
  
  /**
   * Creates and returns an {@link OAuthRequest} based on the API endpoint specified.
   * 
   * @param path API endpoint to be queried
   * @return <tt>OAuthRequest</tt>
   */
  private OAuthRequest createOAuthRequest(String path) {
    OAuthRequest request = new OAuthRequest(Verb.GET, "http://" + API_HOST + path);
    return request;
  }

  /**
   * Sends an {@link OAuthRequest} and returns the {@link Response} body.
   * 
   * @param request {@link OAuthRequest} corresponding to the API request
   * @return <tt>String</tt> body of API response
   */
  private String sendRequestAndGetResponse(OAuthRequest request) {
    System.out.println("Querying " + request.getCompleteUrl() + " ...");
    this.service.signRequest(this.accessToken, request);
    Response response = request.send();
    return response.getBody();}
  
  private JSONObject sendRequestAndGetResponseJ(OAuthRequest request) {
	    System.out.println("Querying " + request.getCompleteUrl() + " ...");
	    this.service.signRequest(this.accessToken, request);
	    Response response = request.send();
	    Object obj= JSONValue.parse(response.getBody());
	    JSONObject jObj= (JSONObject) obj;
	    
	    return jObj;
	    }

  /**
   * Queries the Search API based on the command line arguments and takes the first result to query
   * the Business API.
   * 
   * @param yelpApi <tt>YelpAPI</tt> service instance
   * @param yelpApiCli <tt>YelpAPICLI</tt> command line arguments
   */
  private static void queryAPITest(YelpAPITestV2 yelpApi, YelpAPICLI yelpApiCli) {
      

	  List<BusinessBean> list= new ArrayList<BusinessBean>();
	 
    String searchResponseJSON =
    	//yelpApi.searchForBusinessesByLocation(yelpApiCli.category_filter, yelpApiCli.location,yelpApiCli.limit);
        yelpApi.searchForBusinessesByLocation(yelpApiCli.term, yelpApiCli.location,yelpApiCli.limit,yelpApiCli.sort,yelpApiCli.offset);

    JSONParser parser = new JSONParser();
    JSONObject response = null;
    try {
      response = (JSONObject) parser.parse(searchResponseJSON);
    } catch (ParseException pe) {
      System.out.println("Error: could not parse JSON response:");
      System.out.println(searchResponseJSON);
      System.exit(1);
    }
    JSONArray businesses = (JSONArray) response.get("businesses");

    for(int i=0;i<businesses.size();i++)
    {
    	JSONObject currentBusiness = (JSONObject) businesses.get(i);
    	//String currentBusinessID = currentBusiness.get("id").toString();
    	
    	
    	String currentName = currentBusiness.get("name").toString();
    	String currentRating = currentBusiness.get("rating").toString();
    	String currentReview = currentBusiness.get("review_count").toString();
    	String currentPhone = currentBusiness.get("phone").toString();
    	String currentIsClosed = currentBusiness.get("is_closed").toString();
    	
    	String currentImageUrl = currentBusiness.get("image_url").toString();
    	String currentRating_img = currentBusiness.get("rating_img_url_small").toString();
    	String currentUrl = currentBusiness.get("url").toString();
    	JSONObject currentBusinessLocation = (JSONObject) currentBusiness.get("location");
    	
    	JSONObject currentBusinessCoor = (JSONObject) currentBusinessLocation.get("coordinate");
    	String currentLatitude = currentBusinessCoor.get("latitude").toString();
    	String currentLongitude = currentBusinessCoor.get("longitude").toString();
    	String currentAddr = currentBusinessLocation.get("display_address").toString();
    	BusinessBean b = new BusinessBean();
    	b.setId(i+1);
    	b.setDisplay_address(currentAddr);
    	b.setImage_url(currentImageUrl);
    	b.setIs_closed(currentIsClosed);
    	b.setLatitude(currentLatitude);
    	b.setLongitude(currentLongitude);
    	b.setName(currentName);
    	b.setPhone(currentPhone);
    	b.setRating(currentRating);
    	b.setRating_img_url_small(currentRating_img);
    	b.setReview_count(currentReview);
    	b.setUrl(currentUrl);	
    	//list.add(b);
    	//Store into the database.
    	
    	System.out.println(currentName+"~"+currentRating+"~"+currentReview+"~"+currentPhone+"~"+currentIsClosed+"~"+currentAddr+"~"+currentImageUrl+"~"+currentRating_img+"~"+currentUrl+"~"+currentLatitude+"~"+currentLongitude);
    	CrawlerDB db= new CrawlerDB(b);
    	db.create();
    	
    	
    }
    
    
    
    
    
    
    
    JSONObject firstBusiness = (JSONObject) businesses.get(0);
    System.out.println(businesses.size()+"!!!!!!!!!!!!!!!!!!!!!!!!!");
    
    String firstBusinessID = firstBusiness.get("id").toString();
    JSONObject firstBusinessLocation = (JSONObject) firstBusiness.get("location");
    String firstBusinessCoordinate= firstBusinessLocation.get("coordinate").toString();
    
    
    
    
    
    System.out.println(String.format(
        "%s businesses found, querying business info for the top result \"%s\" ...",
        businesses.size(), firstBusinessID));
    System.out.println(firstBusinessCoordinate);

    // Select the first business and display business details
    String businessResponseJSON = yelpApi.searchByBusinessId(firstBusinessID.toString());
   try {
	JSONObject response1= (JSONObject) parser.parse(businessResponseJSON);
	
	//String coordi= (String) response1.get("coordinate");
	//System.out.println(response1);
} catch (ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
    
    
    System.out.println(String.format("Result for business \"%s\" found:", firstBusinessID));
    System.out.println(businessResponseJSON);
   
    
    
    
  }

  /**
   * Command-line interface for the sample Yelp API runner.
   */
  private static class YelpAPICLI {
    @Parameter(names = {"-q", "--term"}, description = "Search Query Term")
    public String term = DEFAULT_TERM;

    @Parameter(names = {"-l", "--location"}, description = "Location to be Queried")
    public String location = DEFAULT_LOCATION;
    
    @Parameter(names = {"-k", "--limit"}, description = "Limit to be Queried")
    public String limit = String.valueOf(SEARCH_LIMIT);
    @Parameter(names = {"-o", "--category_filter"}, description = "Categories")
    public String category_filter = String.valueOf(DEFAULT_CA);
    
    @Parameter(names = {"-c", "--sort"}, description = "Sort")
    public String sort = String.valueOf(DEFAULT_SORT);
    @Parameter(names = {"-b", "--offset"}, description = "offset")
    public String offset = String.valueOf(DEFAULT_OFFSET);
    
    
  }

  /**
   * Main entry for sample Yelp API requests.
   * <p>
   * After entering your OAuth credentials, execute <tt><b>run.sh</b></tt> to run this example.
   */
  public static void main(String[] args) {
   YelpAPICLI yelpApiCli = new YelpAPICLI();
   new JCommander(yelpApiCli, args);

    YelpAPITestV2 yelpApi = new YelpAPITestV2(CONSUMER_KEY, CONSUMER_SECRET, TOKEN, TOKEN_SECRET);
    queryAPITest(yelpApi, yelpApiCli);
	
  }
}
