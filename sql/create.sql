CREATE TABLE Questions (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    question_text VARCHAR(255) NOT NULL
);

CREATE TABLE Answers (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    answer_text VARCHAR(255) NOT NULL,
    question_id INT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    answer_char VARCHAR(1) NOT NULL,
);

CREATE TABLE Admins (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(255) NOT NULL,
    password LONGTEXT NOT NULL
);

CREATE TABLE Companies (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255),
    second_name VARCHAR(255),
    last_name VARCHAR(255),
    post_position VARCHAR(255),
    company_id INT NOT NULL,
    FOREIGN KEY (company_id) REFERENCES Companies (id)
);

CREATE TABLE UsersResults (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,   
    points INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users (id)
);

CREATE TABLE QuestionImages (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    image_name VARCHAR(255) NOT NULL,
    question_id INT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES Questions (id)
);