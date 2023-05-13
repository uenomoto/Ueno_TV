# インターネット TV

## データベース設計とクエリ文が描けるかどうかの課題

## ステップ１

<details><summary>テーブル設計書</summary>

## チャンネルテーブル(channels)

| カラム名           | データ型     | NULL | キー    | 初期値 | AUTO INCREMENT |
| ------------------ | ------------ | ---- | ------- | ------ | -------------- |
| チャンネル ID      | int(11)      | NO   | PRIMARY |        | YES            |
| チャンネル名(name) | varchar(100) | NO   |         |        |                |

## 時間帯テーブル(time_slots)

| カラム名                  | データ型 | NULL | キー    | 初期値 | AUTO INCREMENT |
| ------------------------- | -------- | ---- | ------- | ------ | -------------- |
| 時間帯 ID                 | int(11)  | NO   | PRIMARY |        | YES            |
| チャンネル ID(channel_id) | int(11)  | NO   | FOREIGN |        |                |
| 開始時刻(start_time)      | time     | NO   |         |        |                |
| 終了時刻 (end_time)       | time     | NO   |         |        |                |

ユニークキー (チャンネル ID, 開始時刻, 終了時刻)

## ジャンルテーブル(genres)

| カラム名                | データ型     | NULL | キー    | 初期値 | AUTO INCREMENT |
| ----------------------- | ------------ | ---- | ------- | ------ | -------------- |
| ジャンル ID             | int(11)      | NO   | PRIMARY |        | YES            |
| ジャンル名 (genre_name) | varchar(100) | NO   |         |        |                |

## 番組テーブル(programs)

| カラム名                 | データ型     | NULL | キー    | 初期値 | AUTO INCREMENT |
| ------------------------ | ------------ | ---- | ------- | ------ | -------------- |
| 番組 ID                  | int(11)      | NO   | PRIMARY |        | YES            |
| タイトル (title)         | varchar(100) | NO   |         |        |                |
| 番組詳細 (description)   | text         | NO   |         |        |                |
| シリーズ判定 (is_series) | boolean      | NO   |         | true   |                |

## 番組ジャンルテーブル(program_genres)

| カラム名               | データ型 | NULL | キー    | 初期値 | AUTO INCREMENT |
| ---------------------- | -------- | ---- | ------- | ------ | -------------- |
| 番組ジャンル ID        | int(11)  | NO   | PRIMARY |        | YES            |
| 番組 ID (program_id)   | int(11)  | NO   | FOREIGN |        |                |
| ジャンル ID (genre_id) | int(11)  | NO   | FOREIGN |        |                |

ユニークキー (番組 ID, ジャンル ID)

## シーズンテーブル(seasons)

| カラム名                   | データ型 | NULL | キー    | 初期値 | AUTO INCREMENT |
| -------------------------- | -------- | ---- | ------- | ------ | -------------- |
| シーズン ID                | int(11)  | NO   | PRIMARY |        | YES            |
| 番組 ID (program_id)       | int(11)  | NO   | FOREIGN |        |                |
| シーズン数 (season_number) | int(11)  | NO   |         |        |                |

ユニークキー (番組 ID, シーズン数)

## エピソードテーブル(episodes)

| カラム名                      | データ型     | NULL | キー    | 初期値 | AUTO INCREMENT |
| ----------------------------- | ------------ | ---- | ------- | ------ | -------------- |
| エピソード ID                 | int(11)      | NO   | PRIMARY |        | YES            |
| 番組 ID (program_id)          | int(11)      | NO   | FOREIGN |        |                |
| シーズン ID (season_id)       | int(11)      | YES  | FOREIGN |        |                |
| エピソード数 (episode_number) | int(11)      | YES  |         |        |                |
| タイトル (title)              | varchar(100) | NO   |         |        |                |
| エピソード詳細 (description)  | text         | NO   |         |        |                |
| 動画時間 (duration)           | int(11)      | NO   |         |        |                |
| 公開日 (release_date)         | date         | NO   |         |        |                |

ユニークキー (番組 ID シーズン ID, エピソード数)

## 時間帯エピソードテーブル(time_slot_episodes)

| カラム名                   | データ型 | NULL | キー    | 初期値 | AUTO INCREMENT |
| -------------------------- | -------- | ---- | ------- | ------ | -------------- |
| 時間帯エピソード ID        | int(11)  | NO   | PRIMARY |        | YES            |
| 時間帯 ID (time_slot_id)   | int(11)  | NO   | FOREIGN |        |                |
| エピソード ID (episode_id) | int(11)  | NO   | FOREIGN |        |                |

ユニークキー (時間帯 ID, エピソード ID)

## 視聴数テーブル(view_counts)

| カラム名                                   | データ型 | NULL | キー    | 初期値 | AUTO INCREMENT |
| ------------------------------------------ | -------- | ---- | ------- | ------ | -------------- |
| 視聴数 ID                                  | int(11)  | NO   | PRIMARY |        | YES            |
| 時間帯エピソード ID (time_slot_episode_id) | int(11)  | NO   | FOREIGN |        |                |
| 視聴数 (views)                             | int(11)  | NO   |         |        |                |

**日本語のみは主キーとしています**

</details>

<details><summary>データ型早見表！</summary>
int: 整数型です。通常、符号付き整数を表現するために使用されます。例えば、年齢、数量、順位などの整数値を格納する際に使用します。

---

bigint: int よりも大きな範囲の整数値を格納できる整数型です。例えば、非常に大きな数値が必要な場合や、**一意の ID を生成する場合に使用されます。**

---

varchar: 可変長の文字列型です。例えば、名前、メールアドレス、タイトルなどのテキストデータを格納する際に使用します。

**文字列の長さが可変であるため、string よりメモリの効率が良くなる！**

---

text: 大容量の文字列データを格納するための型です。例えば、記事の本文、コメント、説明文などの**長いテキストデータ**を格納する際に使用します。

---

date: 日付型です。**年、月、日の情報を格納できます**。例えば、誕生日、公開日、イベント開催日などの日付データを格納する際に使用します。

---

datetime: 日付と時刻型です。**年、月、日、時、分、秒の情報を格納できます。**

例えば、作成日時、更新日時、イベント開始日時などの日付と時刻データを格納する際に使用します。

date との違いは時間、分、秒があるかないかだけ。

---

float / double: 小数点を含む実数型です。float は単精度、double は倍精度の浮動小数点数を表現できます。

例えば、金額、割合、緯度経度などの実数データを格納する際に使用します。

---

boolean: 真偽値型です。true または false の値を格納できます。

例えば、フラグ、スイッチ、選択肢などの真偽値データを格納する際に使用します。

**今回でいえば、シリーズがあるか単発かで真偽値を使っています。**

</details>

---

## ステップ２

実際にテーブルを構築し、データを入れます！
その手順をドキュメントとしてまとめてください。

<details><summary>1. データベースを構築します</summary>
私の場合、Docker で MySQL 構築します

Docker デスクトップを起動してください。

docker-compose.yml ファイルがあるか確認してから

ターミナルに`docker compose up -d`と打ってください。

次に、コンテナが起動しているか確認してから MySQL コンテナのシェルにアクセスします！

`docker compose exec db bash`

これでアクセスできます。

次に、MySQL にログインします！

`mysql -u root -p`と記述し、ログインできたら環境構築成功です。

ホストに`MYSQL_DATABASE=ueno_tv`と記述したので DB はあるはずです！

99％あると思いますが、なかったら`create database`

確認は`SHOW DATABASES;`でしっかり ueno_tv がありました！

</details>

<details><summary>2. ステップ1で設計したテーブルを構築します</summary>
data ディレクトリに入っている sql ファイルを MySQL に CREATE TABLE します！

まずコンテナに入っていただき、`cd /docker-entrypoint-initdb.d`に移動してください

コンテナ側の docker-entrypoint-initdb.d フォルダとホストの init フォルダがマウントしてあるので

コンテナの中に.sql ファイルがあります！！

`mysql -u root -p ueno_tv < channels.sql`とこのように一つ一つのテーブルを DB にはめ込みます。

~~まとめて書いたほうがよかったかもしれません。~~

コンテナが消えても sql のデータはホストにあるかぎり消えません！

### 入れたテーブルとカラムも一緒に確認する。

まずはテーブルのみ`SHOW TABLES;`

```sql
+--------------------+
| Tables_in_net_tv   |
+--------------------+
| channels           |
| episodes           |
| genres             |
| program_genres     |
| programs           |
| seasons            |
| time_slot_episodes |
| time_slots         |
| view_counts        |
+--------------------+
9 rows in set (0.01 sec)
```

### 次に各テーブルのカラムを確認。

ざっくり今ある知識でヘッダーテーブル部分を説明します！

Field がカラム名、Type がデータ型、Null は空欄はいいかダメかの制約(今回は空欄だめ！)、key は主キーか外部キーかの判別その他が空欄

Default は、何も入力されなかったらそれが勝手に入る(今回はなし)真偽値とかでよく使うイメージ、

Extra は自動で id が増えていく。↓

チャンネルを登録するフォームを想像してみてください、入力するとき id なんて入れないですよね？

チャンネル名を入れるだけで自動で一意な ID が生成され PC 上で判別できるようになります。

### チャンネルテーブル

```sql
mysql> SHOW COLUMNS FROM channels;
+-------+--------------+------+-----+---------+----------------+
| Field | Type         | Null | Key | Default | Extra          |
+-------+--------------+------+-----+---------+----------------+
| id    | int          | NO   | PRI | NULL    | auto_increment |
| name  | varchar(100) | NO   |     | NULL    |                |
+-------+--------------+------+-----+---------+----------------+
```

---

season_id と episode_number がなぜ Null が YES すなわち空欄 OK なのかは

単発のものもあるからです！

### エピソードテーブル

```sql
mysql> SHOW COLUMNS FROM episodes;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| id             | int          | NO   | PRI | NULL    | auto_increment |
| program_id     | int          | NO   | MUL | NULL    |                |
| season_id      | int          | YES  | MUL | NULL    |                |
| episode_number | int          | YES  |     | NULL    |                |
| title          | varchar(100) | NO   |     | NULL    |                |
| description    | text         | NO   |     | NULL    |                |
| duration       | int          | NO   |     | NULL    |                |
| release_date   | date         | NO   |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)
```

---

### ジャンルテーブル

```sql
mysql> SHOW COLUMNS FROM genres;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int          | NO   | PRI | NULL    | auto_increment |
| genre_name | varchar(100) | NO   |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)
```

---

この外部キーのみにあたるテーブルを中間テーブルと言います。

N 対 N を回避するために必要です。

基本的にはカーディナリティーは、1 対 N が好ましい！

### 番組ジャンルテーブル

```sql
mysql> SHOW COLUMNS FROM program_genres;
+------------+------+------+-----+---------+----------------+
| Field      | Type | Null | Key | Default | Extra          |
+------------+------+------+-----+---------+----------------+
| id         | int  | NO   | PRI | NULL    | auto_increment |
| program_id | int  | NO   | MUL | NULL    |                |
| genre_id   | int  | NO   | MUL | NULL    |                |
+------------+------+------+-----+---------+----------------+
3 rows in set (0.01 sec)
```

---

### 番組テーブル

```sql
mysql> SHOW COLUMNS FROM programs;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| title       | varchar(100) | NO   |     | NULL    |                |
| description | text         | NO   |     | NULL    |                |
| is_series   | tinyint(1)   | NO   |     | 1       |                |
+-------------+--------------+------+-----+---------+----------------+
```

---

### シーズンテーブル

```sql
mysql> SHOW COLUMNS FROM seasons;
+---------------+------+------+-----+---------+----------------+
| Field         | Type | Null | Key | Default | Extra          |
+---------------+------+------+-----+---------+----------------+
| id            | int  | NO   | PRI | NULL    | auto_increment |
| program_id    | int  | NO   | MUL | NULL    |                |
| season_number | int  | NO   |     | NULL    |                |
+---------------+------+------+-----+---------+----------------+
```

---

今回の中枢に当たるテーブル

### 時間帯エピソードテーブル

```sql
mysql> SHOW COLUMNS FROM time_slot_episodes;
+--------------+------+------+-----+---------+----------------+
| Field        | Type | Null | Key | Default | Extra          |
+--------------+------+------+-----+---------+----------------+
| id           | int  | NO   | PRI | NULL    | auto_increment |
| time_slot_id | int  | NO   | MUL | NULL    |                |
| episode_id   | int  | NO   | MUL | NULL    |                |
+--------------+------+------+-----+---------+----------------+
3 rows in set (0.01 sec)
```

---

### 時間帯テーブル

```sql
mysql> SHOW COLUMNS FROM time_slots;
+------------+------+------+-----+---------+----------------+
| Field      | Type | Null | Key | Default | Extra          |
+------------+------+------+-----+---------+----------------+
| id         | int  | NO   | PRI | NULL    | auto_increment |
| channel_id | int  | NO   | MUL | NULL    |                |
| start_time | time | NO   |     | NULL    |                |
| end_time   | time | NO   |     | NULL    |                |
+------------+------+------+-----+---------+----------------+
4 rows in set (0.00 sec)
```

---

### 視聴数テーブル

```sql
mysql> SHOW COLUMNS FROM view_counts;
+----------------------+------+------+-----+---------+----------------+
| Field                | Type | Null | Key | Default | Extra          |
+----------------------+------+------+-----+---------+----------------+
| id                   | int  | NO   | PRI | NULL    | auto_increment |
| time_slot_episode_id | int  | NO   | MUL | NULL    |                |
| views                | int  | NO   |     | NULL    |                |
+----------------------+------+------+-----+---------+----------------+
3 rows in set (0.01 sec)
```

---

</details>

<details><summary>3. サンプルデータを入れます。</summary>
data ディレクトリに入っている sql ファイルを MySQL に INSERT INTO します！

テーブル DB にはめ込みが完了している時点でサンプルデータは入っています。

</details>

---

## ステップ３

データを抽出するクエリを書きます！

<details><summary>root ユーザーで操作するのではなく新しく作ったユーザーで検索できるようする</summary>

**データ作成は root ユーザのみ。**

MYSQL_USER にて作りました

名前: readonly

パスワード: read_pass

`mysql -u readonly -p`でパスは read_pass

読み取り専用ユーザーです。

`select user();`で確認できます。

</details>

---

<details><summary>1.よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください</summary>

```sql
SELECT e.title AS episode_title, vc.views AS view_count
FROM episodes e
JOIN time_slot_episodes tse ON e.id = tse.episode_id
JOIN view_counts vc ON tse.id = vc.time_slot_episode_id
ORDER BY vc.views DESC
LIMIT 3;
```

エイリアスをつけております。e がエピソードテーブル、tse が時間帯エピソードテーブル、vc が視聴数テーブル

SELECT に時間帯エピソードテーブルがないですが中間テーブルの為 JOIN に入れております。

テーブル単体ですとわかっていたものが、結合することによりカラム名が title だけだと、なんの？ってなりかねないので

わかりやすくあだ名もつけてます、`titleをepisode_title`にして、views を`view_count`にしています。

それぞれを結合し、視聴数で降順にしてトップ 3 のエピソードタイトルとその視聴数を取得しています。

```sql
+---------------+------------+
| episode_title | view_count |
+---------------+------------+
| tanpatu       |       4700 |
| ep_1          |       2900 |
| ep_1          |       2800 |
+---------------+------------+
3 rows in set (0.00 sec)
```

---

余談ですが

今回でいいますと、時間帯エピソードテーブル**全ての情報**を持っている中枢です。ですが id(bigint すなわち桁の多い数字) なので人間にはわかりにくいです

そしてこの問題は、エピソードタイトルと視聴数のトップ３の情報が欲しいので、人間にわかりやすくするため他二つのテーブルが結合して一つの表にしています。

</details>

---

<details>
  <summary>
    2.よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。 
    エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
  </summary>

```sql
SELECT p.title AS program_title, s.season_number, e.episode_number, e.title AS episode_title, vc.views AS view_count
FROM episodes e
JOIN programs p ON e.program_id = p.id
LEFT JOIN seasons s ON e.season_id = s.id
JOIN time_slot_episodes tse ON e.id = tse.episode_id
JOIN view_counts vc ON tse.id = vc.time_slot_episode_id
ORDER BY vc.views DESC
LIMIT 3;
```

エイリアス：e はエピソ、p は番組、s はシーズン、vc は視聴数

seasons テーブルを episodes テーブルに結合して、シーズン数を取得します (LEFT JOIN seasons s ON e.season_id = s.id)。

**シーズン情報が存在しない場合もある**ため、NULL も結果に出すため、LEFT JOIN を使用しています。

左外部結合ですね！

```sql
+---------------+---------------+----------------+---------------+------------+
| program_title | season_number | episode_number | episode_title | view_count |
+---------------+---------------+----------------+---------------+------------+
| Olympic Games |          NULL |           NULL | tanpatu       |       4700 |
| One Piece     |             1 |              1 | ep_1          |       2900 |
| Death Note    |             1 |              1 | ep_1          |       2800 |
+---------------+---------------+----------------+---------------+------------+
3 rows in set (0.00 sec)
```

</details>

---

<details><summary>3.本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします</summary>

```sql
SELECT
  c.name AS channel_name,
  CONCAT(CURDATE(), ' : ', ts.start_time) AS start_time,
  CONCAT(CURDATE(), ' : ', ts.end_time) AS end_time,
  s.season_number,
  e.episode_number,
  e.title AS episode_title,
  e.description AS episode_description
FROM
  channels c
JOIN
  time_slots ts
  ON c.id = ts.channel_id
JOIN
  time_slot_episodes tse
  ON ts.id = tse.time_slot_id
JOIN
  episodes e
  ON tse.episode_id = e.id
LEFT JOIN
  seasons s
  ON e.season_id = s.id
WHERE
  DATE(e.release_date) = CURDATE()
ORDER BY
  channel_name,
  start_time;
```

```sql
+--------------+-----------------------+-----------------------+---------------+----------------+---------------+---------------------------+
| channel_name | start_time            | end_time              | season_number | episode_number | episode_title | episode_description       |
+--------------+-----------------------+-----------------------+---------------+----------------+---------------+---------------------------+
| Nippon TV    | 2023-05-13 : 13:00:00 | 2023-05-13 : 14:00:00 |             1 |              1 | ep_1          | First episode of season 1 |
| TOKYO MX     | 2023-05-13 : 03:00:00 | 2023-05-13 : 04:00:00 |             1 |              1 | ep_1          | First episode of season 1 |
+--------------+-----------------------+-----------------------+---------------+----------------+---------------+---------------------------+
2 rows in set (0.00 sec)
```

</details>

---

<details><summary>4.ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください</summary>

```sql
SELECT
  c.name AS channel_name,
  CONCAT(ts.start_time, ' - ', ts.end_time) AS time,
  s.season_number,
  e.episode_number,
  e.title AS episode_title,
  e.description AS episode_description
FROM
  channels c
JOIN
  time_slots ts
  ON c.id = ts.channel_id
JOIN
  time_slot_episodes tse
  ON ts.id = tse.time_slot_id
JOIN
  episodes e
  ON tse.episode_id = e.id
JOIN
  program_genres pg
  ON e.program_id = pg.program_id
JOIN
  genres g
  ON pg.genre_id = g.id
LEFT JOIN
  seasons s
  ON e.season_id = s.id
WHERE
  g.genre_name = 'Drama'
  AND DATE(e.release_date) BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 WEEK)
ORDER BY
  e.release_date,
  ts.start_time;
```

```sql
+--------------+---------------------+---------------+----------------+---------------+---------------------+
| channel_name | time                | season_number | episode_number | episode_title | episode_description |
+--------------+---------------------+---------------+----------------+---------------+---------------------+
| TOKYO MX     | 05:00:00 - 06:00:00 |          NULL |           NULL | tanpatu       | tanpatu program     |
| TBS TV       | 21:00:00 - 22:00:00 |          NULL |           NULL | tanpatu       | tanpatu program     |
+--------------+---------------------+---------------+----------------+---------------+---------------------+
2 rows in set (0.01 sec)
```

ueno_tv はドラマ一週間に 2 日しかやらないらしい

単発ドラマ！！

</details>
