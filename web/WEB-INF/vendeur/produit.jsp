<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fontawesome/css/all.min.css">
        <title>Mes produits</title>
    </head>
    <body>
        <header class="w-full flex justify-between p-4 bg-[#bce354]">
            <div>
                 <a href="${pageContext.request.contextPath}/"><h1 class="font-black"> <i class="fa-solid fa-shirt"></i> VESTICORPS</h1></a>
            </div>

            <div>
                <ul class="flex space-x-[16px]">
                    <li><a href="${pageContext.request.contextPath}/vendeur/produit"> <i class="fa fa-store"></i> Produits</a></li>
                    <li><a href="${pageContext.request.contextPath}/vendeur/commandes"> <i class="fa fa-cart-shopping"></i> Commandes</a></li>
                    <li><a href="${pageContext.request.contextPath}/vendeur/statistique"> <i class="fa fa-chart-line"></i> Statistique</a></li>
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
            </div>
                
            <div>
                <h2 class="text-2xl text-center">Mes produits</h2>
                
                <div class="flex justify-end mr-4">
                    <a href="${pageContext.request.contextPath}/vendeur/ajouterProduit" class="p-2 bg-[#bce354] rounded-lg">
                        <i class="fa fa-plus"></i> Ajouter un produit
                    </a>
                </div>
                        
                        
                <div class="mt-[32px] grid grid-cols-1 justify-items-center gap-y-[80px] md:grid-cols-2 xl:grid-cols-3">
                    <c:forEach var="produit" items="${produits}">
                        <div class="w-[350px] rounded overflow-hidden shadow-lg">
                            <img class="w-[350px] h-[200px]" src="${pageContext.request.contextPath}/uploads/<c:out value='${produit.photo}' />" alt="">
                            <div class="px-6 py-4">
                                <div class="font-bold text-xl mb-2"> <c:out value="${produit.nom_produit}" /> </div>
                                <p class="text-gray-700 text-base">
                                    <c:out value="${produit.description}" />
                                </p>
                            </div>
                            <div class="px-6 pt-4 pb-2 flex justify-center">
                                <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">Prix : <c:out value="${produit.prix_unitaire}" /> Ar </span>
                                <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">Qté en stock : <c:out value="${produit.quantite_stock}" /> </span>
                            </div>
                            <div class="flex justify-center gap-x-2 pb-4">
                                <a class="p-2 bg-[#bce354] rounded rounded-lg"> <i class="fa fa-pen"></i>  Modifier</a>
                                <a class="p-2 bg-red-500 rounded rounded-lg"> <i class="fa fa-trash"></i>  Supprimer</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>
    </body>
</html>
