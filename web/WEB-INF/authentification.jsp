<%-- 
    Document   : authentification
    Created on : 22 nov. 2025, 18:26:44
    Author     : HP
--%>

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
                <h1 class="font-black"> <i class="fa-solid fa-shirt"></i> VESTICORPS</h1>
            </div>

            <div>
                <ul class="flex space-x-[16px]">
                    <li><a> <i class="fa fa-user"></i> Se connecter</a></li>
                    <li><a> <i class="fa fa-user-plus"></i> Créer un compte</a></li>
                </ul>
            </div>
        </header>
        
        <div class="grow flex justify-center items-center">
            <div class="w-11/12 border border-solid border-[#e9e6e1] h-fit p-8">
                <div>
                    <h1 class="text-4xl text-center font-bold">Connexion</h1>
                    <p class="text-center text-[#7e83b0] mt-4">Connectez-vous à votre compte</p>
                </div>

                <div class="m-2">
                    <form>
                        <div class="flex flex-col">
                            <label>Email</label>
                            <input type="text" name="email" placeholder="Adresse email" class="border p-2 mt-1 outline-none" required />
                        </div>

                        <div class="flex flex-col mt-4">
                            <label>Mot de passe</label>
                            <input type="password" name="password" placeholder="Mot de passe" class="border p-2 mt-1 outline-none" required />
                        </div>

                        <div>
                            <input type="submit" value="Se connecter" class="w-full p-2 bg-[#bce354] mt-4" />
                        </div>
                    </form>
                </div>

                <div class="mt-4">
                    <p class="text-center">Pas encore de compte ? <a class="hover:text-green-800 hover:underline hover:cursor-pointer">Créer un compte</a></p>
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
