<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Calcul Note Finale</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css">
</head>
<body>

<div class="container">
    <div class="form-card">
        <div class="form-header">
            <h2>
                <i class="fas fa-calculator"></i>
                Calcul Note Finale
            </h2>
            <p class="subtitle">Sélectionnez l'étudiant et la matière pour calculer la note finale</p>
        </div>

        <form action="/notes/calculFinale" method="post" class="styled-form">
            <div class="form-group">
                <label for="etudiant">
                    <i class="fas fa-user-graduate"></i>
                    Étudiant :
                </label>
                <select name="idEtudiant" id="etudiant" class="form-select">
                    <option value="" disabled selected>-- Choisir un étudiant --</option>
                    <c:forEach items="${etudiants}" var="e">
                        <option value="${e.idEtudiant}">${e.nom}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="matiere">
                    <i class="fas fa-book"></i>
                    Matière :
                </label>
                <select name="idMatiere" id="matiere" class="form-select">
                    <option value="" disabled selected>-- Choisir une matière --</option>
                    <c:forEach items="${matieres}" var="m">
                        <option value="${m.idMatiere}">${m.nom}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="submit-btn">
                <i class="fas fa-calculator"></i>
                Calculer Note Finale
                <i class="fas fa-arrow-right"></i>
            </button>
        </form>

        <div class="form-footer">
            <p><i class="fas fa-info-circle"></i> La note finale sera calculée selon le coefficient de chaque évaluation</p>
        </div>
    </div>
</div>

</body>
</html>