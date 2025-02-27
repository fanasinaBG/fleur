-- Active: 1728498475504@@127.0.0.1@5432@fleur
CREATE TABLE evenement (
    id SERIAL PRIMARY KEY, 
    nomEvenement VARCHAR(100) NOT NULL 
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY, 
    nomCategory VARCHAR(100)
);


select * from category;

drop table category;

CREATE TABLE fleur (
    id SERIAL PRIMARY KEY, 
    nomFleur VARCHAR(100) NOT NULL,
    prix INT,
    images VARCHAR(55),
    quantite INT
);
select * from promotion;
drop table promotion;
drop view vue_fleurs_promotions;
create table promotion(
    id SERIAL PRIMARY KEY, 
    idFleur INT,
    promotion INT,
    dateFin DATE,
    dateDebut DATE
);

drop table promotion;
drop View vue_fleurs_promotions;

select * from fleur;

select * from vue_fleurs_promotions;

select * from promotion;

CREATE VIEW vue_fleurs_promotions AS
SELECT 
    f.id AS id_fleur,
    f.nomFleur,
    f.prix,
    f.images,
    f.quantite,
    p.promotion,
    p.dateFin,
    p.dateDebut
FROM 
    fleur f
 JOIN 
    promotion p
ON 
    f.id = p.idFleur;


insert into promotion(idFleur,promotion,dateFin,dateDebut)values(1,25,'2025-12-31','2026-12-31');


CREATE table FleurCategory(
    id SERIAL PRIMARY KEY,
    idFleur INT,
    idCategory INT,
    Foreign Key (idFleur) REFERENCES fleur(id),
    Foreign Key (idCategory) REFERENCES category(id) 
);

select* from fleur; 

CREATE TABLE administrateur (
    id SERIAL PRIMARY KEY,
    nomAdmin VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mdp VARCHAR(100) NOT NULL
);

CREATE TABLE payment (
    id SERIAL PRIMARY KEY, 
    nomPayment VARCHAR(100) NOT NULL
);

CREATE TABLE paymentDetail (
    id SERIAL PRIMARY KEY, 
    numero VARCHAR(255),
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

select * from commande;

CREATE TABLE Admins (
    id SERIAL PRIMARY KEY, 
    nomAdmins VARCHAR(100) NOT NULL,
    email VARCHAR(100)NOT NULL,
    mdp VARCHAR (100) NOT NULL
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
    Client VARCHAR(55),
    nomProduit VARCHAR(55),
    quantite VARCHAR(55),
    prixTotal INT,
    prixUnitaire Int,
    idConfirmation INT, 
    Foreign Key (idConfirmation) REFERENCES confirmation(id)
);

CREATE TABLE commande (
    id SERIAL PRIMARY KEY, 
    nomProduit VARCHAR(55),
    personne VARCHAR(55),
    quantite VARCHAR(55),
    prixTotal INT,
    prixUnitaire Int
);



drop table commande;

drop table Livraison;

select * from livraison;

drop view vue_fleurs_categories;
SELECT nomFleur,prix,descriptions,images,nomCategory FROM vue_fleurs_categories WHERE fleur_id =1;
select * from vue_fleurs_categories;

CREATE VIEW vue_fleurs_categories AS
SELECT 
    f.id AS fleur_id,
    f.nomFleur,
    f.prix,
    f.descriptions,
    f.images,
    f.quantite,
    c.id AS category_id,
    c.nomCategory
FROM 
    fleur f
JOIN 
    category c ON f.idCategory = c.id;

select * from vue_fleurs_categories;
CREATE VIEW vue_fleurs_categories AS
SELECT
    f.id AS fleur_id,
    f.nomFleur,
    f.prix,
    f.images,
    f.quantite,
    c.id AS category_id,
    c.nomCategory
FROM
    fleur f
JOIN
    FleurCategory fc ON f.id = fc.idFleur
JOIN
    category c ON fc.idCategory = c.id;


    CREATE VIEW paymentDetails AS
    SELECT 
        p.nomPayment as cart,
        d.numero as numeroCart,
        d.idPayment 
    FROM 
        payment p
    JOIN 
        paymentDetail d ON p.id = d.idPayment ;

select * from fleur where id=2;
drop Table paymentDetail;
select * from fleur;


select * from pay; 
SELECT nomFleur, nomCategory FROM vue_fleurs_categories WHERE nomFleur LIKE 'Coquelicots%';

insert into Admins(nomAdmins,email,mdp)VALUES('fanasina', 'fanasinabg@gmail.com','bogosy');
insert into paymentDetail(numero,idPayment)VALUES('5555 5555 5555 4444', 1);
insert into paymentDetail(numero,idPayment)VALUES('4111 1111 1111 1111', 2);

UPDATE fleur SET prix=18000 WHERE id=1;
UPDATE fleur SET prix=35000 WHERE id=2;
UPDATE fleur SET prix=38000 WHERE id=3;
UPDATE fleur SET prix=15000 WHERE id=4;
UPDATE fleur SET prix=19000 WHERE id=5;
UPDATE fleur SET prix=30000 WHERE id=6;
UPDATE fleur SET prix=40000 WHERE id=7;
UPDATE fleur SET prix=25000 WHERE id=8;
UPDATE fleur SET prix=10000 WHERE id=9;
UPDATE fleur SET prix=80000 WHERE id=10;
UPDATE fleur SET prix=180000 WHERE id=11;

insert into evenement(nomEvenement)VALUES('quotidient');
insert into evenement(nomEvenement)VALUES('evenement');

insert into category(nomCategory)VALUES('Fleurs sauvages');
insert into category(nomCategory)VALUES('Fleurs de jardin');
insert into category(nomCategory)VALUES('Fleurs exotiques');
insert into category(nomCategory)VALUES('Fleurs à bulbe');
insert into category(nomCategory)VALUES('Fleurs annuelles');
insert into category(nomCategory)VALUES('Fleurs vivaces');
insert into category(nomCategory)VALUES('Fleurs verte');
insert into category(nomCategory)VALUES('Fleurs nocturene');

select * from fleur; 




<<<<<<< HEAD
insert into fleur(nomFleur,prix,idCategory,images,quantite)VALUES('Monstera deliciosa',38,7,'/assets/images/Monstera deliciosa.jpg',100);
insert into fleur(nomFleur,prix,idCategory,images,quantite)VALUES('Ficus elastica',48,7,'/assets/images/Ficus elastica.jpg',100);
insert into fleur(nomFleur,prix,idCategory,images,quantite)VALUES('Chlorophytum comosum',58,7,'/assets/images/Chlorophytum comosum.jpg',100);
insert into fleur(nomFleur,prix,idCategory,images,quantite)VALUES('Dracaena marginata',58,7,'/assets/images/Dracaena marginata.jpg',100);
insert into fleur(nomFleur,prix,idCategory,images,quantite)VALUES('Sansevieria trifasciata',28,7,'/assets/images/Sansevieria trifasciata.jpg',100);
=======
drop view vue_fleurs_categories;
insert into FleurCategory(idFleur,idCategory)values(1,1);
insert into FleurCategory(idFleur,idCategory)values(2,2);
insert into FleurCategory(idFleur,idCategory)values(3,3);
insert into FleurCategory(idFleur,idCategory)values(4,4);
insert into FleurCategory(idFleur,idCategory)values(5,5);
insert into FleurCategory(idFleur,idCategory)values(6,6);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Monstera deliciosa',38,'/assets/images/Monstera deliciosa.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Ficus elastica',48,'/assets/images/Ficus elastica.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Chlorophytum comosum',58,'/assets/images/Chlorophytum comosum.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Dracaena marginata',58,'/assets/images/Dracaena marginata.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Sansevieria trifasciata',28,'/assets/images/Sansevieria trifasciata.jpg',100);
>>>>>>> a7838606071ebeca2946064299878b993b9cd94b

insert into fleur(nomFleur,prix,images,quantite)VALUES('Epiphyllum oxypetalum',49,'/assets/images/Epiphyllum oxypetalum.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Sansevieria trifasciata',58,'/assets/images/Sansevieria.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Jasminum sambac ',18,'/assets/images/Jasminum sambac.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Cestrum nocturnum',38,'/assets/images/Cestrum nocturnum.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Aloe vera',28,'/assets/images/Aloe vera.jpg',100);

insert into fleur(nomFleur,prix,images,quantite)VALUES('Coquelicots',28,'/assets/images/Coquelicot.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Marguerite',20,'La marguerite est une fleur délicate et lumineuse, caractérisée par ses pétales blancs disposés en cercle autour d un cœur jaune vif, symbolisant l innocence et la pureté.','/assets/images/Marguerite.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Bleuet',10,'Le bleuet est une fleur sauvage délicate, de couleur bleu vif, symbole de modestie, de pureté et de mémoire.','/assets/images/Bleuet.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Anémone',80,'L anémone est une fleur délicate et colorée symbolisant l espoir ou l abandon, connue pour ses pétales vibrants entourant un cœur sombre.','/assets/images/Anémone.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Primevère',30,'La primevère est une délicate fleur vivace aux couleurs vives, souvent associée au printemps, qui symbolise le renouveau et l espoir.','/assets/images/Primevère.jpg',100);


insert into fleur(nomFleur,prix,images,quantite)VALUES('Rose',75,2,'La rose est une fleur délicate et parfumée, symbolisant l amour et la beauté, avec des pétales souvent veloutés et une large gamme de couleurs.','/assets/images/Rose.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Tulipe',37,2,'La tulipe est une fleur élégante aux pétales lisses et colorés, souvent en forme de coupe, qui symbolise la beauté et la fraîcheur du printemps.','/assets/images/Tulipe.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Lys',29,2,'Le lys est une fleur élégante aux grandes pétales souvent parfumées, symbolisant la pureté et la beauté, et se décline dans des couleurs variées, comme le blanc, le rose, l orange et le jaune.','/assets/images/Lys.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Pivoine',6,2,'La pivoine est une fleur élégante aux pétales luxuriants, souvent de couleur rose, rouge ou blanche, qui symbolise l amour, la prospérité et la chance.','/assets/images/Pivoine.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Hortensia',19,2,'L hortensia est une plante à fleurs luxuriantes, caractérisée par ses grappes de grandes fleurs arrondies qui varient en couleurs, allant du bleu au rose, selon le pH du sol.','/assets/images/Hortensia.jpg',100);


insert into fleur(nomFleur,prix,images,quantite)VALUES('Orchidée',19,3,'L orchidée est une fleur exotique et élégante, connue pour ses pétales symétriques et ses couleurs variées, symbolisant la beauté, le luxe et l amour.','/assets/images/Orchidée.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Hibiscus',6,3,'L hibiscus est une fleur exotique aux grandes pétales colorées, souvent rouge, qui symbolise la beauté et l hospitalité.','/assets/images/Hibiscus.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Frangipanier',56,3,'Le frangipanier est une fleur exotique parfumée, caractérisée par ses pétales larges et colorés, souvent blancs, jaunes ou roses.','/assets/images/Frangipanier.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Oiseau de paradis',79,3,'L oiseau de paradis est une fleur exotique aux pétales colorés et aux formes distinctives, évoquant un oiseau en plein vol.','/assets/images/Oiseaudeparadis.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Anthurium',30,3,'Lanthurium est une plante tropicale au feuillage brillant et aux fleurs rouges, roses ou blanches en forme de spathes, symbolisant l hospitalité.','/assets/images/Anthurium.jpg',100);


insert into fleur(nomFleur,prix,images,quantite)VALUES('Jacinthe',30,4,'La jacinthe est une fleur parfumée aux couleurs vives, souvent cultivée au printemps pour sa beauté et son parfum intense.','/assets/images/Jacinthe.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Narcisse',24,4,'Le narcisse est une fleur printanière élégante, souvent jaune ou blanche, avec une corolle en forme de trompette.','/assets/images/Narcisse.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Amaryllis',27,4,'L amaryllis est une plante à fleurs majestueuses, souvent rouges ou blanches, qui fleurit en hiver et symbolise la beauté et la fierté.','/assets/images/Amaryllis.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Crocus',7,4,'Le crocus est une petite fleur printanière colorée, souvent violette ou jaune, qui émerge tôt dans la saison, symbolisant le renouveau.','/assets/images/Crocus.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Dahlia',14,4,'Le dahlia est une fleur vibrante et colorée, appréciée pour sa diversité de formes et de tailles.','/assets/images/Dahlia.jpg',100);


insert into fleur(nomFleur,prix,images,quantite)VALUES('Capucine',3,5,'La capucine est une fleur vivace colorée, aux pétales vibrants, souvent utilisée en jardinerie et en cuisine pour son goût piquant.','/assets/images/Capucine.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Pétunia',10,5,'Le pétunia est une fleur colorée et parfumée, souvent cultivée en jardinières ou en massifs pour sa floraison abondante et sa résistance aux intempéries.','/assets/images/Pétunia.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Souci',3,5,'Le souci est une fleur vivace aux pétales orange ou jaunes, souvent utilisée pour ses vertus médicinales et ornementales.','/assets/images/Souci.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Cosmos',8,5,'Le cosmos est une fleur colorée, délicate et légère, souvent utilisée dans les jardins pour sa beauté simple et sa longue période de floraison.','/assets/images/Cosmos.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Lobélie',2,5,'La lobélie est une plante vivace ou annuelle aux petites fleurs colorées, souvent bleues ou rouges, idéale pour les bordures ou les suspensions.','/assets/images/Lobélie.jpg',100);

insert into fleur(nomFleur,prix,images,quantite)VALUES('Lavande',15,6,'La lavande est une plante aromatique à fleurs violettes, réputée pour son parfum apaisant et ses propriétés médicinales.','/assets/images/Lavande.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Géranium vivace',7,6,'Le géranium vivace est une plante robuste, à feuillage décoratif et fleurs colorées, qui revient chaque année.','/assets/images/GéraniumVivace.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Rudbeckia',33,6,'La rudbeckia est une fleur vivace aux pétales jaunes et au centre sombre, souvent appelée œil de soleil en raison de son apparence éclatante.','/assets/images/Rudbeckia.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Hémérocalle',13,6,'L hémérocalle est une fleur vivace aux grandes fleurs colorées, souvent de forme en trompette, qui fleurit pendant une courte période chaque été.','/assets/images/Hémérocalle.jpg',100);
insert into fleur(nomFleur,prix,images,quantite)VALUES('Echinacea',5,6,'L échinacée est une plante vivace aux fleurs colorées en forme de marguerite, réputée pour ses propriétés médicinales, notamment pour renforcer le système immunitaire.','/assets/images/Echinacea.jpg',100);

insert into payment(nomPayment)VALUES('PayPal');
insert into payment(nomPayment)VALUES('Carte Bancaire');

insert into promotion(idFleur, )

paymentDetail numero idPayment 

insert into paymentDetail(numero,idPayment)VALUES(4970101234567890,1);//mpbol tsy mandeh


insert into clients(nomClient,email,mdp)VALUES('jibril','ibril@gmail.com','Karen');

select * from clients;

insert into administrateur(nomAdmin, email, mdp) VALUES ('jean', 'jean@gmail.com', '123');

select * from administrateur;
