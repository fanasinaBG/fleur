<%
    // Récupérer les données du formulaire
    String tige = request.getParameter("tige");
    String action = request.getParameter("action");

    // Rediriger en fonction de l'action
    if ("addToCart".equals(action)) {
        // Traiter l'ajout au panier
        //session.setAttribute("tige", tige); // Si nécessaire
        response.sendRedirect("detailes.jsp");
    } else if ("buy".equals(action)) {
        String nom = (String) session.getAttribute("nom");
        if(nom == null){
            // Redirigez vers la page de connexion si l'utilisateur n'est pas connecté
            response.sendRedirect("../login.jsp");
        }
        else{
            session.setAttribute("tige", tige); // Si nécessaire
            response.sendRedirect("../buyPage.jsp");
        }
    } else {
        // Action non reconnue
        out.println("Action inconnue.");
    }
%>
