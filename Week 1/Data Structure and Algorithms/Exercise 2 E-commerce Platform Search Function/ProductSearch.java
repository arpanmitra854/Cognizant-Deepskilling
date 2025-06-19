import java.util.*;

public class ProductSearch{
    public static class Product {
        int productId;
        String productName;
        String category;

        public Product(int id, String name, String category){
            this.productId = id;
            this.productName = name;
            this.category = category;
        }
    }

    public Product linearSearch(Product[] products, String name){
        for(Product p : products){
            if(p.productName.trim().equalsIgnoreCase(name)){
                return p;
            }
        }
        return null; 
    }

    public Product binarySearch(Product[] products, String name){
        sortProductsByName(products);
        int start = 0;
        int end = products.length - 1;
        while(start <= end){
            int mid = (start + end)/2;
            int value = name.compareToIgnoreCase(products[mid].productName);

            if(value > 0) start = mid + 1;
            else if(value < 0) end = mid - 1;
            else return products[mid];
        }
        return null;
    }

    public static void sortProductsByName(Product[] products) {
    Arrays.sort(products, new Comparator<Product>() {
        public int compare(Product p1, Product p2) {
            return p1.productName.compareToIgnoreCase(p2.productName);
        }
    });
}

    public static void main(String[] args) {
        Product[] products = {
            new Product(1, "Trolley", "Travel"),
            new Product(2, "Laptop", "Electronics"),
            new Product(3, "Guitar", "Music"),
            new Product(4, "Watch", "Accessory"),
            new Product(5, "Smartphone", "Electronics")
        };

        ProductSearch p = new ProductSearch();
        Product product1 = p.linearSearch(products, "Laptop");
        System.out.println("Product Id : "+product1.productId+"\n"+"Product name : "+product1.productName+"\n"+"Product Category : "+product1.category);

        System.out.println();

        Product product2 = p.linearSearch(products, "Watch");
        System.out.println("Product Id : "+product2.productId+"\n"+"Product name : "+product2.productName+"\n"+"Product Category : "+product2.category);
    }
}