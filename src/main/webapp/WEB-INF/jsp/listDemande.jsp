<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Demande" %>
<%@ page import="com.example.model.Client" %>
<%@ page import="com.example.model.Status" %>

<html>
<head>
    <title>Liste des Demandes</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/list.css">

</head>
<body>

<h2>Liste des Demandes</h2>

<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Client</th>
        <th>Lieux</th>
        <th>District</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<%
    List<Demande> demandes = (List<Demande>) request.getAttribute("demandes");

    if (demandes != null) {
        for (Demande demande : demandes) {
%>
    <tr>
        <td><%= demande.getIdDemande() %></td>

        <!-- Afficher le nom du client -->
        <td>
            <%= (demande.getClient() != null) ? demande.getClient().getNom() : "" %>
        </td>

        <td><%= demande.getLieux() %></td>
        <td><%= demande.getDistrict() %></td>

        <!-- Afficher le libellé du status -->
        <td>
            <%= (demande.getStatus() != null) ? demande.getStatus().getLibelle() : "" %>
        </td>

        <td>
            <a href="/Demande/edit/<%= demande.getIdDemande() %>">Modifier</a> |
            <a href="/Demande/delete/<%= demande.getIdDemande() %>"
               onclick="return confirm('Voulez-vous supprimer cette demande ?');">
               Supprimer
            </a>
        </td>
    </tr>
<%
        }
    }
%>

</table>

<br>
<a href="/Demande/formulaire">Ajouter une nouvelle demande</a>

</body>
</html>