DROP TABLE serie_photo;
DROP TABLE photo; 
DROP TABLE partie;
DROP TABLE serie;
DROP TABLE utilisateur;

CREATE Table utilisateur(
	id			VARCHAR(50) PRIMARY KEY UNIQUE NOT NULL,
	username	VARCHAR(50) UNIQUE NOT NULL,
	mail 		VARCHAR(100) UNIQUE NOT NULL,
	password	VARCHAR(500) NOT NULL
);

CREATE Table serie(
	id 				VARCHAR(50) PRIMARY KEY UNIQUE NOT NULL,
	nom				VARCHAR(100) NOT NULL,
	ville 			VARCHAR(100) NOT NULL,
	map_latitude 	DOUBLE PRECISION NOT NULL,
	map_longitude 	DOUBLE PRECISION NOT NULL,
	map_zoom 		DOUBLE PRECISION NOT NULL,
	dist 			INTEGER NOT NULL,
	idUtilisateur	VARCHAR(500) NOT NULL,
	CONSTRAINT utilisateur_fk FOREIGN KEY(idUtilisateur) REFERENCES utilisateur(id)
);

CREATE Table partie(
	id 			VARCHAR(50) PRIMARY KEY UNIQUE NOT NULL,
	token 		VARCHAR(100) UNIQUE NOT NULL,
	nb_photos 	INTEGER NOT NULL,
	status 		BOOLEAN NOT NULL, 
	score 		INTEGER NOT NULL,
	idJoueur 	VARCHAR(100),
	idSerie 	VARCHAR(100) NOT NULL,
	CONSTRAINT serie_fk FOREIGN KEY(idSerie) REFERENCES Serie(id)
);
	
CREATE Table photo(
	id 					VARCHAR(50) PRIMARY KEY UNIQUE NOT NULL,
	descr 				VARCHAR(100),
	position_latitude 	DOUBLE PRECISION NOT NULL,
	position_longitude 	DOUBLE PRECISION NOT NULL,
	url 				VARCHAR(100) NOT NULL,
	idSerie 			VARCHAR(50),
	CONSTRAINT serie2_fk FOREIGN KEY(idSerie) REFERENCES Serie(id)
);

