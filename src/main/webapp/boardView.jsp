<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%@ include file="localeInclude.jsp"%>


<fmt:bundle basename="message">

<h1><fmt:message key="Board.View.Page"/></h1>

<input type="text" name="title" value="${board.getTitle()}" readonly style="width: 400px; height: 40px; font-size: 20px">
<div style="display: flex; align-items: center; font-size: 16px;">
    <p style="margin-right: 10px;"><fmt:message key="Writer"/>:
        <a href="/user/view.do?id=${writer.getId()}">${writer.getName()}</a>
    </p>
    <p style="margin-right: 10px"><fmt:message key="Date"/>: <fmt:formatDate value="${board.getDate()}" pattern="yyyy-MM-dd HH:ss"/></p>
    <p><fmt:message key="ViewCount"/>: ${board.getViewCount()}</p>
</div>
<br>
<br>
<br>

<textarea cols="10" rows="30" name="content" readonly style="width: 950px; height: 450px; resize: none;">
    ${board.getContent()}
</textarea>

<br>
<br>
<br>

<c:if test="${board.getUserId() == writer.getId()}">
    <div style="display: flex; align-items: center">
    <a href="/board/modifyForm.do?id=${board.getId()}" style="margin-right: 20px"><fmt:message key="Modify"/></a>
    <a href="/board/delete.do?id=${board.getId()}"><fmt:message key="Delete"/></a>
    </div>
</c:if>
</fmt:bundle>
</body>
</html>
