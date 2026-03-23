<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Gestion Notes</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Insert.css">
</head>
<body>

<div class="floating-elements">
    <span></span>
    <span></span>
    <span></span>
</div>

<div class="main-container">
    <!-- Section Ajout de Note -->
    <div class="form-section">
        <div class="section-header">
            <h2>
                <i class="fas fa-plus-circle"></i>
                Ajouter Note
            </h2>
            <p class="section-subtitle">Nouvelle évaluation académique</p>
        </div>

        <form action="/notes/save" method="post" class="styled-form">
            <div class="form-grid">
                <div class="form-group">
                    <label for="etudiant">
                        <i class="fas fa-user-graduate"></i>
                        Étudiant
                    </label>
                    <select name="idEtudiant" id="etudiant" class="form-control">
                        <option value="" disabled selected>-- Sélectionner --</option>
                        <c:forEach items="${etudiants}" var="e">
                            <option value="${e.idEtudiant}">${e.nom}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="prof">
                        <i class="fas fa-chalkboard-teacher"></i>
                        Professeur
                    </label>
                    <select name="idProf" id="prof" class="form-control">
                        <option value="" disabled selected>-- Sélectionner --</option>
                        <c:forEach items="${profs}" var="p">
                            <option value="${p.idProf}">${p.nom}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="matiere">
                        <i class="fas fa-book"></i>
                        Matière
                    </label>
                    <select name="idMatiere" id="matiere" class="form-control">
                        <option value="" disabled selected>-- Sélectionner --</option>
                        <c:forEach items="${matieres}" var="m">
                            <option value="${m.idMatiere}">${m.nom}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="note">
                        <i class="fas fa-star"></i>
                        Note
                    </label>
                    <input type="number" name="note" id="note" class="form-control" 
                           placeholder="Entrez la note" required>
                </div>
            </div>

            <button type="submit" class="btn-submit">
                <i class="fas fa-save"></i>
                Enregistrer la note
                <i class="fas fa-check-circle"></i>
            </button>
        </form>
    </div>

    <!-- Section Liste des Notes -->
    <div class="table-section">
        <div class="section-header">
            <h2>
                <i class="fas fa-list"></i>
                Liste des notes
            </h2>
            <p class="section-subtitle">Gestion des notes enregistrées</p>
        </div>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th><i class="fas fa-hashtag"></i> ID</th>
                        <th><i class="fas fa-user"></i> Étudiant</th>
                        <th><i class="fas fa-chalkboard-teacher"></i> Professeur</th>
                        <th><i class="fas fa-book"></i> Matière</th>
                        <th><i class="fas fa-star"></i> Note</th>
                        <th><i class="fas fa-cog"></i> Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${notes}" var="n" varStatus="status">
                        <tr style="animation-delay: ${status.index * 0.1}s">
                            <td>${n.idNote}</td>
                            <td>
                                <span class="student-badge">
                                    <i class="fas fa-user-circle"></i>
                                    ${n.etudiant.nom}
                                </span>
                            </td>
                            <td>
                                <span class="prof-badge">
                                    <i class="fas fa-user-tie"></i>
                                    ${n.prof.nom}
                                </span>
                            </td>
                            <td>
                                <span class="subject-badge">
                                    <i class="fas fa-book-open"></i>
                                    ${n.matiere.nom}
                                </span>
                            </td>
                            <td>
                                <span class="note-badge ${n.note >= 10 ? 'success' : 'danger'}">
                                    ${n.note}
                                </span>
                            </td>
                            <td>
                                <a href="/notes/delete?id=${n.idNote}" class="delete-link" 
                                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette note ?')">
                                    <i class="fas fa-trash-alt"></i>
                                    Supprimer
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <c:if test="${empty notes}">
                <div class="empty-message">
                    <i class="fas fa-inbox"></i>
                    <p>Aucune note enregistrée pour le moment</p>
                </div>
            </c:if>
        </div>
    </div>
</div>

</body>
</html>