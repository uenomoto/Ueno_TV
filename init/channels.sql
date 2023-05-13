-- チャンネルテーブル作成
CREATE TABLE IF NOT EXISTS channels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- サンプルデータはここから！(10件削除したので11_idからになってる)

INSERT INTO channels (name) VALUES
    ('TV sizuoka'),
    ('NHK Kyoiku'),
    ('Nippon TV'),
    ('TBS TV'),
    ('Fuji TV'),
    ('TV Asahi'),
    ('TV Tokyo'),
    ('TOKYO MX'),
    ('BS Nippon TV'),
    ('WOWOW Prime');

SELECT * FROM channels;

