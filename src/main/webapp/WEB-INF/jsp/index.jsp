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
<table>
    <tr>
        <td colspan="5" bgcolor="#ffffff">
            <c:set var="selectedFilter" scope="session"> </c:set>
            <a href="/filter/${selectedFilter = "all"}"><img src="${pageContext.request.contextPath}../images/all.gif"
                                                             height="16" width="69" alt="View" title="view..." border="0"></a>

            <a href="/filter/${selectedFilter = "true"}"><img src="${pageContext.request.contextPath}../images/true.gif"
                                                              height="16" width="69" alt="View" title="view..." border="0"></a>

            <a href="/filter/${selectedFilter = "false"}"><img src="${pageContext.request.contextPath}../images/false.gif"
                                                               height="16" width="69" alt="View" title="view..." border="0"></a>

            <br>
            Search by name:
            <form method="post" action="/find">
                <input type="text" name="name">
                <input type="image" name="find" src="${pageContext.request.contextPath}../images/find.gif"
                       height="16" width="16" alt="Find" title="find...">
            </form>

        </td>
    </tr>
    <tr>
        <th>id</th>
        <th>name</th>
        <th>need</th>
        <th>quantity</th>
        <th></th>
    </tr>
    <c:forEach var="part" items="${parts}">
        <tr>
            <td>${part.id}</td>
            <td>${part.name}</td>
            <td>${part.need}</td>
            <td>${part.quantity}</td>
            <td>
                <a href="/view/${part.id}"><img src="${pageContext.request.contextPath}../images/view.gif" height="16"
                                                width="16" alt="View" title="view..." border="0"></a>
                <a href="/edit/${part.id}"><img src="${pageContext.request.contextPath}../images/edit.gif" height="16"
                                                width="16" alt="Edit" title="edit..." border="0"></a>
                <a href="/delete/${part.id}"><img src="${pageContext.request.contextPath}../images/delete.gif"
                                                  height="16" width="16" alt="Delete" title="delete..." border="0"></a>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="5" bgcolor="#ffffff">
        <c:forEach var="page" items="${pages}">
            <a href="/next/${page}" style="border: 1px solid #1068EF; font-size: small; padding: 3px">${page+1}</a>
        </c:forEach>
        </td>
    </tr>
</table>

<br>

<p>${status}</p>
<p>The number of computers that can be assembled from the parts shown is ${pcsToConstruct}.</p>

<table border="2">
    <tr>
        <td>
            <form method="post" action="/save">
                <input type="hidden" name="id" value="">
                <i>*</i> name:<br>

                <input type="text" name="name"><br>
                <i>*</i> need:<br>

                <select name="need">
                    <option selected value="false">false</option>
                    <option value="true">true</option>
                </select><br>
                <i>*</i> quantity:<br>

                <input type="text" name="quantity"><br>
                <br>
                <div><input type="image" name="add" src="${pageContext.request.contextPath}../images/add.gif"
                            height="16" width="16" alt="Add" title="add..."> Add new part
                </div>
                <br><br>
                <i>*</i> - Required fields
            </form>
        </td>
    </tr>
</table>

</body>
</html>