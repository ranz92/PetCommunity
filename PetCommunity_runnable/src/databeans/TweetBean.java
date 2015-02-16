
package databeans;

import org.genericdao.PrimaryKey;

@PrimaryKey("tweetId")
public class TweetBean {

	private int tweetId = -1;
	private int userId = -1;
	private String comment = null;
	private int photoId = -1;

	public TweetBean() {}

	public TweetBean(int userId, String comment, int photoId) {
		this.userId = userId;
		this.comment = comment;
		this.photoId = photoId;
	}

	public int getTweetId()		{ return tweetId; }
	public int getUserId()		{ return userId; }
	public int getPhotoId()		{ return photoId; }
	public String getComment()	{ return comment; }
	
	public void setTweetId(int i)	{ tweetId = i; }
	public void settUserId(int i)	{ userId = i; }
	public void setPhotoId(int i)	{ photoId = i; }
	public void setComment(String s){ comment = s; }

	@Override
	public String toString() {
		return "Tweet(" + tweetId + ")";
	}
}
