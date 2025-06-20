import java.util.*;

public class FinancialForecastPrediction{
    public static double prediction(double currentValue, double rate, int year){
        if(year == 0) return currentValue;
        return prediction(currentValue*(1+rate), rate, year-1);
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the current value: ");
        double currentValue = sc.nextDouble();
        System.out.println("Enter the rate: ");
        double rate = sc.nextDouble()/100;
        System.out.println("Duration(in years): ");
        int year = sc.nextInt();

        double predictedValue = prediction(currentValue, rate, year);
        System.out.printf("After %d years, predicted value = %.2f\n", year, predictedValue);

        sc.close();
    }
}