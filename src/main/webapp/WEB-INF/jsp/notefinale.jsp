<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Notes</h2>

        <table border="1">
        <tr>
        <th>Note</th>
        </tr>

        <c:forEach var="n" items="${notes}">
        <tr>
        <td>${n}</td>
        </tr>
        </c:forEach>
        </table>
<br>

<h3>Note Finale : ${noteFinale}</h3>