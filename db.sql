mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| college            |
| course             |
| information_schema |
| internship         |
| internship_db      |
| mysql              |
| performance_schema |
| student            |
| studentdetail      |
| studentinfo        |
| sunbeam            |
| sys                |
| xyz_company        |
+--------------------+
13 rows in set (0.02 sec)

mysql> use internship_db;
Database changed
mysql> show tables;
+-------------------------+
| Tables_in_internship_db |
+-------------------------+
| courses                 |
| students                |
| users                   |
| videos                  |
+-------------------------+
4 rows in set (0.02 sec)

mysql> select*from courses;
+-----------+-----------------+------------------------+------+------------+------------+-------------------+
| course_id | course_name     | description            | fees | start_date | end_date   | video_expire_days |
+-----------+-----------------+------------------------+------+------------+------------+-------------------+
|         1 | MERN Stack      | Full Stack Development | 5000 | 2025-01-01 | 2025-03-01 |                60 |
|         2 | Java Full Stack | Java + Spring Boot     | 4500 | 2025-02-01 | 2025-04-01 |                45 |
|         3 | Python Basics   | Beginner Python Course | 3000 | 2025-01-15 | 2025-02-28 |                30 |
|         4 | Web Development | HTML CSS JS            | 2500 | 2025-03-01 | 2025-04-15 |                40 |
+-----------+-----------------+------------------------+------+------------+------------+-------------------+
4 rows in set (0.00 sec)

mysql> select*from students;
+--------+--------------+------------------+-----------+-----------+------------------+--------------------------+
| reg_no | name         | email            | course_id | mobile_no | profile          | profile_pic              |
+--------+--------------+------------------+-----------+-----------+------------------+--------------------------+
|      1 | Aarav Sharma | aarav@gmail.com  |         1 | 987654321 | NULL             | NULL                     |
|      2 | Ananya Verma | ananya@gmail.com |         2 | 987654322 | NULL             | NULL                     |
|      3 | Rohan Patel  | rohan@gmail.com  |         1 | 987654323 | NULL             | NULL                     |
|      4 | Sneha Iyer   | sneha@gmail.com  |         3 | 987654324 | NULL             | NULL                     |
+--------+--------------+------------------+-----------+-----------+------------------+--------------------------+
4 rows in set (0.00 sec)

mysql> select*from users;
+--------------------------+------------------------------------------------------------------+---------+
| email                    | password                                                         | role    |
+--------------------------+------------------------------------------------------------------+---------+
| admin@gmail.com          | admin123                                                         | admin   |
| admin2@gmail.com         | admin456                                                         | admin   |
| arjun@gmail.com          | stud111                                                          | student |
| meena@gmail.com          | stud222                                                          | student |
| omkarphalle@gmail.com    | 37028839aea3b5b27f75fafdcfda3915998d6535f598a16478b57f43f01d5c16 | student |
| rohit@gmail.com          | stud333                                                          | student |
| shrutipatil333@gmail.com | 5a8c894cc2674a87b9b3ffeb3c14ecb59e8d1742d7401b5bbe66102712a0f429 | student |
| student1@gmail.com       | stud123                                                          | student |
| student2@gmail.com       | stud123                                                          | student |
| student3@gmail.com       | stud123                                                          | student |
+--------------------------+------------------------------------------------------------------+---------+
10 rows in set (0.01 sec)

mysql> select*from videos;
+----------+-----------+-------------------+------------------------+---------------------------------------------+------------+
| video_id | course_id | title             | description            | youtube_url                                 | added_at   |
+----------+-----------+-------------------+------------------------+---------------------------------------------+------------+
|        1 |         1 | MERN Introduction | Overview of MERN Stack | https://youtube.com/mern1                   | 2025-01-02 |
|        2 |         5 | html css          | build project          | https://www.youtube.com/watch?v=Eb3lOiukwAQ | 2025-02-03 |
+----------+-----------+-------------------+------------------------+---------------------------------------------+------------+
2 rows in set (0.00 sec)

mysql> ^C
mysql> ^C
mysql> SELECT
    ->     s.reg_no,
    ->     s.name,
    ->     s.email,
    ->     s.mobile_no,
    ->     c.course_id,
    ->     c.course_name,
    ->     c.description,
    ->     c.fees,
    ->     c.start_date,
    ->     c.end_date,
    ->     c.video_expire_days
    -> FROM students s
    -> JOIN courses c
    ->     ON s.course_id = c.course_id
    -> WHERE s.email = 'aarav@gmail.com';
+--------+--------------+-----------------+-----------+-----------+-------------+------------------------+------+------------+------------+-------------------+
| reg_no | name         | email           | mobile_no | course_id | course_name | description            | fees | start_date | end_date   | video_expire_days |
+--------+--------------+-----------------+-----------+-----------+-------------+------------------------+------+------------+------------+-------------------+
|      1 | Aarav Sharma | aarav@gmail.com | 987654321 |         1 | MERN Stack  | Full Stack Development | 5000 | 2025-01-01 | 2025-03-01 |                60 |
+--------+--------------+-----------------+-----------+-----------+-------------+------------------------+------+------------+------------+-------------------+
1 row in set (0.00 sec)

mysql> SELECT
    ->     c.course_id,
    ->     c.course_name,
    ->     c.start_date,
    ->     c.end_date,
    ->     c.video_expire_days,
    ->     v.video_id,
    ->     v.title,
    ->     v.added_at
    -> FROM students s
    -> JOIN courses c
    ->     ON s.course_id = c.course_id
    -> JOIN videos v
    ->     ON c.course_id = v.course_id
    -> WHERE s.email = 'aarav@gmail.com'
    ->   AND DATE_ADD(v.added_at, INTERVAL c.video_expire_days DAY) >= CURDATE();
Empty set (0.01 sec)

mysql> SELECT * FROM students WHERE email = 'aarav@gmail.com';
+--------+--------------+-----------------+-----------+-----------+------------------+--------------------------+
| reg_no | name         | email           | course_id | mobile_no | profile          | profile_pic              |
+--------+--------------+-----------------+-----------+-----------+------------------+--------------------------+
|      1 | Aarav Sharma | aarav@gmail.com |         1 | 987654321 | NULL             | NULL                     |
+--------+--------------+-----------------+-----------+-----------+------------------+--------------------------+
1 row in set (0.01 sec)

mysql> SELECT * FROM courses WHERE course_id = 1;
+-----------+-------------+------------------------+------+------------+------------+-------------------+
| course_id | course_name | description            | fees | start_date | end_date   | video_expire_days |
+-----------+-------------+------------------------+------+------------+------------+-------------------+
|         1 | MERN Stack  | Full Stack Development | 5000 | 2025-01-01 | 2025-03-01 |                60 |
+-----------+-------------+------------------------+------+------------+------------+-------------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM videos WHERE course_id = 1;
+----------+-----------+-------------------+------------------------+---------------------------+------------+
| video_id | course_id | title             | description            | youtube_url               | added_at   |
+----------+-----------+-------------------+------------------------+---------------------------+------------+
|        1 |         1 | MERN Introduction | Overview of MERN Stack | https://youtube.com/mern1 | 2025-01-02 |
+----------+-----------+-------------------+------------------------+---------------------------+------------+
1 row in set (0.00 sec)

mysql> ^C
mysql> SELECT s.name, c.course_name
    -> FROM students s
    -> JOIN courses c ON s.course_id = c.course_id;
+--------------+-----------------+
| name         | course_name     |
+--------------+-----------------+
| Aarav Sharma | MERN Stack      |
| Ananya Verma | Java Full Stack |
| Rohan Patel  | MERN Stack      |
| Sneha Iyer   | Python Basics   |
+--------------+-----------------+
4 rows in set (0.00 sec)

mysql> SELECT s.name, c.course_name
    -> FROM students s
    -> JOIN courses c ON s.course_id = c.course_id
    -> WHERE s.email = 'aarav@gmail.com';
+--------------+-------------+
| name         | course_name |
+--------------+-------------+
| Aarav Sharma | MERN Stack  |
+--------------+-------------+
1 row in set (0.00 sec)

mysql> SELECT
    ->     video_id,
    ->     added_at,
    ->     DATE_ADD(added_at, INTERVAL 60 DAY) AS expiry_date
    -> FROM videos
    -> WHERE course_id = 1;
+----------+------------+-------------+
| video_id | added_at   | expiry_date |
+----------+------------+-------------+
|        1 | 2025-01-02 | 2025-03-03  |
+----------+------------+-------------+
1 row in set (0.00 sec)

mysql> SELECT
    ->     c.course_name,
    ->     v.title,
    ->     v.added_at
    -> FROM students s
    -> JOIN courses c ON s.course_id = c.course_id
    -> JOIN videos v ON c.course_id = v.course_id
    -> WHERE s.email = 'aarav@gmail.com'
    ->   AND DATE_ADD(v.added_at, INTERVAL c.video_expire_days DAY) >= CURDATE();
Empty set (0.02 sec)
