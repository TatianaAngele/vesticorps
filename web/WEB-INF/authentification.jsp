<%-- 
    Document   : authentification
    Created on : 22 nov. 2025, 18:26:44
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fontawesome/css/all.min.css">
        <title>VESTICORPS - Se connecter</title>
    </head>
    <body class="h-screen flex flex-col">
        <header class="w-full flex justify-between p-4 bg-[#bce354]">
            <div>
                <a href="${pageContext.request.contextPath}/"><h1 class="font-black"> <i class="fa-solid fa-shirt"></i> VESTICORPS</h1></a>
            </div>

            <div>
                <ul class="flex space-x-[16px]">
                    <li><a class="#"> <i class="fa fa-user"></i> Se connecter</a></li>
                    <li><a href="${pageContext.request.contextPath}/creer_compte"> <i class="fa fa-user-plus"></i> Créer un compte</a></li>
                </ul>
            </div>
        </header>
        
        <div class="grow flex justify-center items-center">
            <div class="w-11/12 sm:w-[480px] border border-solid border-[#e9e6e1] h-fit p-8">
                <div>
                    <h1 class="text-4xl text-center font-bold">Connexion</h1>
                    <p class="text-center text-[#7e83b0] mt-4">Connectez-vous à votre compte</p>
                </div>

                <div class="m-2">
                    
                    <%-- Message d'erreur (echec d'authentification) --%>
                    <c:if test="${sessionScope.etatAuthentification == 'echec'}">
                        <div class="p-2 mb-2 bg-red-500 rounded rounded-lg">
                            <p class="text-center text-white"> <i class="fa-solid fa-triangle-exclamation"></i> Vérifiez votre email et votre mot de passe.</p>
                        </div>
                        
                        <c:remove var="etatAuthentification" scope="session" />
                    </c:if>
                    
                    
                    <form method="POST" action="${pageContext.request.contextPath}/auth">
                        <div class="flex flex-col">
                            <label>Email</label>
                            <input type="text" name="email" placeholder="Adresse email" class="border p-2 mt-1 outline-none" required />
                        </div>

                        <div class="flex flex-col mt-4">
                            <label>Mot de passe</label>
                            <input type="password" name="mot_de_passe" placeholder="Mot de passe" class="border p-2 mt-1 outline-none" required />
                        </div>

                        <div>
                            <button type="submit" class="w-full p-2 bg-[#bce354] mt-4">
                                Se connecter
                            </button>
                        </div>
                    </form>
                </div>

                <div class="mt-4">
                    <p class="text-center">Pas encore de compte ? <a href="${pageContext.request.contextPath}/creer_compte" class="hover:text-green-800 hover:underline hover:cursor-pointer">Créer un compte</a></p>
                </div>
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
    </body>
</html>
