<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${categoria != null}">
        <c:set var="title" value="Editar categoria" scope="request"/>
    </c:when>
    <c:otherwise>
        <c:set var="title" value="Nova categoria" scope="request"/>
    </c:otherwise>
    </c:choose>
<c:set var="activePage" value="categorias" scope="request"/>
<c:set var="content" value="/WEB-INF/views/categorias/form_content.jsp" scope="request"/>
<jsp:forward page="/WEB-INF/views/layout.jsp"/>


