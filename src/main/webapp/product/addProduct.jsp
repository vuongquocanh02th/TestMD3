<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Product</title>
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