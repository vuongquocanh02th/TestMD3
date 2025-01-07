package controller;

import dao.IProductDAO;
import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductController extends HttpServlet {
    private IProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            request.getRequestDispatcher("/product/addProduct.jsp").forward(request, response);
        }else if ("viewTop".equals(action)) {
            String topParam = request.getParameter("top");
            if (topParam != null) {
                int top = Integer.parseInt(topParam);
                List<Product> topSellingProducts = productDAO.getTopSellingProducts(top);
                request.setAttribute("topSellingProducts", topSellingProducts);
            }
            List<Product> productList = productDAO.getAllProducts();
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("/product/productList.jsp").forward(request, response);
        } else if ("viewByDate".equals(action)) {
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            if (fromDate != null && toDate != null) {
                List<Product> productsByDate = productDAO.getProductsByDate(fromDate, toDate);
                request.setAttribute("productsByDate", productsByDate);
            }
            List<Product> productList = productDAO.getAllProducts();
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("/product/productList.jsp").forward(request, response);
        }   else {
            List<Product> productList = productDAO.getAllProducts();
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("/product/productList.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String discount = request.getParameter("discount");
        int stock = Integer.parseInt(request.getParameter("stock"));

        Product newProduct = new Product();
        newProduct.setName(name);
        newProduct.setPrice(price);
        newProduct.setDiscount(discount);
        newProduct.setStock(stock);

        productDAO.addProduct(newProduct);
        response.sendRedirect("products");
    }
}