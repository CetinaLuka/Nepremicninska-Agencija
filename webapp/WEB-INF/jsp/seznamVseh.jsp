<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h1>Seznam krajev</h1>
    <table class="table">
        <c:forEach  items="${kraji}" var ="k">
            <tr>
                <td width="80px">${k.imeKraja}</td>
                <td>${k.postnaSt}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
