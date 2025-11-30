<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fontawesome/css/all.min.css">
        <title>Liste des produits</title>
    </head>
    <body>
        <header class="w-full flex justify-between p-4 bg-[#bce354]">
            <div>
                 <a href="${pageContext.request.contextPath}/"><h1 class="font-black"> <i class="fa-solid fa-shirt"></i> VESTICORPS</h1></a>
            </div>

            <div>
                <ul class="flex space-x-[16px]">
                    <li><a href="${pageContext.request.contextPath}/client/produits"> <i class="fa fa-store"></i> Produits</a></li>
                    <li><a href="${pageContext.request.contextPath}/client/panier"> <i class="fa fa-cart-shopping"></i> Panier</a></li>
                    <li><a href="${pageContext.request.contextPath}/client/commandes"> <i class="fa fa-box"></i> Commandes</a></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/logout">
                            <i class="fa fa-right-from-bracket"></i> 
                            Déconnexion 
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
            
            <div class="flex justify-center p-2">
                <input id="filtre-produit" type="text" placeholder="🔍 Rechercher un produit" class="border rounded-lg p-2 outline-none basis-3/4" />
            </div>
                
            <div>
                <h2 class="text-2xl text-center">Produits disponibles</h2>
                
                <div class="mt-[32px] grid grid-cols-1 justify-items-center gap-y-[80px] md:grid-cols-2 xl:grid-cols-3">
                    <!-- Produit a filter par son nom si l'utilisateur saisi dans l'input ci dessus -->
                    <c:forEach var="produit" items="${produits}">
                        <div class="w-[350px] rounded overflow-hidden shadow-lg produit-card">
                            <img class="w-[350px] h-[200px]" src="${pageContext.request.contextPath}/uploads/<c:out value='${produit.photo}' />" alt="">
                            <div class="px-6 py-4">
                                <div class="font-bold text-xl mb-2 nom-produit"> <c:out value="${produit.nom_produit}" /> </div>
                                <p class="text-gray-700 text-base">
                                    <c:out value="${produit.description}" />
                                </p>
                            </div>
                            <div class="px-6 pt-4 pb-2 flex justify-center">
                                <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">Prix : <c:out value="${produit.prix_unitaire}" /> Ar </span>
                                <span>
                                    <c:choose>
                                        <c:when test="${produit.quantite_stock == 0}">
                                            <span class="inline-block bg-[#e64545] rounded-full px-3 py-1 text-sm font-semibold text-white mr-2 mb-2">Rupture de stock</span>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${produit.quantite_stock <= 5}">
                                                    <span class="inline-block bg-[#f2d43d] rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">Stock faible</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="inline-block bg-[#bce354] rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">Stock suffisant</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <div class="flex justify-center gap-x-2 pb-4">
                                <c:choose>
                                    <c:when test="${produit.quantite_stock == 0}">
                                        <%-- Produit en rupture de stocke => On ne peut pas ajouter au panier --%>
                                        <span class="p-2 bg-[#d9e6b7] rounded rounded-lg"> <i class="fa fa-cart-shopping"></i>  Ajouter au panier</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/client/panier/ajouter?id_produit=${produit.id_produit}" class="p-2 bg-[#bce354] rounded rounded-lg"> <i class="fa fa-cart-shopping"></i>  Ajouter au panier</a>
                                     </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>
                
        <script>
            const inputFiltre = document.getElementById("filtre-produit");
            const produits = document.querySelectorAll(".produit-card");

            inputFiltre.addEventListener("input", function () {
                const texte = this.value.toLowerCase().trim();

                produits.forEach(card => {
                    const nom = card.querySelector(".nom-produit").textContent.toLowerCase();

                    if (nom.includes(texte)) {
                        card.style.display = "";    // Affiche
                    } else {
                        card.style.display = "none"; // Cache
                    }
                });
            });
        </script>
                    
    </body>
</html>
