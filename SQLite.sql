CREATE TABLE type (
  name varchar(255) NOT NULL,
  PRIMARY KEY (name)
);
CREATE TABLE type_title (
  name VARCHAR(255) NOT NULL,
  tconst VARCHAR(255) NOT NULL,
  PRIMARY KEY (name, tconst),
  FOREIGN KEY (name) REFERENCES type(name),
  FOREIGN KEY (tconst) REFERENCES title_akas(tconst)
);
CREATE TABLE title_akas(
  tconst VARCHAR(255) NOT NULL,
  ordering INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  region VARCHAR(255) NOT NULL,
  language VARCHAR(255) NOT NULL,
  isOriginalTitle INT NOT NULL,
  PRIMARY KEY (tconst, ordering),
  FOREIGN KEY (tconst) REFERENCES title_basics(tconst)
);
CREATE TABLE attribute(
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (name)
);
CREATE TABLE akas_attributes(
  tconst VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (tconst, name),
  FOREIGN KEY (tconst) REFERENCES title_akas(tconst),
  FOREIGN KEY (name) REFERENCES attribute(name)
);
CREATE TABLE title_ratings (
  tconst VARCHAR(255) NOT NULL,
  averageRating INT NOT NULL,
  numVotes INT NOT NULL,
  PRIMARY KEY (tconst),
  FOREIGN KEY (tconst) REFERENCES title_basics(tconst)
);
CREATE TABLE title_basics (
  tconst VARCHAR(255) NOT NULL,
  titleType VARCHAR(255) NOT NULL,
  primaryType VARCHAR(255) NOT NULL,
  originalType VARCHAR(255) NOT NULL,
  isAdult INT NOT NULL,
  startYear VARCHAR(255) NOT NULL,
  endYear VARCHAR(255) NOT NULL,
  runtimeMinutes INT NOT NULL,
  PRIMARY KEY (tconst)
);
CREATE TABLE genre_title (
  name VARCHAR(255) NOT NULL,
  tconst VARCHAR(255) NOT NULL,
  PRIMARY KEY (name, tconst),
  FOREIGN KEY (name) REFERENCES genre(name),
  FOREIGN KEY (tconst) REFERENCES title_basics(tconst)
);
CREATE TABLE genre (
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (name)
);
CREATE TABLE title_episode(
  tconst VARCHAR(255) NOT NULL,
  parentTconst VARCHAR(255) NOT NULL,
  seasonNumber INT NOT NULL,
  episodeNumber INT NOT NULL,
  PRIMARY KEY (tconst),
  FOREIGN KEY (tconst) REFERENCES title_basics(tconst),
  FOREIGN KEY (parentTconst) REFERENCES title_principals(tconst)
);
CREATE TABLE title_principals (
  tconst VARCHAR(255) NOT NULL,
  ordering INT NOT NULL,
  category VARCHAR(255) NOT NULL,
  job VARCHAR(255) NOT NULL,
  characters VARCHAR(255) NOT NULL,
  PRIMARY KEY (tconst, ordering),
  FOREIGN KEY (tconst) REFERENCES title_basics(tconst)
);
CREATE TABLE title_director(
  tconst VARCHAR(255) NOT NULL,
  nconst VARCHAR(255) NOT NULL,
  PRIMARY KEY (tconst, nconst),
  FOREIGN KEY (tconst) REFERENCES title_basics(tconst),
  FOREIGN KEY (nconst) REFERENCES name_basics(nconst)
);
CREATE TABLE title_writer(
  tconst VARCHAR(255) NOT NULL,
  nconst VARCHAR(255) NOT NULL,
  PRIMARY KEY (tconst, nconst),
  FOREIGN KEY (tconst) REFERENCES title_basics(tconst),
  FOREIGN KEY (nconst) REFERENCES name_basics(nconst)
);
CREATE TABLE name_basics(
  nconst VARCHAR(255) NOT NULL,
  primaryName VARCHAR(255) NOT NULL,
  birthYear VARCHAR(255) NOT NULL,
  deathYear VARCHAR(255) NOT NULL,
  age INT,
  numberOfMovies INT,
  primary KEY (nconst)
);
CREATE TABLE principal_name(
  nconst VARCHAR(255) NOT NULL,
  tconst VARCHAR(255) NOT NULL,
  PRIMARY KEY (nconst, tconst),
  FOREIGN KEY (nconst) REFERENCES name_basics(nconst),
  FOREIGN KEY (tconst) REFERENCES title_principals(tconst)
);
CREATE TABLE profession (
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (name)
);
CREATE TABLE name_profession(
  nconst VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (nconst, name),
  FOREIGN KEY (nconst) REFERENCES name_basics(nconst),
  FOREIGN KEY (name) REFERENCES profession(name)
);