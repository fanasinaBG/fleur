<%@ page import="fleur.RequeteFleurCategorie" %>
<%@ page import="fleur.FleursCategories" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String query = request.getParameter("query");
    if (query != null && !query.trim().isEmpty()) {
        List<FleursCategories> results = RequeteFleurCategorie.searchFleurCategory(query);

        if (!results.isEmpty()) {
            for (FleursCategories fleur : results) {
%>
                <div 
                    class="suggestion-item" 
                    onclick="selectSuggestion('<%= fleur.getNomFleur() %>')"
                >
                    <strong><%= fleur.getNomFleur() %></strong> - <%= fleur.getNomCategory() %>
                </div>
<%
            }
        } else {
%>
            <div class="no-results">Aucune fleur trouvée.</div>
<%
        }
    }
%>
