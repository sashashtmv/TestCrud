<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Add</title>
    <style type="text/css">

        table {
            margin: auto;
            margin-top: 50px;
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 18px;
            color: #669;
            background: white;
            border-collapse: collapse;
        }

    </style>
</head>
<body>

<c:url var="addAction" value="/parts/filter"/>

<form:form action="${addAction}">
    <table>

        <tr>
            <td colspan="2" style="text-align: center">
                <form action="/parts/filter" method="post">
                    <button name="filter" value="All">All</button>
                </form>
            </td>

        </tr>

        <tr>
            <td colspan="2" style="text-align: center">
                <form action="/parts/filter" method="post">
                    <button name="filter" value="Optional">Optional</button>
                </form>
            </td>

        </tr>

        <tr>
            <td colspan="2" style="text-align: center">
                <form action="/parts/filter" method="post">
                    <button name="filter" value="Need">Need</button>
                </form>
            </td>

        </tr>
    </table>
</form:form>
</body>
</html>
