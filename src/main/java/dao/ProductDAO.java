package dao;

import dbconnect.DBConnection;
import model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProductDAO implements IProductDAO {
    private final String SELECT_ALL_PRODUCTS = "SELECT * FROM Products";
    private final String INSERT_PRODUCT = "INSERT INTO Products (Name, Price, Discount, Stock) VALUES (?, ?, ?, ?)";
    private final String SELECT_TOP_SELLING_PRODUCTS = "SELECT p.*, COUNT(o.ProductID) AS OrderCount " +
            "FROM Products p " +
            "JOIN Orders o ON p.ProductID = o.ProductID " +
            "GROUP BY p.ProductID " +
            "ORDER BY OrderCount DESC " +
            "LIMIT ?";
    private final String SELECT_PRODUCTS_BY_DATE = "SELECT p.* FROM Products p " +
            "JOIN OrderDetails od ON p.ProductID = od.ProductID " +
            "JOIN Orders o ON od.OrderID = o.OrderID " +
            "WHERE o.OrderDate BETWEEN ? AND ?";
    @Override
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_PRODUCTS);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getDouble("Price"));
                product.setDiscount(rs.getString("Discount"));
                product.setStock(rs.getInt("Stock"));
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
    @Override
    public void addProduct(Product product) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_PRODUCT)) {
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getDiscount());
            ps.setInt(4, product.getStock());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    public List<Product> getTopSellingProducts(int top) {
        List<Product> products = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_TOP_SELLING_PRODUCTS)) {
            ps.setInt(1, top);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setProductID(rs.getInt("ProductID"));
                    product.setName(rs.getString("Name"));
                    product.setPrice(rs.getDouble("Price"));
                    product.setDiscount(rs.getString("Discount"));
                    product.setStock(rs.getInt("Stock"));
                    product.setOrderCount(rs.getInt("OrderCount"));
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> getProductsByDate(String fromDate, String toDate) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT p.* FROM Products p " +
                "JOIN OrderDetails od ON p.ProductID = od.ProductID " +
                "JOIN Orders o ON od.OrderID = o.OrderID " +
                "WHERE o.OrderDate BETWEEN ? AND ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_PRODUCTS_BY_DATE)) {
            ps.setString(1, fromDate);
            ps.setString(2, toDate);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setProductID(rs.getInt("ProductID"));
                    product.setName(rs.getString("Name"));
                    product.setPrice(rs.getDouble("Price"));
                    product.setDiscount(rs.getString("Discount"));
                    product.setStock(rs.getInt("Stock"));
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
}