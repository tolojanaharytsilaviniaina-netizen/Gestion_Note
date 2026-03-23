<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Ajouter un Client</title>
    <style>
        body { font-family: Arial; background-color: #f4f6f9; }
        .container { width: 400px; margin: 50px auto; background: white; padding: 25px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; }
        label { font-weight: bold; }
        input { width: 100%; padding: 8px; margin-bottom: 15px; }
        button { width: 100%; padding: 10px; background-color: blue; color: white; border: none; }
    </style>
</head>

<body>
<div class="container">
    <h2>Ajouter un Client</h2>

   <form method="POST" action="/client/save">

    <input type="hidden" name="idClients" value="${client.idClients}" />

    <label>Nom :</label>
    <input type="text" name="nom" value="${client.nom}" />

    <label>Prénom :</label>
    <input type="text" name="prenom" value="${client.prenom}" />

    <label>Email :</label>
    <input type="email" name="email" value="${client.email}" />

    <label>Numéro :</label>
    <input type="number" name="numero" value="${client.numero}" />

    <button type="submit">Enregistrer</button>
    </form>

    <div style="text-align:center; margin-top:15px;">
        <a href="/client/liste">Voir la liste des clients</a>
    </div>
</div>
</body>
</html>