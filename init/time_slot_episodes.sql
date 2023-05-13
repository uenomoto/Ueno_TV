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
VALUES (61, 1), (61, 6), (62, 2), (62, 7), (63, 3), (63, 8),
       (64, 4), (64, 9), (65, 5), (65, 10), (66, 11), (66, 16),
       (67, 12), (67, 17), (68, 13), (68, 18), (69, 14), (69, 19),
       (70, 15), (70, 1), (71, 2), (72, 3), (73, 4),
       (74, 5), (75, 6), (76, 7), (77, 8), (78, 9),
       (79, 10), (80, 11), (81, 12), (82, 13), (83, 14),
       (84, 15), (85, 16), (86, 17), (87, 18), (88, 19),
       (89, 7);

SELECT * FROM time_slot_episodes;
