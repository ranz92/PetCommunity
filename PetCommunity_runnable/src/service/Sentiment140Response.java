package service;

import java.util.List;

/**
 * This class represents a response from the Sentiment140 API for classifying
 * the polarity of Tweets.
 * 
 * @author Daniel Deutsch
 */
public class Sentiment140Response 
{
	/**
	 * A list of responses.
	 */
	private List<Sentiment140Data> data;
	
	public List<Sentiment140Data> getData() {
		return data;
	}

	public void setData(List<Sentiment140Data> data) {
		this.data = data;
	}

	/**
	 * The empty constructor.
	 */
	public Sentiment140Response()
	{
		// empty
	}
	
	/**
	 * Gets the number of positive responses.
	 * @return The count.
	 */
	public int positive()
	{
		if (this.data == null)
			return -1;
		
		int count = 0;
		for (Sentiment140Data tweet : this.data)
		{
			if (tweet.getPolarity() == 4)
				count++;
		}
		return count;
	}
	
	/**
	 * Gets the number of neutral responses.
	 * @return The count.
	 */
	public int neutral()
	{
		if (this.data == null)
			return -1;
		
		int count = 0;
		for (Sentiment140Data tweet : this.data)
		{
			if (tweet.getPolarity() == 2)
				count++;
		}
		return count;
	}
	
	/**
	 * Gets the number of negative responses.
	 * @return The count.
	 */
	public int negative()
	{
		if (this.data == null)
			return -1;
		
		int count = 0;
		for (Sentiment140Data tweet : this.data)
		{
			if (tweet.getPolarity() == 0)
				count++;
		}
		return count;
	}
}
