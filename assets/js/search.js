function performSearch(query) {
    if (query.length === 0) {
        document.getElementById("suggestions").innerHTML = "";
        return;
    }

    // Créer une requête AJAX
    const xhr = new XMLHttpRequest();
    xhr.open("GET", `search.jsp?query=${encodeURIComponent(query)}`, true);
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Ajouter les résultats dans la div suggestions
            document.getElementById("suggestions").innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}

function selectSuggestion(value) {
    document.getElementById("search-input").value = value;
    document.getElementById("suggestions").innerHTML = "";
}
