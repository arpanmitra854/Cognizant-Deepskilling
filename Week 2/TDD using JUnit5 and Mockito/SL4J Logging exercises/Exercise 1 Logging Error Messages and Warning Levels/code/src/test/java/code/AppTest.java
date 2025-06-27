package code;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AppTest 
{
    private static final Logger logger = LoggerFactory.getLogger(AppTest.class);
    
    @Test
    public void testLoggerInitialization()
    {
        Logger testLogger = LoggerFactory.getLogger(App.class);
        assertNotNull("Logger should not be null", testLogger);
        assertTrue("Logger should be enabled for error level", testLogger.isErrorEnabled());
        assertTrue("Logger should be enabled for warn level", testLogger.isWarnEnabled());
    }
    
    @Test
    public void testMainMethodExecution()
    {
        try {
            App.main(new String[]{});
            logger.info("App.main() executed successfully");
            assertTrue("Main method should execute without exceptions", true);
        } catch (Exception e) {
            logger.error("Exception occurred during main method execution", e);
            assertTrue("Main method should not throw exceptions", false);
        }
    }
}
