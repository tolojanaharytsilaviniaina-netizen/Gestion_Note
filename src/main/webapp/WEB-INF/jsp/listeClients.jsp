<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Client" %>

<html>
<head>
    <title>Liste des Clients</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/list.css">

</head>
<body>

<h2>Liste des Clients</h2>

<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Email</th>
        <th>Numéro</th>
        <th>Action</th>
    </tr>

<%
    List<Client> clients = (List<Client>) request.getAttribute("clients");

    if (clients != null) {
        for (Client client : clients) {
%>
    <tr>
        <td><%= client.getIdClients() %></td>
        <td><%= client.getNom() %></td>
        <td><%= client.getPrenom() %></td>
        <td><%= client.getEmail() %></td>
        <td><%= client.getNumero() %></td>

        <td>
            <a href="/client/edit/<%= client.getIdClients() %>">Modifier</a> |
            <a href="/client/delete/<%= client.getIdClients() %>"
               onclick="return confirm('Voulez-vous supprimer ce client ?');">
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
<a href="/client/formulaire">Ajouter un client</a>

</body>
</html>