<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>CRUD</title>
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

        ul.paging {
            margin: auto;
            display: inline-block;
            padding: 0;
        }

        ul.paging li {
            display: inline;
            border: 1px solid #ddd;
            border-radius: 10%;
            color: #669;
            float: left;
            font-size: 18px;
            padding: 8px 16px;
            text-decoration: none;
        }

        .special {
            width: 500px;
            margin: auto;
            margin-top: 50px;
        }

    </style>
</head>
<body>

<c:url var="searchpart" value="/searchresults"/>
<form:form action="${searchpart}" commandName="searchedpart">
    <table class=special>
        <tr>
            <td style="text-align: right"><input type="submit" name="action"
                                                 value="<spring:message text="Search by name:"/>"/></td>
            <td><form:input path="partName"/></td>
        </tr>
    </table>
</form:form>

<div style="text-align: center;">
    <form action="/addpart">
        <button type="submit">Add new part</button>
    </form>
</div>
<c:if test="${!empty listParts}">
    <table>
        <tr>
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
                <td><a href="<c:url value='/remove/${part.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>

        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        <c:set var="amount" value="${amountOfComp}"/>

        <tr>

            <td>Можно собрать</td>
            <td>${amount}</td>
            <td>Компьютеров</td>
            <td></td>
            <td><form action="/filter">
                <button type="submit">Filter</button>
            </form></td>

        </tr>
    </table>
</c:if>
<div style="text-align: center;">
    <ul class="paging">
        <c:if test="${page > 1}">
            <li><a href="<c:url value="/parts"><c:param name="page" value="${page - 1}"/>${page - 1}</c:url>"><</a></li>
        </c:if>
        <li><spring:message text="${page}"/></li>
        <c:if test="${listParts.size() == 10}">
            <li><a href="<c:url value="/parts"><c:param name="page" value="${page + 1}"/>${page + 1}</c:url>">></a></li>
        </c:if>
    </ul>
</div>
</body>
</html>
