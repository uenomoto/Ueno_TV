-- エピソードテーブル
CREATE TABLE IF NOT EXISTS episodes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    program_id INT NOT NULL,
    season_id INT,
    episode_number INT,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    duration INT NOT NULL,
    release_date DATE NOT NULL,
    FOREIGN KEY (program_id) REFERENCES programs(id),
    FOREIGN KEY (season_id) REFERENCES seasons(id),
    UNIQUE (program_id, season_id, episode_number)
);

-- サンプルデータはここから！

INSERT INTO episodes (program_id, season_id, episode_number, title, description, duration, release_date)
VALUES
(1, 1, 1, 'ep_1', 'First episode of series 1', 60, '2023-05-01'),
(1, 2, 1, 'ep_1', 'First episode of series 2', 60, '2023-05-02'),
(2, 3, 1, 'ep_1', 'First episode', 90, '2023-05-03'),
(3, 4, 1, 'ep_1', 'First episode of season 1', 60, '2023-05-04'),
(3, 5, 1, 'ep_1', 'First episode of season 2', 60, '2023-05-05'),
(3, 6, 1, 'ep_1', 'First episode of season 3', 60, '2023-05-06'),
(4, NULL, NULL, 'tanpatu', 'tanpatu program', 120, '2023-05-07'),
(5, 7, 1, 'ep_1', 'First episode of series', 60, '2023-05-08'),
(6, 8, 1, 'ep_1', 'First episode of series', 60, '2023-05-09'),
(7, 9, 1, 'ep_1', 'First episode of series', 60, '2023-05-10'),
(8, NULL, NULL, 'tanpatu', 'tanpatu program', 90, '2023-05-11'),
(9, 10, 1, 'ep_1', 'First episode of series', 60, '2023-05-12'),
(10, 11, 1, 'ep_1', 'First episode of season 1', 60, '2023-05-13'),
(10, 12, 1, 'ep_1', 'First episode of season 2', 60, '2023-05-14'),
(11, NULL, NULL, 'tanpatu', 'tanpatu program', 100, '2023-05-15'),
(12, NULL, NULL, 'tanpatu', 'tanpatu program', 110, '2023-05-16'),
(13, NULL, NULL, 'tanpatu', 'tanpatu program', 120, '2023-05-17'),
(14, NULL, NULL, 'tanpatu', 'tanpatu program', 130, '2023-05-18'),
(15, NULL, NULL, 'tanpatu', 'tanpatu program', 140, '2023-05-19');

SELECT * FROM episodes;
