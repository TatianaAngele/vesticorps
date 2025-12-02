<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fontawesome/css/all.min.css">
        <script src="${pageContext.request.contextPath}/chart.js"></script>
        <title>Statistique de vente</title>
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
                <h2 class="text-2xl text-center">Statistique du vente</h2>
                
                
                <div class="p-4 mx-auto w-[350px] h-[175px] md:w-[700px] md:h-[350px] ">
                    <canvas id="venteChart"></canvas>
                </div>
                
            </div>
        </main>  
                
        <script>
            // Préparer les labels (axe X) et les valeurs (axe Y)
            const labels = [
                <c:forEach var="s" items="${stat}">
                    '<c:out value="${s.key}" />',
                </c:forEach>
            ];

            const data = [
                <c:forEach var="s" items="${stat}">
                    <c:out value="${s.value}" />,
                </c:forEach>
            ];

            // Configurer Chart.js
            const ctx = document.getElementById('venteChart').getContext('2d');
            const venteChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Total des ventes',
                        data: data,
                        backgroundColor: '#bce354',
                        borderColor: '#bce354',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>

    </body>
</html>
