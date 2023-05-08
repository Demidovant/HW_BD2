CREATE TABLE IF NOT EXISTS artists (
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS collections (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_genre (
	artist_genre_id SERIAL PRIMARY KEY,
	genre INT NOT NULL REFERENCES genres(genre_id),
	artist INT NOT NULL REFERENCES artists(artist_id)
);

CREATE TABLE IF NOT EXISTS tracks (
	track_id SERIAL PRIMARY KEY,
	album INT NOT NULL REFERENCES albums(album_id),
	duration INT NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_album (
	artist_album_id SERIAL PRIMARY KEY,
	artist INT NOT NULL REFERENCES artists(artist_id),
	album INT NOT NULL REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS collection_track (
	collection_track_id SERIAL PRIMARY KEY,
	collection INT NOT NULL REFERENCES collections(collection_id),
	track INT NOT NULL REFERENCES tracks(track_id)
);