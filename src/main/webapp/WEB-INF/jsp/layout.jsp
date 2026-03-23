<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forage - Gestion</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body>

<div class="sidebar">
    <div class="logo-container">
        <img src="${pageContext.request.contextPath}/css/Forage.png" alt="Logo Forage" width="140">
    </div>

    <h1>Forage</h1>

    <nav>
        <a href="${pageContext.request.contextPath}/client/formulaire">Ajouter Client</a>
        <a href="${pageContext.request.contextPath}/client/liste">Liste Clients</a>
        <a href="${pageContext.request.contextPath}/Demande/formulaire">Ajouter Demande</a>
        <a href="${pageContext.request.contextPath}/Demande/liste">Liste Demandes</a>
    </nav>

    <div class="sidebar-footer">
        <p>© 2025–2026 Forage System</p>
    </div>
</div>

<div class="content">
    <jsp:include page="${contentPage}" />
</div>

</body>
</html>