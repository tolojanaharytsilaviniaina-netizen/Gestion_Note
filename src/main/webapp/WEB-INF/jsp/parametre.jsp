<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Parametre</title>
</head>

<body>

<h2>Ajouter Parametre</h2>

<form action="saveParametre" method="post">

Matiere :
<select name="idMatiere">
<c:forEach items="${matieres}" var="m">
<option value="${m.idMatiere}">
${m.nom}
</option>
</c:forEach>
</select>

<br><br>

Operateur :
<select name="idOperateur">
<c:forEach items="${operateurs}" var="o">
<option value="${o.idOperateur}">
${o.nom}
</option>
</c:forEach>
</select>

<br><br>

Resolution :
<select name="idResolution">
<c:forEach items="${resolutions}" var="r">
<option value="${r.idResolution}">
${r.nom}
</option>
</c:forEach>
</select>

<br><br>

Seuil :
<input type="text" name="seuil">

<br><br>

<input type="submit" value="Enregistrer">

</form>

</body>
</html>