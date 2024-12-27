-- Active: 1728498475504@@127.0.0.1@5432@fleur
CREATE TABLE evenement (
    id SERIAL PRIMARY KEY, 
    nomEvenement VARCHAR(100) NOT NULL 
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY, 
    nomCategory VARCHAR(100) NOT NULL,
    idEvenement INT,
    Foreign Key (idEvenement) REFERENCES evenement(id) 
);

select * from category;

CREATE TABLE fleur (
    id SERIAL PRIMARY KEY, 
    nomFleur VARCHAR(100) NOT NULL,
    prix INT,
    idCategory INT,
    descriptions VARCHAR(255),
    images VARCHAR(55),
    Foreign Key (idCategory) REFERENCES category(id) 
);

CREATE TABLE payment (
    id SERIAL PRIMARY KEY, 
    nomPayment VARCHAR(100) NOT NULL
);

CREATE TABLE paymentDetail (
    id SERIAL PRIMARY KEY, 
    numero INT,
    idPayment INT ,
    Foreign Key (idPayment) REFERENCES payment(id)
);

CREATE TABLE clients (
    id SERIAL PRIMARY KEY, 
    nomClient VARCHAR(100) NOT NULL,
    email VARCHAR(100)NOT NULL,
    mdp VARCHAR (100) NOT NULL,
    idPayment INT ,
    Foreign Key (idPayment) REFERENCES payment(id)
);

CREATE TABLE confirmation (
    id SERIAL PRIMARY KEY, 
    descriptions VARCHAR(55) NOT NULL
);

CREATE TABLE etatLivrer (
    id SERIAL PRIMARY KEY, 
    descriptions VARCHAR(55) NOT NULL,
    idConfirmation INT,
    Foreign Key (idConfirmation) REFERENCES confirmation(id)
);

CREATE TABLE Livraison (
    id SERIAL PRIMARY KEY, 
    idFleur INT,
    idConfirmation INT,
    Foreign Key (idFleur) REFERENCES fleur(id),
    Foreign Key (idConfirmation) REFERENCES confirmation(id)
);
CREATE VIEW vue_fleurs_categories AS
SELECT 
    f.nomFleur,
    f.prix,
    f.descriptions,
    f.images,
    c.id AS category_id,
    c.nomCategory
FROM 
    fleur f
JOIN 
    category c ON f.idCategory = c.id;

select * from vue_fleurs_categories;


select * from clients; 

insert into evenement(nomEvenement)VALUES('quotidient');
insert into evenement(nomEvenement)VALUES('evenement');

insert into category(nomCategory,idEvenement)VALUES('Fleurs sauvages',1);
insert into category(nomCategory,idEvenement)VALUES('Fleurs de jardin',1);
insert into category(nomCategory,idEvenement)VALUES('Fleurs exotiques',1);
insert into category(nomCategory,idEvenement)VALUES('Fleurs à bulbe',1);
insert into category(nomCategory,idEvenement)VALUES('Fleurs annuelles',1);
insert into category(nomCategory,idEvenement)VALUES('Fleurs vivaces',1);

insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Coquelicots',28,1,'Le coquelicot est une fleur sauvage aux pétales rouges délicats, souvent associée à la mémoire et à la tranquillité, qui fleurit dans les champs et prairies ensoleillés','/assets/images/Coquelicot.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Marguerite',20,1,'La marguerite est une fleur délicate et lumineuse, caractérisée par ses pétales blancs disposés en cercle autour d un cœur jaune vif, symbolisant l innocence et la pureté.','/assets/images/Marguerite.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Bleuet',10,1,'Le bleuet est une fleur sauvage délicate, de couleur bleu vif, symbole de modestie, de pureté et de mémoire.','/assets/images/Bleuet.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Anémone',80,1,'L anémone est une fleur délicate et colorée symbolisant l espoir ou l abandon, connue pour ses pétales vibrants entourant un cœur sombre.','/assets/images/Anémone.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Primevère',30,1,'La primevère est une délicate fleur vivace aux couleurs vives, souvent associée au printemps, qui symbolise le renouveau et l espoir.','/assets/images/Primevère.jpg');


insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Rose',75,2,'La rose est une fleur délicate et parfumée, symbolisant l amour et la beauté, avec des pétales souvent veloutés et une large gamme de couleurs.','/assets/images/Rose.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Tulipe',37,2,'La tulipe est une fleur élégante aux pétales lisses et colorés, souvent en forme de coupe, qui symbolise la beauté et la fraîcheur du printemps.','/assets/images/Tulipe.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Lys',29,2,'Le lys est une fleur élégante aux grandes pétales souvent parfumées, symbolisant la pureté et la beauté, et se décline dans des couleurs variées, comme le blanc, le rose, l orange et le jaune.','/assets/images/Lys.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Pivoine',6,2,'La pivoine est une fleur élégante aux pétales luxuriants, souvent de couleur rose, rouge ou blanche, qui symbolise l amour, la prospérité et la chance.','/assets/images/Pivoine.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Hortensia',19,2,'L hortensia est une plante à fleurs luxuriantes, caractérisée par ses grappes de grandes fleurs arrondies qui varient en couleurs, allant du bleu au rose, selon le pH du sol.','/assets/images/Hortensia.jpg');


insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Orchidée',19,3,'L orchidée est une fleur exotique et élégante, connue pour ses pétales symétriques et ses couleurs variées, symbolisant la beauté, le luxe et l amour.','/assets/images/Orchidée.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Hibiscus',6,3,'L hibiscus est une fleur exotique aux grandes pétales colorées, souvent rouge, qui symbolise la beauté et l hospitalité.','/assets/images/Hibiscus.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Frangipanier',56,3,'Le frangipanier est une fleur exotique parfumée, caractérisée par ses pétales larges et colorés, souvent blancs, jaunes ou roses.','/assets/images/Frangipanier.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Oiseau de paradis',79,3,'L oiseau de paradis est une fleur exotique aux pétales colorés et aux formes distinctives, évoquant un oiseau en plein vol.','/assets/images/Oiseaudeparadis.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Anthurium',30,3,'Lanthurium est une plante tropicale au feuillage brillant et aux fleurs rouges, roses ou blanches en forme de spathes, symbolisant l hospitalité.','/assets/images/Anthurium.jpg');


insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Jacinthe',30,4,'La jacinthe est une fleur parfumée aux couleurs vives, souvent cultivée au printemps pour sa beauté et son parfum intense.','/assets/images/Jacinthe.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Narcisse',24,4,'Le narcisse est une fleur printanière élégante, souvent jaune ou blanche, avec une corolle en forme de trompette.','/assets/images/Narcisse.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Amaryllis',27,4,'L amaryllis est une plante à fleurs majestueuses, souvent rouges ou blanches, qui fleurit en hiver et symbolise la beauté et la fierté.','/assets/images/Amaryllis.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Crocus',7,4,'Le crocus est une petite fleur printanière colorée, souvent violette ou jaune, qui émerge tôt dans la saison, symbolisant le renouveau.','/assets/images/Crocus.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Dahlia',14,4,'Le dahlia est une fleur vibrante et colorée, appréciée pour sa diversité de formes et de tailles.','/assets/images/Dahlia.jpg');


insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Capucine',3,5,'La capucine est une fleur vivace colorée, aux pétales vibrants, souvent utilisée en jardinerie et en cuisine pour son goût piquant.','/assets/images/Capucine.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Pétunia',10,5,'Le pétunia est une fleur colorée et parfumée, souvent cultivée en jardinières ou en massifs pour sa floraison abondante et sa résistance aux intempéries.','/assets/images/Pétunia.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Souci',3,5,'Le souci est une fleur vivace aux pétales orange ou jaunes, souvent utilisée pour ses vertus médicinales et ornementales.','/assets/images/Souci.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Cosmos',8,5,'Le cosmos est une fleur colorée, délicate et légère, souvent utilisée dans les jardins pour sa beauté simple et sa longue période de floraison.','/assets/images/Cosmos.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Lobélie',2,5,'La lobélie est une plante vivace ou annuelle aux petites fleurs colorées, souvent bleues ou rouges, idéale pour les bordures ou les suspensions.','/assets/images/Lobélie.jpg');

insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Lavande',15,6,'La lavande est une plante aromatique à fleurs violettes, réputée pour son parfum apaisant et ses propriétés médicinales.','/assets/images/Lavande.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Géranium vivace',7,6,'Le géranium vivace est une plante robuste, à feuillage décoratif et fleurs colorées, qui revient chaque année.','/assets/images/GéraniumVivace.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Rudbeckia',33,6,'La rudbeckia est une fleur vivace aux pétales jaunes et au centre sombre, souvent appelée œil de soleil en raison de son apparence éclatante.','/assets/images/Rudbeckia.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Hémérocalle',13,6,'L hémérocalle est une fleur vivace aux grandes fleurs colorées, souvent de forme en trompette, qui fleurit pendant une courte période chaque été.','/assets/images/Hémérocalle.jpg');
insert into fleur(nomFleur,prix,idCategory,descriptions,images)VALUES('Echinacea',5,6,'L échinacée est une plante vivace aux fleurs colorées en forme de marguerite, réputée pour ses propriétés médicinales, notamment pour renforcer le système immunitaire.','/assets/images/Echinacea.jpg');

insert into payment(nomPayment)VALUES('PayPal');
insert into payment(nomPayment)VALUES('Carte Bancaire');

paymentDetail numero idPayment 

insert into paymentDetail(numero,idPayment)VALUES(4970101234567890,1);//mpbol tsy mandeh

clients

insert into clients(nomClient,email,mdp)VALUES('jibril','ibril@gmail.com','Karen');

select * from clients;



