-- ジャンルテーブル
CREATE TABLE IF NOT EXISTS genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- サンプルデータはここから！

INSERT INTO genres (genre_name) VALUES
    ('Anime'),
    ('Drama'),
    ('Variety'),
    ('News'),
    ('Documentary'),
    ('Sports'),
    ('Movie'),
    ('Music'),
    ('Education'),
    ('Cooking');

SELECT * FROM genres;