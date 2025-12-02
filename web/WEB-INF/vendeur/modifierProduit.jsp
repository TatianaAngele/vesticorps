<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fontawesome/css/all.min.css">
        <title>Modification du produit <c:out value="${produit.nom_produit}" /> </title>
    </head>
    <body>
        <header class="w-full flex justify-between p-4 bg-[#bce354]">
            <div>
                <h1 class="font-black"> <i class="fa-solid fa-shirt"></i> VESTICORPS</h1>
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
                <h1 class="text-2xl text-center">Modification du produit <c:out value="${produit.nom_produit}" /> </h1>
                
                <div class="grow flex justify-center items-center mt-8 mb-8">
                    <div class="w-11/12 sm:w-[480px] border border-solid border-[#e9e6e1] h-fit p-8 rounded rounded-lg">
                        <form method="POST" action="${pageContext.request.contextPath}/vendeur/produit/modifier">
                            <div class="flex flex-col">
                                <label>
                                    
                                    Nom du produit
                                </label>
                                <input type="text" name="nom_produit" placeholder="Nom du produit" class="border p-2 mt-1 outline-none" value="<c:out value='${produit.nom_produit}' />" required />
                            </div>
                            
                            <div class="flex flex-col mt-3">
                                <label>Description</label>
                                <input type="text" name="description" placeholder="Description du produit" class="border p-2 mt-1 outline-none" value="<c:out value='${produit.description}' />" required />
                            </div>
                            
                            <div class="flex flex-col mt-3">
                                <label>Prix unitaire (Ar)</label>
                                <input type="number" name="prix_unitaire" class="border p-2 mt-1 outline-none" placeholder="Montant en Ariary" min="4500" step="500" value="<c:out value='${produit.prix_unitaire}' />" required />
                            </div>
                            
                            <div class="flex flex-col mt-3">
                                <label>Quantité en stock</label>
                                <input type="number" name="quantite_stock" class="border p-2 mt-1 outline-none" placeholder="Quantité en stock du produit" min="1" step="1" value="<c:out value='${produit.quantite_stock}' />" required />
                                <input type="hidden" name="id_produit" value="<c:out value='${produit.id_produit}' />" />
                            </div>
                            
                            <div class="mt-3">
                            <button type="submit" class="w-full p-2 bg-[#bce354] mt-4">
                                <i class="fa fa-pen"></i> Modifier le produit
                            </button>
                        </div>
                        </form>
                    </div>
                </div>
                
            </div>
        </main>                    
    </body>
</html>
