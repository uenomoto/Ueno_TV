-- シーズンテーブル
CREATE TABLE IF NOT EXISTS seasons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    program_id INT NOT NULL,
    season_number INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES programs(id),
    UNIQUE (program_id, season_number)
);

-- サンプルデータはここから！

INSERT INTO seasons (program_id, season_number)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(3, 2),
(3, 3),
(5, 1),
(6, 1),
(7, 1),
(9, 1),
(10, 1),
(10, 2);

SELECT * FROM seasons;
