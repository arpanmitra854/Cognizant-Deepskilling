package code;

public class MyService {
    private final ExternalApi externalApi;
    
    public MyService(ExternalApi externalApi) {
        this.externalApi = externalApi;
    }
    
    public String fetchData() {
        return externalApi.getData();
    }
    
    public String fetchUserData(String userId, String category) {
        return externalApi.getData(userId, category);
    }
    
    public boolean processAndSaveData(String rawData) {
        String processedData = "Processed: " + rawData;
        return externalApi.saveData(processedData);
    }
}
