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
                        
                
            </div>
        </main>
    </body>
</html>
