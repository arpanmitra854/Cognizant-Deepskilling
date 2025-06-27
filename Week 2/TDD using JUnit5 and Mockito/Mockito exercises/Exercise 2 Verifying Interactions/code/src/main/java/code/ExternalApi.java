package code;

public interface ExternalApi {
    String getData();
    
    String getData(String userId, String category);
    
    boolean saveData(String data);
}
