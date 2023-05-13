-- 視聴数テーブル
CREATE TABLE IF NOT EXISTS view_counts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    time_slot_episode_id INT NOT NULL,
    views INT NOT NULL,
    FOREIGN KEY (time_slot_episode_id) REFERENCES time_slot_episodes(id)
);

-- データはここから！

INSERT INTO view_counts (time_slot_episode_id, views)
VALUES (79, 1100), (79, 1300), (80, 1600), (81, 1900), (82, 1200),
       (88, 1500), (83, 1700), (84, 1000), (85, 1300), (90, 1600),
       (101, 1800), (101, 1100), (100, 2400), (99, 1600), (79, 2900),
       (91, 2200), (92, 2500), (93, 2800), (97, 1000), (98, 1300),
       (80, 1600), (81, 1900), (82, 1200), (83, 1400), (84, 1700),
       (85, 1200), (86, 1230), (87, 1260), (88, 1200), (89, 1200),
       (90, 1500), (91, 1300), (92, 1400), (93, 1400), (94, 4700),
       (95, 1500), (96, 1300), (97, 1500), (98, 1590);

SELECT id, time_slot_episode_id AS time_ep, views FROM view_counts;

-- time_epさえたどっていけば、タイトルとジャンルや時間帯チャンネル、シーズンがあるかないかがわかる。