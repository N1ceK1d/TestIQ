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