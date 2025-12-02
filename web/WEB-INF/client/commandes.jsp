<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fontawesome/css/all.min.css">
    <title>Mes commandes</title>
</head>

<body class="bg-gray-100">

<header class="w-full flex justify-between p-4 bg-[#bce354]">
    <div>
        <a href="${pageContext.request.contextPath}/">
            <h1 class="font-black">
                <i class="fa-solid fa-shirt"></i> VESTICORPS
            </h1>
        </a>
    </div>

    <div>
        <ul class="flex space-x-4">
            <li><a href="${pageContext.request.contextPath}/client/produit"><i class="fa fa-store"></i> Produits</a></li>
            <li><a href="${pageContext.request.contextPath}/client/panier"><i class="fa fa-cart-shopping"></i> Panier</a></li>
            <li><a href="${pageContext.request.contextPath}/client/commandes"><i class="fa fa-box"></i> Commandes</a></li>
            <li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-right-from-bracket"></i> Déconnexion</a></li>
        </ul>
    </div>
</header>


<main class="p-4">

    <!-- Informations utilisateur -->
    <div class="mb-4">
        <p>
            <i class="fa fa-user"></i>
            <c:out value="${utilisateur.nom }" />
            <c:out value="${utilisateur.prenom }" />
        </p>
        <p class="bg-[#bce354] p-1 w-fit rounded-xl">Client</p>
    </div>

    <h2 class="text-2xl text-center mb-4">Mes commandes</h2>

    
    <c:if test="${empty commandes}">
        <p class="text-center text-gray-500 text-xl mt-10">
            <i class="fa fa-circle-info"></i>
            Vous n'avez encore passé aucune commande.
        </p>
    </c:if>

    <!-- Liste des commandes -->
    <div class="mt-[32px] grid grid-cols-1 justify-items-center gap-y-[80px] md:grid-cols-2 xl:grid-cols-3">
        <c:forEach var="cmd" items="${commandes}">
            <div class="w-[350px] rounded overflow-hidden shadow-lg produit-card">
                <img class="w-[350px] h-[200px]" src="${pageContext.request.contextPath}/uploads/<c:out value='${cmd.produit.photo}' />" alt="">
                <div class="px-6 py-4">
                    <div class="font-bold text-xl text-center mb-2 nom-produit"> <c:out value="${cmd.produit.nom_produit}" /> </div>
                </div>
                <div class="p-2 flex flex-col space-y-2">
                    <span>Quantité commandé : <c:out value="${cmd.quantite_commande}" /> </span>
                    <span>Prix unitaire : <c:out value="${cmd.produit.prix_unitaire}" /> Ar </span>
                    <span>Montant total : <c:out value="${cmd.quantite_commande * cmd.produit.prix_unitaire}" /> Ar </span>
                    <span>Date du commande : <c:out value="${cmd.date_commande}" /> </span>
                </div>
            </div>
        </c:forEach>
    </div>

</main>

</body>
</html>
