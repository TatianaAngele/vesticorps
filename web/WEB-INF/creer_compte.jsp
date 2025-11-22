<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fontawesome/css/all.min.css">
        <title>VESTICORPS - Création d'un compte</title>
    </head>
    <body class="h-screen flex flex-col">
        <header class="w-full flex justify-between p-4 bg-[#bce354]">
            <div>
                 <a href="${pageContext.request.contextPath}/"><h1 class="font-black"> <i class="fa-solid fa-shirt"></i> VESTICORPS</h1></a>
            </div>

            <div>
                <ul class="flex space-x-[16px]">
                    <li><a href="${pageContext.request.contextPath}/auth"> <i class="fa fa-user"></i> Se connecter</a></li>
                    <li><a> <i class="fa fa-user-plus"></i> Créer un compte</a></li>
                </ul>
            </div>
        </header>
        
        <div class="grow flex justify-center items-center mt-8">
            <div class="w-11/12 sm:w-[480px] border border-solid border-[#e9e6e1] h-fit p-8">
                <div>
                    <h1 class="text-4xl text-center font-bold">Créer un compte</h1>
                    <p class="text-center text-[#7e83b0] mt-4">Rejoignez notre communauté</p>
                </div>

                <div class="m-2">
                    <form>
                        <div class="flex flex-col">
                            <label>Nom</label>
                            <input type="text" name="nom" placeholder="Nom de famille" class="border p-2 mt-1 outline-none" required />
                        </div>

                        <div class="flex flex-col mt-4">
                            <label>Prénom(s)</label>
                            <input type="text" name="prenom" placeholder="Prénom(s)" class="border p-2 mt-1 outline-none" required />
                        </div>
                        
                        <div class="flex flex-col mt-4">
                            <label>Email</label>
                            <input type="email" name="email" placeholder="Votre adresse email" class="border p-2 mt-1 outline-none" required />
                        </div>
                        
                        <div class="flex flex-col mt-4">
                            <label>Mot de passe</label>
                            <input type="password" name="mot_de_passe" placeholder="Mot de passe" class="border p-2 mt-1 outline-none" required />
                        </div>
                        
                        <div class="flex flex-col mt-4">
                            <label>Numéro de téléphone</label>
                            <input type="tel" name="telephone" placeholder="Numéro de téléphone" class="border p-2 mt-1 outline-none" required />
                        </div>
                        
                        <div class="flex flex-col mt-4">
                            <label>Adresse</label>
                            <input type="text" name="adresse" placeholder="Votre adresse" class="border p-2 mt-1 outline-none" required />
                        </div>
                        
                        <div class="flex flex-col mt-4">
                            <label>Type de compte</label>
                            
                            <div class="mt-2">
                                <input type="radio" id="client" name="role_utilisateur" value="client" />
                                <label for="client">Client - Je veux acheter des produits</label>
                            </div>
                            
                            <div class="mt-2">
                                <input type="radio" id="vendeur" name="role_utilisateur" value="vendeur" />
                                <label for="vendeur">Vendeur - Je veux vendre des produits</label>
                            </div>
                        </div>

                        <div>
                            <input type="submit" value="Créer mon compte" class="w-full p-2 bg-[#bce354] mt-4" />
                        </div>
                    </form>
                </div>

                <div class="mt-4">
                    <p class="text-center">Déjà un compte ? <a href="${pageContext.request.contextPath}/auth" class="hover:text-green-800 hover:underline hover:cursor-pointer">Se connecter</a></p>
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
