CREATE DATABASE IF NOT EXISTS `food_app`;

USE `food_app`;

CREATE TABLE IF NOT EXISTS `user` (
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
	`full_name` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL UNIQUE, 
	`password` VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `restaurant` (
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
	`res_name` VARCHAR(255) NOT NULL,
	`image` VARCHAR(500),
	`desc` VARCHAR(1000)
);

CREATE TABLE IF NOT EXISTS `food_type`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
	`type_name` VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `food` (
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
	`food_name` VARCHAR(255) NOT NULL, 
	`image` VARCHAR(500),
	`price` DOUBLE NOT NULL DEFAULT 0,
	`desc` VARCHAR(1000),
	`type_id` INT NOT NULL,
	
	FOREIGN KEY (`type_id`) REFERENCES `food_type`(`id`)
);

CREATE TABLE IF NOT EXISTS `sub_food`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
	`sub_name` VARCHAR(255) NOT NULL, 
	`sub_price` DOUBLE NOT NULL DEFAULT 0, 
	`food_id` INT NOT NULL, 
	
	FOREIGN KEY (`food_id`) REFERENCES `food`(`id`)
);

CREATE TABLE IF NOT EXISTS `order`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
	`user_id` INT NOT NULL,
	`food_id` INT NOT NULL,
	`amount` INT NOT NULL DEFAULT 1,
	`code` VARCHAR(255) NOT NULL, 
	`arr_sub_id` VARCHAR(255),
	
	FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
	FOREIGN KEY(`food_id`) REFERENCES `food`(`id`)
);

CREATE TABLE IF NOT EXISTS `like_res`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
	`user_id` INT NOT NULL, 
	`res_id` INT NOT NULL, 
	`date_like` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
	FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
	FOREIGN KEY(`res_id`) REFERENCES `restaurant`(`id`)
);

CREATE TABLE  IF NOT EXISTS `rate_res` (
    `id` INT AUTO_INCREMENT PRIMARY KEY, 
    `user_id` INT NOT NULL, 
    `res_id` INT NOT NULL, 
    `amount` INT NOT NULL, 
    `date_rate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`res_id`) REFERENCES `restaurant`(`id`)
);

-- Thêm dữ liệu mô phỏng
USE `food_app`;

INSERT INTO `user` (
    `full_name`,
    `email`,
    `password`
)
VALUES
    ('Nguyen Van An', 'an@gmail.com', '123456'),
    ('Tran Thi Binh', 'binh@gmail.com', '123456'),
    ('Le Van Cuong', 'cuong@gmail.com', '123456'),
    ('Pham Thi Dung', 'dung@gmail.com', '123456'),
    ('Hoang Van Em', 'em@gmail.com', '123456'),
    ('Vo Thi Giang', 'giang@gmail.com', '123456'),
    ('Dang Van Hung', 'hung@gmail.com', '123456'),
    ('Bui Thi Lan', 'lan@gmail.com', '123456'),
    ('Do Van Minh', 'minh@gmail.com', '123456'),
    ('Ngo Thi Ngoc', 'ngoc@gmail.com', '123456');


INSERT INTO `restaurant` (
    `res_name`,
    `image`,
    `desc`
)
VALUES
    (
        'Nha hang Hoa Sen',
        'hoa-sen.jpg',
        'Nha hang mon Viet'
    ),
    (
        'Pizza House',
        'pizza-house.jpg',
        'Nha hang pizza va mon Au'
    ),
    (
        'Sushi Tokyo',
        'sushi-tokyo.jpg',
        'Nha hang mon Nhat'
    ),
    (
        'Korean BBQ',
        'korean-bbq.jpg',
        'Nha hang nuong Han Quoc'
    ),
    (
        'Pho Sai Gon',
        'pho-sai-gon.jpg',
        'Quan pho truyen thong'
    );


INSERT INTO `food_type` (
    `type_name`
)
VALUES
    ('Mon Viet'),
    ('Mon Au'),
    ('Mon Nhat'),
    ('Mon Han'),
    ('Do uong');


INSERT INTO `food` (
    `food_name`,
    `image`,
    `price`,
    `desc`,
    `type_id`
)
VALUES
    (
        'Com tam suon',
        'com-tam-suon.jpg',
        55000,
        'Com tam suon nuong',
        1
    ),
    (
        'Pho bo',
        'pho-bo.jpg',
        60000,
        'Pho bo tai chin',
        1
    ),
    (
        'Pizza hai san',
        'pizza-hai-san.jpg',
        150000,
        'Pizza hai san phomai',
        2
    ),
    (
        'Spaghetti',
        'spaghetti.jpg',
        95000,
        'Mi Y sot bo bam',
        2
    ),
    (
        'Sushi ca hoi',
        'sushi-ca-hoi.jpg',
        120000,
        'Sushi ca hoi tuoi',
        3
    ),
    (
        'Ramen',
        'ramen.jpg',
        90000,
        'Mi ramen Nhat Ban',
        3
    ),
    (
        'Thit nuong Han Quoc',
        'thit-nuong.jpg',
        180000,
        'Thit nuong sot Han Quoc',
        4
    ),
    (
        'Kimchi',
        'kimchi.jpg',
        30000,
        'Kimchi cai thao',
        4
    ),
    (
        'Tra dao',
        'tra-dao.jpg',
        35000,
        'Tra dao cam sa',
        5
    ),
    (
        'Ca phe sua',
        'ca-phe-sua.jpg',
        30000,
        'Ca phe sua da',
        5
    );


INSERT INTO `sub_food` (
    `sub_name`,
    `sub_price`,
    `food_id`
)
VALUES
    ('Trung op la', 10000, 1),
    ('Bi cha', 15000, 1),
    ('Them thit bo', 25000, 2),
    ('Them banh pho', 10000, 2),
    ('Them phomai', 20000, 3),
    ('Them xuc xich', 25000, 3),
    ('Them ca hoi', 40000, 5),
    ('Them trung', 10000, 6),
    ('Them thit nuong', 50000, 7),
    ('Them kimchi', 15000, 7);


INSERT INTO `order` (
    `user_id`,
    `food_id`,
    `amount`,
    `code`,
    `arr_sub_id`
)
VALUES
    (1, 1, 2, 'ORD001', '1,2'),
    (1, 2, 1, 'ORD002', '3'),
    (1, 3, 2, 'ORD003', '5'),
    (1, 5, 1, 'ORD004', '7'),
    (1, 7, 3, 'ORD005', '9,10'),

    (2, 2, 1, 'ORD006', '3,4'),
    (2, 4, 2, 'ORD007', NULL),
    (2, 6, 1, 'ORD008', '8'),

    (3, 3, 1, 'ORD009', '5'),
    (3, 7, 2, 'ORD010', '9'),

    (4, 1, 1, 'ORD011', '1'),
    (5, 9, 3, 'ORD012', NULL);


INSERT INTO `like_res` (
    `user_id`,
    `res_id`,
    `date_like`
)
VALUES
    (1, 1, '2026-07-01 08:00:00'),
    (1, 2, '2026-07-02 08:00:00'),
    (1, 3, '2026-07-03 08:00:00'),
    (1, 4, '2026-07-04 08:00:00'),
    (1, 5, '2026-07-05 08:00:00'),

    (2, 1, '2026-07-06 09:00:00'),
    (2, 2, '2026-07-07 09:00:00'),
    (2, 3, '2026-07-08 09:00:00'),
    (2, 4, '2026-07-09 09:00:00'),

    (3, 1, '2026-07-10 10:00:00'),
    (3, 2, '2026-07-11 10:00:00'),
    (3, 3, '2026-07-12 10:00:00'),

    (4, 1, '2026-07-13 11:00:00'),
    (4, 2, '2026-07-14 11:00:00'),

    (5, 1, '2026-07-15 12:00:00'),

    (6, 2, '2026-07-16 13:00:00'),
    (7, 3, '2026-07-17 14:00:00');


INSERT INTO `rate_res` (
    `user_id`,
    `res_id`,
    `amount`,
    `date_rate`
)
VALUES
    (1, 1, 5, '2026-07-20 08:00:00'),
    (1, 2, 4, '2026-07-21 08:00:00'),
    (2, 1, 4, '2026-07-22 09:00:00'),
    (2, 3, 5, '2026-07-23 09:00:00'),
    (3, 2, 3, '2026-07-24 10:00:00'),
    (4, 4, 5, '2026-07-25 11:00:00'),
    (5, 5, 4, '2026-07-26 12:00:00'),
    (6, 1, 4, '2026-07-27 13:00:00'),
    (7, 3, 5, '2026-07-28 14:00:00'),
    (8, 2, 4, '2026-07-29 15:00:00');

-- Bài tập SQL yêu cầu
-- - Tìm 5 người đã like nhà hàng nhiều nhất.
SELECT u.`id`, u.`full_name`, count(lr.id) as `total_likes`
FROM `user` AS u
INNER JOIN `like_res` AS lr ON lr.`user_id` = u.`id`
GROUP BY u.`id`
ORDER BY `total_likes` DESC
LIMIT 5;

-- - Tìm 2 nhà hàng có lượt like nhiều nhất.
SELECT r.`id`, r.`res_name`, COUNT(lr.`id`) AS `total_likes` 
FROM `restaurant` AS r
INNER JOIN `like_res` AS lr 
	ON r.`id` = lr.`id`
GROUP BY r.`id`
ORDER BY `total_likes` DESC
LIMIT 2;

-- - Tìm người đã đặt hàng nhiều nhất.
SELECT u.`id`, u.`full_name`, COUNT(o.`id`) as `total_order`
FROM `user` AS u
INNER JOIN `order` as o
	ON o.`user_id` = u.`id`
GROUP BY u.`id`
ORDER BY `total_order` DESC
LIMIT 1;

-- - Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng).
SELECT u.`id`, u.`full_name`, u.`email`
FROM `user` AS u
LEFT JOIN `order` AS o
	ON o.`user_id` = u.`id` 
LEFT JOIN `like_res` as lr
	ON lr.`user_id` = u.`id`
LEFT JOIN `rate_res` as rr
	ON rr.`user_id` = u.`id`
WHERE
	o.id IS NULL
	AND lr.id IS NULL
	and rr.id IS NULL;

