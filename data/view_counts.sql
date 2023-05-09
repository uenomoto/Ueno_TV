-- 視聴数テーブル
CREATE TABLE IF NOT EXISTS view_counts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    time_slot_episode_id INT NOT NULL,
    views INT NOT NULL,
    FOREIGN KEY (time_slot_episode_id) REFERENCES time_slot_episodes(id)
);

-- データはここから！

INSERT INTO view_counts (time_slot_episode_id, views)
VALUES (60, 1100), (61, 1300), (62, 1600), (63, 1900), (64, 1200),
       (65, 1500), (66, 1700), (67, 1000), (68, 1300), (69, 1600),
       (70, 1800), (71, 1100), (72, 2400), (73, 1600), (74, 2900),
       (75, 2200), (76, 2500), (77, 2800), (78, 1000), (79, 1300),
       (80, 1600), (81, 1900), (82, 1200), (83, 1400), (84, 1700),
       (85, 1200), (86, 1230), (87, 1260), (88, 1200), (89, 1200),
       (90, 1500), (91, 1300), (92, 1400), (93, 1400), (94, 4700),
       (95, 1500), (96, 1300), (97, 1500), (98, 1590);

SELECT id, time_slot_episode_id AS time_ep, views FROM view_counts;

-- time_epさえたどっていけば、タイトルとジャンルや時間帯チャンネル、シーズンがあるかないかがわかる。