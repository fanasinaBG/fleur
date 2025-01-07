<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="admin.Admin" %>
<%@ page import="admin.RequetAdmin" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Résultat de la soumission du formulaire</h1>
    <%
        //String nom = (String) session.getAttribute("nom");
        String mdp = request.getParameter("mdp");
        String email = request.getParameter("email");
        //String cardNumber = request.getParameter("cardnumber");
           // Vérifier si les paramètres ne sont pas null ou vides
    if (mdp != null && !mdp.isEmpty() && email != null && !email.isEmpty()) {
        // Créer une instance de RequettePDetails pour récupérer les données de la base
        RequetAdmin admis = new RequetAdmin();
        List<Admin> admi = admis.getAdmin();

        boolean isMatchFound = false;
        

        // Parcourir la liste des PaymentDetails et comparer
        for (Admin admin : admi) {
            if (admin.getEmail().equals(email) && admin.getMdp().equals(mdp)) {
                isMatchFound = true;
                break;  // Sortir de la boucle dès qu'une correspondance est trouvée
            }
        }

        if (isMatchFound) {
            out.println("gg loging reussi");
            //response.sendRedirect("../attente.jsp");
        } else {
            out.println("<p>Aucune correspondance trouvée.</p>");
           // response.setHeader("Refresh", "2; URL=../buyPage.jsp");
        }
    } else {
        out.println("<p>Le veillet remplir svp</p>");
        //response.setHeader("Refresh", "2; URL=../buyPage.jsp");
    }

    %> 
    <p>mdp : <strong><%= mdp%></strong></p>
    <p>email : <strong><%= email%></strong></p>  
</body>
</html>