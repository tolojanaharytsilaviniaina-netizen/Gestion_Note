<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Gestion Notes</title>
</head>
<body>

<h2>Ajouter Note</h2>

<form action="/notes/save" method="post">

Etudiant :
<select name="idEtudiant">
    <c:forEach items="${etudiants}" var="e">
        <option value="${e.idEtudiant}">${e.nom}</option>
    </c:forEach>
</select><br><br>

Prof :
<select name="idProf">
    <c:forEach items="${profs}" var="p">
        <option value="${p.idProf}">${p.nom}</option>
    </c:forEach>
</select><br><br>

Matiere :
<select name="idMatiere">
    <c:forEach items="${matieres}" var="m">
        <option value="${m.idMatiere}">${m.nom}</option>
    </c:forEach>
</select><br><br>

Note :
<input type="text" name="note"><br><br>

<input type="submit" value="Ajouter">

</form>

<hr>

<h2>Liste des notes</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Etudiant</th>
    <th>Prof</th>
    <th>Matiere</th>
    <th>Note</th>
    <th>Action</th>
</tr>

<c:forEach items="${notes}" var="n">
<tr>
    <td>${n.idNote}</td>
    <td>${n.etudiant.nom}</td>
    <td>${n.prof.nom}</td>
    <td>${n.matiere.nom}</td>
    <td>${n.note}</td>
    <td><a href="/notes/delete?id=${n.idNote}">Supprimer</a></td>
</tr>
</c:forEach>
</table>

</body>
</html>