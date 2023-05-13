-- 番組ジャンルテーブル
CREATE TABLE IF NOT EXISTS program_genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    program_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES programs(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    UNIQUE (program_id, genre_id)
);

-- サンプルデータはここから！

INSERT INTO program_genres (program_id, genre_id) VALUES
    (1, 1), -- One Piece: Anime
    (2, 1), -- Attack on Titan: Anime
    (3, 3), -- Terrace House: Variety
    (4, 1), -- Sazae-san: Anime
    (5, 7), -- Spirited Away: Movie
    (6, 7), -- Your Name: Movie
    (7, 8), -- Music Station: Music
    (8, 1), -- Dragon Ball Z: Anime
    (9, 1), -- Neon Genesis Evangelion: Anime
    (10, 1), -- Death Note: Anime
    (11, 2), -- Journey to the West: Drama
    (12, 4), -- Midnight Diner: Food
    (13, 7), -- My Neighbor Totoro: Movie
    (14, 5), -- Olympic Games: Sports
    (15, 7); -- Weathering with You: Movie


SELECT p.title, p.description, p.is_series, g.genre_name
FROM programs p
JOIN program_genres pg ON p.id = pg.program_id
JOIN genres g ON pg.genre_id = g.id;

-- このクエリは番組タイトルと説明、シリーズがあるかないかとジャンルの名前が確認できるクエリです。
-- program_genresは、programsテーブルにジャンル名を紐づけるための中間テーブルです。
