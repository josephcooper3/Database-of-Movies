DROP TABLE IF EXISTS castings;
DROP TABLE IF EXISTS stars;
DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE stars (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE castings (
  id SERIAL8 PRIMARY KEY,
  fee INT4,
  movie_id INT8 REFERENCES movies(id),
  star_id INT8 REFERENCES stars(id)
);
