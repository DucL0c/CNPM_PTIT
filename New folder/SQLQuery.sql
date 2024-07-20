CREATE TABLE tblTournament (id int IDENTITY NOT NULL, name varchar(100) NOT NULL, time date NOT NULL, location varchar(100) NOT NULL, rules varchar(500) NOT NULL, prizes varchar(500) NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblRound (id int IDENTITY NOT NULL,nameRound varchar(100) NOT NULL, time date NOT NULL, numberOfMatches int NOT NULL, tblTournamentid int NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblMatch (id int IDENTITY NOT NULL, nameMatch varchar(100) NOT NULL, tblRoundid int NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblChess_Match (id int IDENTITY NOT NULL, result varchar(50) NOT NULL, eloGain float(10) NOT NULL, elo float(10) NOT NULL, tblMatchId int NOT NULL, tblChessPlayerid int NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblChessPlayer (id int IDENTITY NOT NULL, name varchar(255) NOT NULL, dob date NOT NULL, [national] varchar(255) NOT NULL, totalPoint float(10) NOT NULL, totalOpponentPont float(10) NOT NULL, eloCoEfficient float(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblReceptionist (id int IDENTITY NOT NULL, name varchar(255) NOT NULL, username varchar(50) NOT NULL, password varchar(50) NOT NULL, position varchar(50) NOT NULL, salary float(10) NOT NULL, dob date NOT NULL, [national] varchar(255) NOT NULL, tel varchar(255) NOT NULL, tblTournamentid int NOT NULL, PRIMARY KEY (id));
ALTER TABLE tblRound ADD CONSTRAINT FKtblRound244832 FOREIGN KEY (tblTournamentid) REFERENCES tblTournament (id);
ALTER TABLE tblMatch ADD CONSTRAINT FKtblMatch803126 FOREIGN KEY (tblRoundid) REFERENCES tblRound (id);
ALTER TABLE tblChess_Match ADD CONSTRAINT FKtblChess_M587858 FOREIGN KEY (tblMatchId) REFERENCES tblMatch (id);
ALTER TABLE tblChess_Match ADD CONSTRAINT FKtblChess_M959427 FOREIGN KEY (tblChessPlayerid) REFERENCES tblChessPlayer (id);
ALTER TABLE tblReceptionist ADD CONSTRAINT FKtblRecepti560937 FOREIGN KEY (tblTournamentid) REFERENCES tblTournament (id);


INSERT INTO tblTournament(name, time, location, rules, prizes)
VALUES
    ('Champion League', '2024-05-01', 'VietNam', 'None', '10');

INSERT INTO tblReceptionist(name, username, password, position, salary, dob, [national], tel, tblTournamentid)
VALUES 
    ('Nguyen A', 'admin', '123', 'Receptionist', 20, '2003-10-20', 'VietNam', '113', 1);


INSERT INTO tblRound (nameRound, time, numberOfMatches, tblTournamentid)
VALUES 
    ('Round 1', '2024-11-11', 4, 1),
    ('Round 2', '2024-11-12', 4, 1),
    ('Round 3', '2024-11-13', 4, 1),
    ('Round 4', '2024-11-14', 4, 1),
    ('Round 5', '2024-11-15', 4, 1),
    ('Round 6', '2024-11-16', 4, 1),
    ('Round 7', '2024-11-17', 4, 1),
    ('Round 8', '2024-11-18', 4, 1),
    ('Round 9', '2024-12-01', 4, 1),
    ('Round 10', '2024-12-05', 4, 1),
    ('Round 11', '2024-12-10', 4, 1);