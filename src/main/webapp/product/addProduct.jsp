<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Product</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Add New Product</h1>
<form action="products" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" min="101" required><br>

    <label for="discount">Discount:</label>
    <select id="discount" name="discount" required>
        <option value="5%">5%</option>
        <option value="10%">10%</option>
        <option value="15%">15%</option>
        <option value="20%">20%</option>
    </select><br>

    <label for="stock">Stock:</label>
    <input type="number" id="stock" name="stock" min="11" required><br>

    <button type="submit">Add Product</button>
</form>
</body>
</html>