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

        td {
            border: 1px solid #B9EEFD;
            text-align: left;
            padding: 8px;
        }

        th {
            border: 1px solid #B9EEFD;
            background-color: #1068EF;
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

<table border="2">
    <tr>
        <td>
            <form method="post" action="/save">
                <div>ID: ${part.id}</div>
                <br>
                <input type="hidden" name="id" value="${part.id}">
                <i>*</i> name:<br>

                <input type="text" name="name" value="${part.name}"><br>
                <i>*</i> need:<br>

                <c:if test="${part.need == true}">
                    <select name="need">
                        <option selected value="true">true</option>
                        <option value="false">false</option>
                    </select>
                </c:if>

                <c:if test="${part.need == false}">
                    <select name="need">
                        <option selected value="false">false</option>
                        <option value="true">true</option>
                    </select>
                </c:if>
                <br>

                <i>*</i> quantity:<br>

                <input type="text" name="quantity" value="${part.quantity}"><br>
                <br>
                <div>
                    <input type="image" name="update" src="${pageContext.request.contextPath}../images/update.gif"
                           height="16"
                           width="16" alt="Update" title="update..."> Update
                    <a href="/"><img src="${pageContext.request.contextPath}../images/cancel.gif" height="16" width="16"
                                     alt="Cancel" title="cancel..." border="0"></a> Cancel
                </div>
                <br><br>
                <i>*</i> - Required fields
            </form>
        </td>
    </tr>
</table>
</body>
</html>