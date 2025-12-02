<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fontawesome/css/all.min.css">
        <title>Commandes effectuées</title>
    </head>

    <body>
        <header class="w-full flex justify-between p-4 bg-[#bce354]">
            <div>
                <a href="${pageContext.request.contextPath}/">
                    <h1 class="font-black">
                        <i class="fa-solid fa-shirt"></i> VESTICORPS
                    </h1>
                </a>
            </div>

            <div>
                <ul class="flex space-x-[16px]">
                    <li><a href="${pageContext.request.contextPath}/vendeur/produit"><i class="fa fa-store"></i> Produits</a></li>
                    <li><a href="${pageContext.request.contextPath}/vendeur/commandes"><i class="fa fa-cart-shopping"></i> Commandes</a></li>
                    <li><a href="${pageContext.request.contextPath}/vendeur/statistique"><i class="fa fa-chart-line"></i> Statistique</a></li>
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
                    <c:out value="${utilisateur.nom}" />
                    <c:out value="${utilisateur.prenom}" />
                </p>
            </div>

            <h2 class="text-2xl text-center">Commandes effectuées</h2>

            <div class="mt-[32px] grid grid-cols-1 justify-items-center gap-y-[80px] md:grid-cols-2 xl:grid-cols-3">

                <c:forEach var="cmd" items="${commandes}">
                    <div class="w-[350px] rounded overflow-hidden shadow-lg produit-card">

                        <!-- Photo produit -->
                        <img class="w-[350px] h-[200px] object-cover"
                             src="${pageContext.request.contextPath}/uploads/${cmd.produit.photo}"
                             alt="photo produit">

                        <!-- Nom produit -->
                        <div class="px-6 py-4">
                            <div class="font-bold text-xl text-center mb-2 nom-produit">
                                <c:out value="${cmd.produit.nom_produit}" />
                            </div>
                        </div>

                        <!-- Info commande -->
                        <div class="p-2 flex flex-col space-y-2">
                            <span>Quantité commandée : <c:out value="${cmd.quantite_commande}" /></span>

                            <span>Prix unitaire : <c:out value="${cmd.produit.prix_unitaire}" /> Ar</span>

                            <span>Montant total :
                                ${cmd.quantite_commande * cmd.produit.prix_unitaire} Ar
                            </span>

                            <span>Date du commande :
                                <c:out value="${cmd.date_commande}" />
                            </span>
                        </div>

                        <!-- Infos client -->
                        <div class="mt-4 p-2 flex flex-col space-y-2">
                            <h3 class="p-2 text-center font-bold">Information du client</h3>
                            
                            <span>Nom du client :
                                <c:out value="${utilisateur.nom}" />
                                <c:out value="${utilisateur.prenom}" />
                            </span>

                            <span>Email :
                                <c:out value="${utilisateur.email}" />
                            </span>
                            
                            <span>Tél :
                                <c:out value="${utilisateur.telephone}" />
                            </span>
                            
                            <span>Adresse :
                                <c:out value="${utilisateur.adresse}" />
                            </span>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </main>
    </body>
</html>
