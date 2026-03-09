<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Notes - Design Premium</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Notefinale.css">
</head>
<body>
    <!-- Éléments décoratifs flottants -->
    <div class="floating-decoration">
        <span></span>
        <span></span>
        <span></span>
    </div>
    
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>
                    <i class="fas fa-star"></i>
                    NOTES
                    <i class="fas fa-star"></i>
                </h2>
                <div class="subtitle">Gestion des performances académiques</div>
            </div>
            
            <div class="card-content">
                <!-- Statistiques -->
                <div class="stats-container">
                    <div class="stat-item">
                        <div class="stat-value">${notes.size()}</div>
                        <div class="stat-label">Total Notes</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">
                            <c:set var="max" value="0"/>
                            <c:forEach var="n" items="${notes}">
                                <c:if test="${n > max}">
                                    <c:set var="max" value="${n}"/>
                                </c:if>
                            </c:forEach>
                            ${max}
                        </div>
                        <div class="stat-label">Note Max</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">
                            <c:set var="min" value="${notes[0]}"/>
                            <c:forEach var="n" items="${notes}">
                                <c:if test="${n < min}">
                                    <c:set var="min" value="${n}"/>
                                </c:if>
                            </c:forEach>
                            ${min}
                        </div>
                        <div class="stat-label">Note Min</div>
                    </div>
                </div>
                
                <!-- Tableau des notes -->
                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th><i class="fas fa-graduation-cap"></i> Notes des étudiants</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="n" items="${notes}" varStatus="status">
                                <tr style="transition-delay: ${status.index * 0.05}s">
                                    <td>
                                        <i class="fas fa-file-alt"></i>
                                        ${n}/20
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <!-- Note finale avec animation -->
                <div class="note-finale">
                    <div class="note-finale-content">
                        <span class="note-finale-label">Note Finale</span>
                        <div class="note-finale-value">
                            ${noteFinale}/20
                            <span>pts</span>
                        </div>
                        
                        <!-- Barre de progression -->
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: ${(noteFinale * 5)}%"></div>
                        </div>
                        
                        <!-- Mention selon la note -->
                        <c:choose>
                            <c:when test="${noteFinale >= 16}">
                                <span class="mention" style="color: white; font-weight: 600;">✨ Mention Excellent</span>
                            </c:when>
                            <c:when test="${noteFinale >= 14}">
                                <span class="mention" style="color: white; font-weight: 600;">🌟 Mention Très Bien</span>
                            </c:when>
                            <c:when test="${noteFinale >= 12}">
                                <span class="mention" style="color: white; font-weight: 600;">⭐ Mention Bien</span>
                            </c:when>
                            <c:when test="${noteFinale >= 10}">
                                <span class="mention" style="color: white; font-weight: 600;">📘 Mention Assez Bien</span>
                            </c:when>
                            <c:otherwise>
                                <span class="mention" style="color: white; font-weight: 600;">📚 Travail à fournir</span>
                            </c:otherwise>
                        </c:choose>
                        
                        <!-- Bouton d'action -->
                        <button class="action-button" onclick="window.print()">
                            <i class="fas fa-download"></i> Télécharger le relevé
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Petit script pour animation supplémentaire -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach((row, index) => {
                row.style.animation = `slideIn 0.5s ease-out ${index * 0.1}s forwards`;
            });
        });
    </script>
</body>
</html>