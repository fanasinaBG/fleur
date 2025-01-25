-- Active: 1728498475504@@127.0.0.1@5432@fleur
CREATE TABLE vente (
    id SERIAL PRIMARY KEY, 
    idClient INT,
    idFleur INT ,
    dateVente DATE,
    Foreign Key (idClient) REFERENCES clients(id),
    Foreign Key (idFleur) REFERENCES fleur(id)
);

CREATE TABLE remise (
    id SERIAL PRIMARY KEY, 
    remise INT
);

insert into remise(remise) VALUES(200000);

select * from vente;

drop table vente;

drop view vue_ventes_completes;



select * from vue_ventes_completes;
drop table vente;
CREATE VIEW vue_ventes_completes AS
SELECT 
    v.id AS id_vente,
    c.nomClient AS nom_client,
    f.id AS id_fleur,
    f.nomFleur AS nom_fleur,
    f.prix AS prix_fleur,
    f.images AS images_fleur,
    v.idClient AS id_Client,
    v.idFleur AS id_fleur_vente,
    v.dateVente AS Date
FROM 
    vente v
JOIN 
    clients c ON v.idClient = c.id
JOIN 
    fleur f ON v.idFleur = f.id;
