<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>DriveReserv - Gestion Navette</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body>

<div class="sidebar">
    <!-- Message de bienvenue en haut -->
    <%-- <div class="welcome-message">
        <h4>Bienvenue Chez DriveReserv</h4>
        <p>Assurez votre confort dès maintenant : veillez à réserver un réservoir en utilisant votre numéro de téléphone.</p>
    </div> --%>
    
    <!-- Logo -->
    <div class="logo-container">
        <img src="${pageContext.request.contextPath}/css/logo.png" alt="DriveReserv Logo">
    </div>
    
    <!-- Titre -->
    <h3>DriveReserv</h3>
    
    <!-- Navigation -->
    <nav>
        <a href="${pageContext.request.contextPath}/reservations" class="nav-link">📋 Liste reservation</a>
        <a href="${pageContext.request.contextPath}/vehicules" class="nav-link">🚗 Liste vehicle</a>
        <a href="${pageContext.request.contextPath}/hotels" class="nav-link">🏨 Liste Hotel</a>
    </nav>
    
    <!-- Avertissement (fond jaune comme sur le modèle) -->
    <div class="warning">
        <p><strong>Avertissement 2025 - 2026 (Prom Magazine)</strong></p>
    </div>
</div>

<div class="content">
    <jsp:include page="${contentPage}" />
</div>

</body>
</html>