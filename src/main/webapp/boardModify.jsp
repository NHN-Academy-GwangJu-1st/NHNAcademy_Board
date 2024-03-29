<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%@ include file="localeInclude.jsp"%>

<fmt:bundle basename="message">


<h1><fmt:message key="Board.ModifyForm.Page"/></h1>

<br>
<br>
<br>

<form method="post" action="/board/modify.do?id=${board.getId()}">
    <input type="text" name="title" value="${board.getTitle()}" style="width: 400px; height: 40px">

    <br>
    <br>
    <br>

    <textarea cols="10" rows="30" name="content" style="width: 950px; height: 450px; resize: none;">
        ${board.getContent()}
    </textarea>

    <br>
    <br>
    <br>

    <button type="submit"><fmt:message key="Modify"/></button>

</form>
</fmt:bundle>
</body>
</html>
