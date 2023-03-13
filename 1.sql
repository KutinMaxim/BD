CREATE TABLE IF NOT EXISTS Genry(
	genry_id SERIAL PRIMARY KEY,
	title VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Performer(
	performer_id SERIAL PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Genry_Performer(
    id SERIAL PRIMARY KEY,
	genry_id INTEGER NOT NULL REFERENCES Genry(genry_id),
	performer_id INTEGER NOT NULL REFERENCES Performer(performer_id)
);

CREATE TABLE IF NOT EXISTS Album(
	album_id SERIAL PRIMARY KEY,
	title VARCHAR(80) UNIQUE NOT NULL,
    production_year DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Performer_Album(
    id SERIAL PRIMARY KEY,
	performer_id INTEGER NOT NULL REFERENCES Performer(performer_id),
	album_id INTEGER NOT NULL REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Track(
	track_id SERIAL PRIMARY KEY,
	title VARCHAR(80) UNIQUE NOT NULL,
    duration INTEGER(SECOND),
    album_id INTEGER NOT NULL REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Collection(
	collection_id SERIAL PRIMARY KEY,
	title VARCHAR(80) UNIQUE NOT NULL,
    production_year DATE 
);

CREATE TABLE IF NOT EXISTS Track_Collection(
    id SERIAL PRIMARY KEY,
	track_id INTEGER NOT NULL REFERENCES Track(track_id),
	collection_id INTEGER NOT NULL REFERENCES Collection(collection_id)
);