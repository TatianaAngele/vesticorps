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
                    <li><a href="${pageContext.request.contextPath}/auth"> <i class="fa fa-store"></i> Produits</a></li>
                    <li><a href="${pageContext.request.contextPath}/auth"> <i class="fa fa-cart-shopping"></i> Panier</a></li>
                    <li><a href="${pageContext.request.contextPath}/auth"> <i class="fa fa-cart-shopping"></i> Commandes</a></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/auth">
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
                <h2 class="text-2xl text-center">Produits disponibles</h2>
                
                
            </div>
        </main>
    </body>
</html>
