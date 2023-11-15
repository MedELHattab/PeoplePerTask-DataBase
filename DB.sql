CREATE DATABASE PeoplePerTask ;
CREATE TABLE Users (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    Hashed_Password VARCHAR(255),
    Email_Address VARCHAR(100) UNIQUE,
    Phone INT UNIQUE
);

CREATE TABLE Categories (
    Categorie_ID INT AUTO_INCREMENT PRIMARY KEY,
    Categorie_Name VARCHAR(50) UNIQUE
);

CREATE TABLE SousCategories (
    SousCategorie_ID INT AUTO_INCREMENT PRIMARY KEY,
    SousCategorie_Name VARCHAR(50),
    ID_Categorie INT NOT NULL,
    FOREIGN KEY (ID_Categorie) REFERENCES Categories(Categorie_ID)
);

CREATE TABLE Projects (
    Project_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Project_Description VARCHAR(200),
    Categorie_ID INT NOT NULL,
    SousCategorie_ID INT NOT NULL,
    User_ID INT NOT NULL,
    FOREIGN KEY (Categorie_ID) REFERENCES Categories(Categorie_ID),
    FOREIGN KEY (SousCategorie_ID) REFERENCES SousCategories(SousCategorie_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Freelancers (
    Freelancer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Freelancer_Name VARCHAR(50) UNIQUE,
    Competences VARCHAR(50),
    User_ID INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Offers (
    Offer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Amount INT,
    Deadline INT,
    Project_ID INT NOT NULL,
    Freelancer_ID INT NOT NULL,
    FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID),
    FOREIGN KEY (Freelancer_ID) REFERENCES Freelancers(Freelancer_ID)
);

CREATE TABLE Testimonials (
    Testimonial_ID INT AUTO_INCREMENT PRIMARY KEY,
    Comment VARCHAR(100),
    User_ID INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);





