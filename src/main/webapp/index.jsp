<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product_ManageApp</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .content {
            text-align: center;
            color: #007bff;
        }

        h1 {
            color: #333;
            margin-top: 50px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
<div class="content">
    <h1><%= "Product_Manage" %>
    </h1>
    <a href="/prod/list">Product_Manage App Link</a>
</div>
</body>