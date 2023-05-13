-- 番組テーブル
CREATE TABLE IF NOT EXISTS programs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    is_series BOOLEAN NOT NULL DEFAULT TRUE
);

-- サンプルデータはここから！

INSERT INTO programs (title, description, is_series) VALUES
    ('One Piece', 'Pirate adventure', 1),
    ('Attack on Titan', 'Battle against Titans', 1),
    ('kimetu', 'onnigari', 1),
    ('Sazae-san', 'mudaninagainanime', 1),
    ('Spirited Away', 'tihiro', 0),
    ('aiueo', 'aiueo', 0),
    ('Music Station', 'Music show', 1),
    ('Dragon Ball Z', 'Gokus adventures', 1),
    ('Neon Genesis Evangelion', 'Mecha battles', 1),
    ('Death Note', 'Supernatural thriller', 1),
    ('Journey to the West', 'Classic adventure', 1),
    ('Midnight Diner', 'Food and stories', 1),
    ('My Neighbor Totoro', 'Heartwarming tale', 0),
    ('Olympic Games', 'Sports event', 0),
    ('Weathering with You', 'Romantic fantasy', 0);


SELECT * FROM programs;

-- is_series１がシリーズありで０が単発