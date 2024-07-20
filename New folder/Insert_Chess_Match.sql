INSERT INTO tblChessPlayer (name, dob, [national], totalPoint, totalOpponentPont, eloCoEfficient)
VALUES
    ('Magnus Carlsen', '1990-11-30', 'Na Uy', 0, 0, 2870),
    ('Fabiano Caruana', '1992-07-30', 'My', 0, 0, 2820),
    ('Ding Liren', '1992-10-24', 'Trung Quoc', 0, 0, 2791),
    ('Ian Nepomniachtchi', '1990-07-14', 'Nga', 0, 0, 2789),
    ('Wesley So', '1993-10-09', 'My', 0, 0, 2786),
    ('Levon Aronian', '1982-10-06', 'Armenia', 0, 0, 2778),
    ('Maxime Vachier-Lagrave', '1990-10-21', 'Phap', 0, 0, 2773),
    ('Anish Giri', '1994-06-28', 'Ha Lan', 0, 0, 2764);


INSERT INTO tblChess_Match (result,opponentName,eloGain, elo, tblMatchId, tblChessPlayerid)
VALUES
    ('W','Fabiano Caruana', 1, 1, 1, 1),    -- Trận đấu 1: Cờ thủ 1 thắng
    ('L','Magnus Carlsen', 0, 0, 1, 2),    -- Trận đấu 2: Cờ thủ 2 thua
    ('W','Ian Nepomniachtchi' ,1, 1, 2, 3),    -- Trận đấu 3: Cờ thủ 3 thắng
    ('L','Ding Liren',0, 0, 2, 4),    -- Trận đấu 4: Cờ thủ 4 thua
    ('W','Levon Aronian',1, 1, 3, 5),    -- Trận đấu 5: Cờ thủ 5 thắng
    ('L','Wesley So',0, 0, 3, 6),    -- Trận đấu 6: Cờ thủ 6 thua
    ('H','Anish Giri',0.5, 0.5, 4, 7),-- Trận đấu 7: Cờ thủ 7 hòa
    ('H','Maxime Vachier-Lagrave',0.5, 0.5, 4, 8),-- Trận đấu 8: Cờ thủ 8 hòa
    ('W','Ding Liren',1, 2, 5, 1),    -- Trận đấu 9: Cờ thủ 1 thắng
    ('L','Magnus Carlsen',0, 1, 5, 3),    -- Trận đấu 10: Cờ thủ 3 thua
    ('W','Levon Aronian',1, 1, 6, 2),    -- Trận đấu 11: Cờ thủ 2 thắng
    ('L','Fabiano Caruana',0, 0, 6, 6),    -- Trận đấu 12: Cờ thủ 6 thua
    ('H','Anish Giri',0.5, 0.5, 7, 4),-- Trận đấu 13: Cờ thủ 4 hòa
    ('H','Ian Nepomniachtchi',0.5, 1, 7, 8),  -- Trận đấu 14: Cờ thủ 8 hòa
    ('W','Wesley So',1, 1.5, 8, 7),  -- Trận đấu 15: Cờ thủ 7 thắng
    ('L','Maxime Vachier-Lagrave',0, 1, 8, 5);    -- Trận đấu 16: Cờ thủ 5 thua

INSERT INTO tblMatch (nameMatch, tblRoundid)
SELECT TOP 44 
    'Match ' + CAST((ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1) % 4 + 1 AS VARCHAR) + ' of Round ' + CAST((ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1) / 4 + 1 AS VARCHAR), 
    ((ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1) / 4) % 11 + 1
FROM sys.objects AS o1
CROSS JOIN sys.objects AS o2;
