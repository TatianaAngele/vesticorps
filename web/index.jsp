<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.min.css" />
        <link rel="stylesheet"  />
        <title>Bienvenue sur VESTICORPS</title>
    </head>
    <body class="overflow-x-hidden">
        <header class="w-full flex justify-between p-4 bg-[#bce354]">
            <div>
                <h1 class="font-black"> <i class="fa-solid fa-shirt"></i> VESTICORPS</h1>
            </div>

            <div>
                <ul class="flex space-x-[16px]">
                    <li><a href="${pageContext.request.contextPath}/auth"> <i class="fa fa-user"></i> Se connecter</a></li>
                    <li><a href="${pageContext.request.contextPath}/creer_compte"> <i class="fa fa-user-plus"></i> Créer un compte</a></li>
                </ul>
            </div>
        </header>
        
        <main class="w-full h-screen">
            <h1 class="my-8 text-center text-2xl">Bienvenue sur <span class="font-black text-[#bce354]">VESTICORPS</span>  </h1>
            
            <div class="flex flex-wrap justify-evenly overflow-x-hidden pb-4">

                <div class="w-[400px] shadow-2xl shadow-[#bce354] rounded-lg animate__animated animate__fadeInLeft">
                    <div class="bg-green-800 w-[400px] h-[200px] rounded-t-lg">
                        <img src="image/card1.jpg" class="w-[400px] h-[200px] rounded-t-lg" />                    
                    </div>
                    <div>
                       <h2 class="text-center p-2 font-black text-[#bce354] bg-[rgba(0,0,0,0.6)]">Client</h2>
                        <p class="p-4 text-justify">
                            Découvrez la mode qui vous ressemble ! Avec notre application, parcourez les dernières tendances, trouvez des pièces uniques et achetez vos styles préférés en quelques clics.
                        </p>
                    </div>
                </div>
                
                <div class="w-[400px]  shadow-2xl shadow-[#bce354] rounded-lg animate__animated animate__fadeInRight">
                    <div class="bg-green-800 w-[400px] h-[200px] rounded-t-lg">
                        <img src="image/card2.jpg" class="w-[400px] h-[200px] rounded-t-lg" />                    
                    </div>
                    <div>
                        <h2 class="text-center p-2 font-black text-[#bce354] bg-[rgba(0,0,0,0.6)]">Vendeur</h2>
                        <p class="p-4 text-justify">
                            Faites briller votre boutique au bout des doigts ! Rejoignez notre application et exposez vos créations de mode féminine à des milliers de clientes prêtes à craquer.
                        </p>
                    </div>
                </div>
            </div>
            
            <div class="mt-[48px] grid grid-rows-3 place-items-center md:grid-cols-2 md:grid-rows-2 xl:grid-cols-3 xl:grid-rows-1">
                <div class="w-[350px] flex flex-col p-2 shadow shadow-lg mt-4 rounded-lg">
                    <div class="mx-auto">
                        <i class="fa fa-star fa-3x text-[#bce354]"></i>
                    </div>
                    <div class="mx-auto mt-1">
                        <h4 class="font-bold">Qualité Premium</h4>
                    </div>
                    <div>
                        <p class="text-justify p-4">
                            Chaque pièce est soigneusement sélectionnée pour sa qualité
                        </p>
                    </div>
                </div>
                
                <div class="w-[350px] flex flex-col p-2 shadow shadow-lg mt-4 rounded-lg">
                    <div class="mx-auto">
                        <i class="fa fa-bolt fa-3x text-[#bce354]"></i>
                    </div>
                    <div class="mx-auto mt-1">
                        <h4 class="font-bold">Tendances Actuelles</h4>
                    </div>
                    <div>
                        <p class="text-justify p-4">
                            Restez à la pointe de la mode avec nos collections régulièrement renouvelées
                        </p>
                    </div>
                </div>
                
                <div class="w-[350px] flex flex-col p-2 shadow shadow-lg mt-4 rounded-lg">
                    <div class="mx-auto">
                        <i class="fa fa-gem fa-3x text-[#bce354]"></i>
                    </div>
                    <div class="mx-auto mt-1">
                        <h4 class="font-bold">Expérience Unique</h4>
                    </div>
                    <div>
                        <p class="text-justify p-4">
                            Une plateforme intuitive pour une expérience d'achat sans friction                        </p>
                        </p>
                    </div>
                </div>
            </div>
            
            <div class="mt-8 bg-[#1d1816] text-white p-8">
                <h1 class="text-4xl text-center">Rejoignez notre communauté</h1>
                
                <div>
                    <p class="text-center text-xl m-4">
                        Créez votre compte dès maintenant et profitez d'une expérience shopping personnalisée
                    </p>
                </div>
                
                <div class="mt-4 flex justify-center space-x-8">
                    <a  href="${pageContext.request.contextPath}/creer_compte" class="bg-white p-2 text-black rounded rounded-lg"> <i class="fa fa-user-plus"></i> Créer un compte</a>
                    <a href="${pageContext.request.contextPath}/auth" class="bg-white p-2 text-black rounded rounded-lg"> <i class="fa fa-user"></i> Se connecter</a>
                </div>
            </div>
            
            <div class="p-4 text-center">
                © 2025 VESTICORPS. Tous droits réservés.
                
                <div class="mt-4">
                    <a href="https://web.facebook.com/vesticorps"><i class="fa-brands fa-facebook fa-2x" style="color: #bce354;"></i></a>
                    <a href="https://twitter.com/vesticorps"><i class="fa-brands fa-twitter fa-2x" style="color: #bce354;"></i></a> 
                    <a href="https://instagram.com/vesticorps"><i class="fa-brands fa-instagram fa-2x" style="color: #bce354;"></i></a>
                </div>
            </div>
        </main>
    </body>
</html>
