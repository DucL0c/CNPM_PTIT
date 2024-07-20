-- Tạo bảng tblTournament
CREATE TABLE tblTournament (
    id INT IDENTITY NOT NULL,
    name NVARCHAR(100) NOT NULL,
    time DATE NOT NULL,
    location NVARCHAR(100) NOT NULL,
    rules NVARCHAR(500) NOT NULL,
    prizes NVARCHAR(500) NOT NULL,
    PRIMARY KEY (id)
);

-- Tạo bảng tblRound
CREATE TABLE tblRound (
    id INT IDENTITY NOT NULL,
    nameRound VARCHAR(100) NOT NULL,
    time DATE NOT NULL,
    tblTournamentid INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tblTournamentid) REFERENCES tblTournament (id)
);

-- Tạo bảng tblMatch
CREATE TABLE tblMatch (
    id INT IDENTITY NOT NULL,
    nameMatch VARCHAR(100) NOT NULL,
    tblRoundid INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tblRoundid) REFERENCES tblRound (id)
);

-- Tạo bảng tblChessPlayer
CREATE TABLE tblChessPlayer (
    id INT IDENTITY NOT NULL,
    name NVARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    [national] NVARCHAR(255) NOT NULL,
	elo FLOAT(10) NOT NULL,
    PRIMARY KEY (id)
);

-- Tạo bảng tblChess_Match
CREATE TABLE tblChess_Match (
    id INT IDENTITY NOT NULL,
    --result NVARCHAR(50) NOT NULL,
    pointGain FLOAT(10) NOT NULL,
    tblMatchId INT NOT NULL,
    tblChessPlayerid INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tblMatchId) REFERENCES tblMatch (id),
    FOREIGN KEY (tblChessPlayerid) REFERENCES tblChessPlayer (id)
);


-- Tạo bảng tblReceptionist
CREATE TABLE tblReceptionist (
    id INT IDENTITY NOT NULL,
    name NVARCHAR(255) NOT NULL,
    username NVARCHAR(50) NOT NULL,
    password NVARCHAR(50) NOT NULL,
    position NVARCHAR(50) NOT NULL,
    salary FLOAT(10) NOT NULL,
    dob DATE NOT NULL,
    [national] NVARCHAR(255) NOT NULL,
    tel NVARCHAR(255) NOT NULL,
    tblTournamentid INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tblTournamentid) REFERENCES tblTournament (id)
);


-- dữ liệu bảng tournament
INSERT INTO tblTournament(name, time, location, rules, prizes)
VALUES
    ('Champion League', '2024-05-01', 'VietNam', 'None', '10');


-- dữ liệu bảng recept
INSERT INTO tblReceptionist(name, username, password, position, salary, dob, [national], tel, tblTournamentid)
VALUES 
    ('Nguyen A', 'admin', '123', 'Receptionist', 20, '2003-10-20', 'VietNam', '113', 1);


-- dữ liệu bảng round
INSERT INTO tblRound (nameRound, time, tblTournamentid)
VALUES 
    ('Round 1', '2024-11-11', 1),
    ('Round 2', '2024-11-12', 1),
    ('Round 3', '2024-11-13', 1),
    ('Round 4', '2024-11-14', 1),
    ('Round 5', '2024-11-15', 1),
    ('Round 6', '2024-11-16', 1),
    ('Round 7', '2024-11-17', 1),
    ('Round 8', '2024-11-18', 1),
    ('Round 9', '2024-12-01', 1),
    ('Round 10', '2024-12-05', 1),
    ('Round 11', '2024-12-10', 1);


-- dữ liệu bảng chessplayer
INSERT INTO tblChessPlayer (name, dob, [national], elo)
VALUES
    ('Magnus Carlsen', '1990-11-30', 'Na Uy', 2847),
    ('Fabiano Caruana', '1992-07-30', 'My', 2820),
    ('Ding Liren', '1992-10-24', 'Trung Quoc', 2791),
    ('Ian Nepomniachtchi', '1990-07-14', 'Nga', 2789),
    ('Wesley So', '1993-10-09', 'My', 2770),
    ('Levon Aronian', '1982-10-06', 'Armenia', 2765),
    ('Maxime Vachier-Lagrave', '1990-10-21', 'Phap', 2751),
    ('Anish Giri', '1994-06-28', 'Ha Lan', 2743);


-- dữ liệu bảng match
INSERT INTO tblMatch (nameMatch, tblRoundid)
SELECT TOP 44 
    'Match ' + CAST((ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1) % 4 + 1 AS VARCHAR) + ' of Round ' + CAST((ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1) / 4 + 1 AS VARCHAR), 
    ((ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1) / 4) % 11 + 1
FROM sys.objects AS o1
CROSS JOIN sys.objects AS o2;



-- dữ liệu bảng chess_match
INSERT INTO tblChess_Match (pointGain, tblMatchId, tblChessPlayerid)
VALUES
    (1, 1, 1),    -- Trận đấu 1: Cờ thủ 1 thắng
    (0, 1, 2),    -- Trận đấu 2: Cờ thủ 2 thua
    (1, 2, 3),    -- Trận đấu 3: Cờ thủ 3 thắng
    (0, 2, 4),    -- Trận đấu 4: Cờ thủ 4 thua
    (1, 3, 5),    -- Trận đấu 5: Cờ thủ 5 thắng
    (0,3, 6),    -- Trận đấu 6: Cờ thủ 6 thua
    (0.5, 4, 7),-- Trận đấu 7: Cờ thủ 7 hòa
    (0.5, 4, 8),-- Trận đấu 8: Cờ thủ 8 hòa
    (1, 5, 1),    -- Trận đấu 9: Cờ thủ 1 thắng
    (0, 5, 3),    -- Trận đấu 10: Cờ thủ 3 thua
    (1, 6, 2),    -- Trận đấu 11: Cờ thủ 2 thắng
    (0, 6, 6),    -- Trận đấu 12: Cờ thủ 6 thua
    (0.5, 7, 4),-- Trận đấu 13: Cờ thủ 4 hòa
    (0.5, 7, 8),  -- Trận đấu 14: Cờ thủ 8 hòa
    (1, 8, 7),  -- Trận đấu 15: Cờ thủ 7 thắng
    (0, 8, 5);    -- Trận đấu 16: Cờ thủ 5 thua



-- lấy tổng điểm của các vòng đã đấu
SELECT cp.id, cp.name ,cp.dob ,cp.[national] ,SUM(cm.pointGain) AS total_point
FROM tblChessPlayer cp
JOIN tblChess_Match cm ON cp.id = cm.tblChessPlayerid
JOIN tblMatch m ON cm.tblMatchId = m.id
JOIN tblRound r ON m.tblRoundid = r.id
WHERE r.id <= 4
GROUP BY cp.id, cp.name,cp.dob ,cp.[national]
ORDER BY total_point DESC;

-- Đếm các trận trong 1 round đấu
SELECT COUNT(*) AS match_count
FROM tblMatch m
JOIN tblChess_Match c ON c.tblMatchId = m.id
JOIN tblRound r ON m.tblRoundid = r.id
WHERE r.id = 5;


--Lấy ra lịch sử
SELECT r.id AS RoundID,
       (SELECT name FROM tblChessPlayer WHERE id = opp.tblChessPlayerid) AS OpponentName,
       cm.pointGain AS EloChange
FROM tblChess_Match cm
JOIN tblMatch tm ON cm.tblMatchId = tm.id
JOIN tblRound r ON tm.tblRoundId = r.id
JOIN tblChess_Match opp ON opp.tblMatchId = tm.id AND opp.id != cm.id
WHERE cm.tblChessPlayerid = 3
ORDER BY RoundID;


--lấy ra lịch sử
WITH MatchDetails AS (
    SELECT 
        r.id AS RoundID,
        cp1.id AS PlayerID,
        cp1.name AS PlayerName,
        cp1.elo AS PlayerElo,
        cp2.name AS OpponentName,
        cp2.elo AS OpponentElo,
        cm.pointGain
    FROM 
        tblChess_Match cm
    JOIN 
        tblMatch tm ON cm.tblMatchId = tm.id
    JOIN 
        tblRound r ON tm.tblRoundId = r.id
    JOIN 
        tblChess_Match opp ON opp.tblMatchId = tm.id AND opp.id != cm.id
    JOIN 
        tblChessPlayer cp1 ON cm.tblChessPlayerid = cp1.id
    JOIN 
        tblChessPlayer cp2 ON opp.tblChessPlayerid = cp2.id
    WHERE 
        cm.tblChessPlayerid = 1
),
EloCalculations AS (
    SELECT 
        RoundID,
        PlayerID,
        PlayerName,
        PlayerElo,
        OpponentName,
        OpponentElo,
        pointGain,
        1.0 / (1.0 + POWER(10.0, (OpponentElo - PlayerElo) / 400.0)) AS ExpectedScore,
        CASE 
            WHEN pointGain = 1 THEN 20
            WHEN pointGain = 0 THEN -20
            WHEN pointGain = 0.5 THEN 0
        END AS StaticEloChange,
        20 * (pointGain - (1.0 / (1.0 + POWER(10.0, (OpponentElo - PlayerElo) / 400.0)))) AS EloChange
    FROM 
        MatchDetails
)
SELECT 
    RoundID,
    --PlayerName,
    --PlayerElo,
    OpponentName,
    --OpponentElo,
    --pointGain,
    --ExpectedScore,
    EloChange,
	CASE 
        WHEN pointGain = 1 THEN 'W'
        WHEN pointGain = 0 THEN 'L'
        WHEN pointGain = 0.5 THEN 'H'
    END AS result
FROM 
    EloCalculations
ORDER BY 
    RoundID;
