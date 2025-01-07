package dao;

import model.Product;
import java.util.List;

public interface IProductDAO {
    List<Product> getAllProducts();
    void addProduct(Product product);
    List<Product> getTopSellingProducts(int top);
    List<Product> getProductsByDate(String fromDate, String toDate);
}