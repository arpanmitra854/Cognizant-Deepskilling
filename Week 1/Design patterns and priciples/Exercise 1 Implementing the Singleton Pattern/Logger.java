public class Logger {
    private static Logger log; 

    private Logger(){
        System.out.println("Logger instance named 'log' created!");
    }

    public static Logger getInstance(){
        if(log == null){
            log = new Logger();
        }

        return log;
    }
}
