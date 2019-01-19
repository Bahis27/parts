<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>
        Parts
    </title>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
        }

        td, th {
            border: 1px solid #B9EEFD;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #B9EEFD;
        }

        i {
            color: #FF3333;
        }

        div {
            font-family: arial, sans-serif;
            font-size: large;
        }

        p {
            color: #777777;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>id</th>
        <td>${part.id}</td>
    </tr>
    <tr>
        <th>name</th>
        <td>${part.name}</td>
    </tr>
    <tr>
        <th>need</th>
        <td>${part.need}</td>
    </tr>
    <tr>
        <th>quantity</th>
        <td>${part.quantity}</td>
    </tr>
</table>
<br>
<div><a href="/"><img src="${pageContext.request.contextPath}../images/back.gif" height="16" width="16" alt="Back"
                      title="back..." border="0"></a> Back
</div>
</body>
</html>
