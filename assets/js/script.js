const scrollContent = document.querySelector('.scroll-content');
const btnLeft = document.querySelector('.scroll-btn.left');
const btnRight = document.querySelector('.scroll-btn.right');

// Largeur d'une image + marge
const scrollStep = 220; // Largeur de déplacement

// Fonction pour mettre à jour la position du contenu avec scrollLeft
function updateScrollPosition() {
    const maxScroll = scrollContent.scrollWidth - scrollContent.offsetWidth;
    // Vérifie si le contenu a atteint le début ou la fin
    checkButtons();
}

// Vérifie si les boutons doivent être activés ou non
function checkButtons() {
    const maxScroll = scrollContent.scrollWidth - scrollContent.offsetWidth;
    if (scrollContent.scrollLeft <= 0) {
        btnLeft.disabled = true; // Désactiver le bouton gauche si à la première image
    } else {
        btnLeft.disabled = false;
    }

    if (scrollContent.scrollLeft >= maxScroll) {
        btnRight.disabled = true; // Désactiver le bouton droit si à la dernière image
    } else {
        btnRight.disabled = false;
    }
}

// Défilement manuel avec les boutons
btnLeft.addEventListener('click', () => {
    scrollContent.scrollBy({ left: -scrollStep, behavior: 'smooth' });
    updateScrollPosition();
});

btnRight.addEventListener('click', () => {
    scrollContent.scrollBy({ left: scrollStep, behavior: 'smooth' });
    updateScrollPosition();
});

// Initialisation de l'état des boutons
checkButtons();



