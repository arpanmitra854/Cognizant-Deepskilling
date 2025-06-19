public class SingletonPatternExample{
    public static void main(String[] args) {
        Logger l1 = Logger.getInstance();
        Logger l2 = Logger.getInstance();

        System.out.println("Logger 1 : "+l1);
        System.out.println("Logger 2 : "+l2);
    
        if(l1 == l2){
            System.out.println("Both logger Instances are same");
        }else{
            System.out.println("Different Instances");
        }
    }
}