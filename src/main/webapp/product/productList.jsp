<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <style>
        /* styles.css */

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        .actions {
            text-align: center;
            margin: 20px 0;
        }

        .actions button, .actions form {
            margin: 10px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
        }

        button:hover {
            background-color: #45a049;
        }

        form {
            display: inline-block;
        }

        form label {
            margin-right: 10px;
        }

        form input, form select {
            padding: 5px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<h1>Product Management</h1>

<div class="actions">
    <button onclick="location.href='products?action=add'">Add New Product</button>
    <br>
    <form action="products" method="get" style="display:inline;">
        <input type="hidden" name="action" value="viewTop">
        <label for="top">List Top:</label>
        <select id="top" name="top" required>
            <option value="3">Top 3</option>
            <option value="5">Top 5</option>
            <option value="10">Top 10</option>
        </select>
        <label> best ordered Products </label>
        <button type="submit">View</button>
    </form>
    <br>
    <form action="products" method="get" style="display:inline;">
        <input type="hidden" name="action" value="viewByDate">
        <label>Products List ordered from </label>
        <input type="date" id="fromDate" name="fromDate" required>
        <label> to </label>
        <input type="date" id="toDate" name="toDate" required>
        <button type="submit">View</button>
    </form>
</div>

<c:if test="${not empty topSellingProducts}">
    <h2>Top ${param.top} Selling Products</h2>
    <table border="1">
        <thead>
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Price</th>
            <th>Discount</th>
            <th>Stock</th>
            <th>Order Count</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${topSellingProducts}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.discount}</td>
                <td>${product.stock}</td>
                <td>${product.orderCount}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<c:if test="${not empty productsByDate}">
    <h2>Products Ordered from ${param.fromDate} to ${param.toDate}</h2>
    <table border="1">
        <thead>
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Price</th>
            <th>Discount</th>
            <th>Stock</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productsByDate}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.discount}</td>
                <td>${product.stock}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<c:if test="${empty topSellingProducts && empty productsByDate}">
    <h2>All Products</h2>
    <table border="1">
        <thead>
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Price</th>
            <th>Discount</th>
            <th>Stock</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.discount}</td>
                <td>${product.stock}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

</body>
</html>