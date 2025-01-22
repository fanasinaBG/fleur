CREATE TABLE vente (
    id SERIAL PRIMARY KEY, 
    idClient INT,
    idFleur INT ,
    Foreign Key (idClient) REFERENCES clients(id),
    Foreign Key (idFleur) REFERENCES fleur(id)
);

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
    v.idFleur AS id_fleur_vente
FROM 
    vente v
JOIN 
    clients c ON v.idClient = c.id
JOIN 
    fleur f ON v.idFleur = f.id;
