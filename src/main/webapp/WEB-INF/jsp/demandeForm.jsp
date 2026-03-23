<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Client" %>
<%@ page import="com.example.model.Status" %>

<html>
<head>
    <title>Ajouter une Demande</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demande.css">

</head>

<body>
<div class="container">
    <h2>Ajouter une Demande</h2>

    <form method="POST" action="/Demande/save">

        <input type="hidden" name="idDemande" value="${demande.idDemande}" />

        <!-- CLIENT -->
        <label>Client :</label>
        <select name="client.idClients">
            <%
                List<Client> clients = (List<Client>) request.getAttribute("clients");
                if (clients != null) {
                    for (Client c : clients) {
            %>
                <option value="<%= c.getIdClients() %>">
                    <%= c.getNom() %>
                </option>
            <%
                    }
                }
            %>
        </select>

        <!-- Lieux -->
        <label>Lieux :</label>
        <input type="text" name="lieux" value="${demande.lieux}" />

        <!-- District -->
        <label>District :</label>
        <input type="text" name="district" value="${demande.district}" />

        <!-- STATUS -->
        <label>Status :</label>
        <select name="status.idStatus">
            <%
                List<Status> statusList = (List<Status>) request.getAttribute("statusList");
                if (statusList != null) {
                    for (Status s : statusList) {
            %>
                <option value="<%= s.getIdStatus() %>">
                    <%= s.getLibelle() %>
                </option>
            <%
                    }
                }
            %>
        </select>

        <button type="submit">Enregistrer</button>
    </form>

    <br>
    <a href="/Demande/liste">Voir la liste des demandes</a>
</div>
</body>
</html>