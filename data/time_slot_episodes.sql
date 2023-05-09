-- 時間帯エピソードテーブル
CREATE TABLE IF NOT EXISTS time_slot_episodes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    time_slot_id INT NOT NULL,
    episode_id INT NOT NULL,
    FOREIGN KEY (time_slot_id) REFERENCES time_slots(id),
    FOREIGN KEY (episode_id) REFERENCES episodes(id),
    UNIQUE (time_slot_id, episode_id)
);

-- サンプルデータはここから

INSERT INTO time_slot_episodes (time_slot_id, episode_id)
VALUES (91, 1), (91, 6), (92, 2), (92, 7), (93, 3), (93, 8),
       (94, 4), (94, 9), (95, 5), (95, 10), (96, 11), (96, 16),
       (97, 12), (97, 17), (98, 13), (98, 18), (99, 14), (99, 19),
       (100, 15), (100, 1), (101, 2), (102, 3), (103, 4),
       (104, 5), (105, 6), (106, 7), (107, 8), (108, 9),
       (109, 10), (110, 11), (111, 12), (112, 13), (113, 14),
       (114, 15), (115, 16), (116, 17), (117, 18), (118, 19),
       (119, 7);

SELECT * FROM time_slot_episodes;
