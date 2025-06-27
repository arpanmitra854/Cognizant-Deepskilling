package code;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class App 
{
    private static final Logger logger = LoggerFactory.getLogger(App.class);
    
    public static void main( String[] args )
    {
        logger.error("This is an error message");
        logger.warn("This is a warning message");
        
        logger.info("This is an info message");
        logger.debug("This is a debug message");
        
        String user = "John";
        int attempts = 3;
        logger.error("User '{}' failed to login after {} attempts", user, attempts);
        logger.warn("Low disk space detected - only {}% remaining", 15);
        
        System.out.println("Logging demonstration completed. Check console for log messages.");
    }
}
