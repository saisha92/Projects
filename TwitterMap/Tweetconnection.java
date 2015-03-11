import java.sql.*;

import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;
import twitter4j.Twitter;
import twitter4j.TwitterFactory;
import twitter4j.TwitterStream;
import twitter4j.TwitterStreamFactory;
import twitter4j.conf.ConfigurationBuilder;

public class Tweetcollection {
	final static int tweetmax = 10000;
	 static int tweetcount = 0;
	public static void main(String[] args)
	{
		
	try{
	
		
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setOAuthConsumerKey("")
        .setOAuthConsumerSecret("")
        .setOAuthAccessToken("")
        .setOAuthAccessTokenSecret("");
		final TwitterStream twitterStream = new TwitterStreamFactory(cb.build()).getInstance(); 
        StatusListener listener = new StatusListener() {
        DBConnection db = new DBConnection();
        	Connection conn = db.createConnection();
            
            public void onStatus(Status status) {
            	
            	if(tweetcount<tweetmax)
            	{ 
            		if(status.getId()!=0 && status.getGeoLocation()!=null&&status.getLang().equalsIgnoreCase("en"))
                {
            		System.out.println("@" + status.getUser().getScreenName() + " - " + status.getText());
            		PreparedStatement preparedStatement=null;
            		try {
						preparedStatement = conn.prepareStatement("insert into tweets values(?,?,?,?)");
						
						preparedStatement.setString(1,status.getUser().getScreenName() );
						preparedStatement.setDouble(2, status.getGeoLocation().getLatitude());
						preparedStatement.setDouble(3, status.getGeoLocation().getLongitude());
						preparedStatement.setString(4, status.getText());
						preparedStatement.executeUpdate();
					} catch (SQLException e) {
						
						e.printStackTrace();
					}
            		
            	tweetcount++;
                }
            	}
            	else{
            		twitterStream.removeListener(this);
    				twitterStream.shutdown();	
            	}
            }
           

            @Override
            public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
               // System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
            }
            @Override
            public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
                //System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
            }
            @Override
            public void onScrubGeo(long userId, long upToStatusId) {
                //System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
            }
            @Override
            public void onStallWarning(StallWarning warning) {
                //System.out.println("Got stall warning:" + warning);
            }

            public void onException(Exception ex) {
               // ex.printStackTrace();
            }
        };
        twitterStream.addListener(listener);
        twitterStream.sample();
    
	
	}
		catch(Exception e)
	{
			System.out.println(e);
	}
	
		}
	
}

