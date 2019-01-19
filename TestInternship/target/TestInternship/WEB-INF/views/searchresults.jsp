<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Search</title>

    <style type="text/css">
        table {
            margin: auto;
            margin-top: 50px;
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 18px;
            background: white;
            max-width: 70%;
            width: 70%;
            border-collapse: collapse;
            text-align: left;
        }
        th {
            font-weight: normal;
            color: #039;
            border-bottom: 2px solid #6678b1;
            padding: 10px 8px;
        }
        td {
            color: #669;
            padding: 9px 8px;
            transition: .3s linear;
        }

        .special{
            text-align: center;
            margin-top: 50px;
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 18px;
            color: #669;
        }
    </style>

</head>
<body>

<div style="text-align: center; margin-top: 50px;">
    <form action="/parts",>
        <button type="submit">Back</button>
    </form>
</div>

<c:if test="${!empty listParts}">
    <table class="features-table">
        <tr class="param">
            <th>ID</th>
            <th>PartsName</th>
            <th>IsNeed</th>
            <th>Amount</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${listParts}" var="part">
            <tr>
                <td>${part.id}</td>
                <td>${part.partName}</td>
                <td>${part.need}</td>
                <td>${part.amount}</td>
                <td><a href="<c:url value='/edit/${part.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${part.id}'/>">Delete</a> </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<div class="special">
<c:if test="${empty listParts}">
    Nothing found :(
</c:if>
</div>

</body>
</html>