-- Create the PictureGram database
DROP DATABASE IF EXISTS PictureGramDB;
CREATE DATABASE PictureGramDB;
USE PictureGramDB;

-- create the tables
CREATE TABLE Account (
    accountID CHAR(13) NOT NULL,
    accountName CHAR(25) NOT NULL,
    profilePath VARCHAR(255), -- make NOT NULL later???
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (accountID)
);

CREATE TABLE Post (
    accountID CHAR(13) NOT NULL,
    postID CHAR(13) NOT NULL,
    titleName VARCHAR(255) NOT NULL,
    datePosted DATETIME NOT NULL,
    imagePath VARCHAR(255), -- make NOT NULL later
    PRIMARY KEY (postID),
    FOREIGN KEY (accountID)
        REFERENCES Account (accountID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE PostComment (
    accountID CHAR(13) NOT NULL,
    postID CHAR(13) NOT NULL,
    commentID CHAR(13) NOT NULL,
    datePosted DATETIME NOT NULL,
    comment VARCHAR(255),
    PRIMARY KEY (commentID),
    FOREIGN KEY (accountID)
        REFERENCES Account (accountID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE USER 'pg_user'@'localhost' IDENTIFIED BY 'pg_user';
GRANT SELECT, DELETE, INSERT, UPDATE ON PictureGramDB.* TO 'pg_user'@'localhost';