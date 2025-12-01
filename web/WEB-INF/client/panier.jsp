<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fontawesome/css/all.min.css">
    <title>Panier</title>
</head>

<body>

<header class="w-full flex justify-between p-4 bg-[#bce354]">
    <div>
        <a href="${pageContext.request.contextPath}/"><h1 class="font-black"><i class="fa-solid fa-shirt"></i> VESTICORPS</h1></a>
    </div>
    <div>
        <ul class="flex space-x-[16px]">
            <li><a href="${pageContext.request.contextPath}/client/produit"> <i class="fa fa-store"></i> Produits</a></li>
            <li><a href="${pageContext.request.contextPath}/client/panier"> <i class="fa fa-cart-shopping"></i> Panier</a></li>
            <li><a href="${pageContext.request.contextPath}/client/commandes"> <i class="fa fa-box"></i> Commandes</a></li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">
                    <i class="fa fa-right-from-bracket"></i> Déconnexion
                </a>
            </li>
        </ul>
    </div>
</header>

<main>
    
    <div class="p-4">
        <p>
            <i class="fa fa-user"></i>
            <c:out value="${utilisateur.nom }" />
            <c:out value="${utilisateur.prenom }" />   
        </p>
        <p class="bg-[#bce354] p-1 w-fit rounded-xl">Client</p>
    </div>
    
    <h2 class="text-2xl text-center mb-4">Votre panier</h2>

    <c:choose>
        <c:when test="${empty panier}">
            <p class="text-center text-gray-600 text-xl mt-10">Votre panier est vide 🛒</p>
        </c:when>

        <c:otherwise>

            <div class="flex flex-col space-y-6 max-w-4xl mx-auto">

                <!-- Calcul du total -->
                <c:set var="total" value="0" />

                <c:forEach var="item" items="${panier}">
                    <c:set var="produit" value="${item[0]}" />
                    <c:set var="quantite" value="${item[1]}" />

                    <!-- Ajout au total -->
                    <c:set var="total" value="${total + (produit.prix_unitaire * quantite)}" />

                    <div class="flex items-center border p-4 rounded-lg shadow gap-x-4">

                        <img src="${pageContext.request.contextPath}/uploads/${produit.photo}"
                             class="w-[120px] h-[80px] object-cover rounded">

                        <div class="flex-1">
                            <h3 class="font-bold text-xl">${produit.nom_produit}</h3>
                            <p class="text-gray-600">${produit.description}</p>

                            <p class="mt-2 font-semibold">
                                Prix unitaire : ${produit.prix_unitaire} Ar
                            </p>

                            <p class="font-semibold">
                                Quantité : ${quantite}
                            </p>
                        </div>

                        <!-- Bouton suppression -->
                        <a href="${pageContext.request.contextPath}/client/panier/supprimer?id_produit=${produit.id_produit}"
                           class="text-red-600 text-xl">
                            <i class="fa fa-trash"></i>
                        </a>

                    </div>

                </c:forEach>

                <!-- Total -->
                <div class="text-right text-2xl font-bold mt-6">
                    Total : ${total} Ar
                </div>

                <!-- Bouton de validation -->
                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/client/commande/valider"
                       class="px-6 py-3 text-black bg-[#bce354] rounded-lg shadow">
                        <i class="fa fa-check"></i> Valider la commande
                    </a>
                </div>

            </div>

        </c:otherwise>

    </c:choose>

</main>

</body>
</html>
