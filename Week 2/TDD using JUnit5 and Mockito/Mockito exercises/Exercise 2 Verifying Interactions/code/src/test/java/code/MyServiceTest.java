package code;

import static org.mockito.Mockito.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class MyServiceTest {
    
    @Mock
    private ExternalApi mockApi;
    
    private MyService service;
    
    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
        service = new MyService(mockApi);
    }
    
    @Test
    public void testVerifyInteraction() {
        when(mockApi.getData()).thenReturn("test data");
        
        service.fetchData();
        
        verify(mockApi).getData();
    }
    
    @Test
    public void testVerifyInteractionWithSpecificArguments() {
        String userId = "user123";
        String category = "profile";
        when(mockApi.getData(userId, category)).thenReturn("user profile data");
        
        service.fetchUserData(userId, category);
        
        verify(mockApi).getData(userId, category);
        verify(mockApi).getData("user123", "profile");
    }
    
    @Test
    public void testVerifyInteractionWithArgumentMatchers() {
        when(mockApi.getData(anyString(), anyString())).thenReturn("some data");
        
        service.fetchUserData("anyUser", "anyCategory");
        
        verify(mockApi).getData(anyString(), anyString());
    }
    
    @Test
    public void testVerifyInteractionTimes() {
        when(mockApi.getData()).thenReturn("data");
        
        service.fetchData();
        service.fetchData();
        
        verify(mockApi, times(2)).getData();
    }
    
    @Test
    public void testVerifyNeverCalled() {
        service.fetchData();
        
        verify(mockApi, never()).saveData(anyString());
    }
    
    @Test
    public void testVerifyWithExactArgumentAndOtherVerifications() {
        String testData = "test input";
        when(mockApi.saveData(anyString())).thenReturn(true);
        
        service.processAndSaveData(testData);
        
        verify(mockApi).saveData("Processed: " + testData);
        
        verify(mockApi, never()).getData();
        verify(mockApi, never()).getData(anyString(), anyString());
    }
    
    @Test
    public void testVerifyInteractionOrder() {
        when(mockApi.getData("user1", "category1")).thenReturn("data1");
        when(mockApi.saveData(anyString())).thenReturn(true);
        
        service.fetchUserData("user1", "category1");
        service.processAndSaveData("some data");
        
        var inOrder = inOrder(mockApi);
        
        inOrder.verify(mockApi).getData("user1", "category1");
        inOrder.verify(mockApi).saveData("Processed: some data");
    }
}
