/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Bún Mắm', 'bun-mam.jpg', 7.99, 'Bún Mắm thơm ngon', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Bún Riêu Cua', 'bun-rieu-cua.jpg', 6.49, 'Bún riêu cua đậm đà', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Bún Chả Hà Nội', 'bun-cha-ha-noi.jpg', 7.49, 'Bún chả Hà Nội truyền thống', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Bánh Mì Sài Gòn', 'banh-mi-sai-gon.jpg', 4.99, 'Bánh mì Sài Gòn truyền thống', 2),
(5, 'Bánh Mì Hamburger', 'hamburger.jpg', 5.49, 'Bánh mì hamburger thơm ngon', 2),
(6, 'Cơm Gà Hấp', 'com-ga-hap.jpg', 9.99, 'Cơm gà hấp thơm ngon', 3),
(7, 'Cơm Gà Xối Mỡ', 'com-ga-xoi-mo.jpg', 8.99, 'Cơm Gà Xối Mỡ ngon tuyệt', 3),
(8, 'Cơm Tấm Sườn Nướng', 'com-tam-suon-nuong.jpg', 8.49, 'Cơm tấm sườn nướng phong cách miền Nam', 3),
(9, 'Nước Cam', 'nuoc-cam.jpg', 2.99, 'Nước cam tươi ngon', 4),
(10, 'Nước Lọc', 'nuoc-loc.jpg', 1.49, 'Nước lọc tinh khiết', 4);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Đồ nước');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Đồ ăn nhanh');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Cơm');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Nước uống');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2023-11-07 08:30:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 1, '2023-11-07 11:30:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 3, '2023-11-08 11:30:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(3, 1, '2023-11-07 08:30:00'),
(3, 2, '2023-11-07 09:45:00'),
(3, 4, '2023-11-09 10:15:00'),
(3, 5, '2023-11-09 11:30:00'),
(4, 4, '2023-11-09 10:15:00'),
(4, 5, '2023-11-09 11:30:00'),
(5, 1, '2023-11-07 08:30:00'),
(5, 3, '2023-11-08 10:15:00'),
(5, 4, '2023-11-09 10:15:00'),
(5, 5, '2023-11-09 12:45:00'),
(6, 2, '2023-11-09 13:15:00'),
(7, 2, '2023-11-07 14:30:00'),
(7, 3, '2023-11-08 14:30:00'),
(7, 5, '2023-11-09 14:30:00'),
(9, 1, '2023-11-07 15:45:00'),
(9, 2, '2023-11-08 15:45:00'),
(9, 3, '2023-11-09 15:45:00'),
(10, 2, '2023-11-09 16:15:00'),
(1, 2, '2023-11-28 13:50:06'),
(2, 2, '2023-11-28 13:50:23'),
(3, 3, '2023-12-07 16:35:33'),
(11, 5, '2023-12-07 18:28:10');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 2, 3, 'ORDER001', 'SUBORDER001');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 1, 2, 'ORDER002', 'SUBORDER002');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 3, 1, 'ORDER003', 'SUBORDER003');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 2, 4, 'ORDER004', 'SUBORDER004'),
(5, 1, 2, 'ORDER005', 'SUBORDER005'),
(6, 3, 3, 'ORDER006', 'SUBORDER006'),
(7, 1, 1, 'ORDER007', 'SUBORDER007'),
(9, 2, 2, 'ORDER008', 'SUBORDER008'),
(10, 3, 4, 'ORDER009', 'SUBORDER009'),
(7, 2, 3, 'ORDER010', 'SUBORDER010'),
(3, 3, 5, 'test', 'Test01'),
(3, 2, 5, 'test', 'SUBORDER1701182357455'),
(3, 4, 5, NULL, 'SUBORDER1701182879141'),
(1, 3, 5, 'ORDER111', 'SUBORDER1701182939488'),
(1, 3, 2, NULL, 'SUBORDER1701183339703'),
(2, 3, 2, 'DISCOUNT01', 'SUBORDER1701183511389'),
(3, 10, 2, 'DISCOUNT02', 'SUBORDER1701183547091'),
(3, 1, 5, NULL, 'SUBORDER1701966155516'),
(11, 1, 5, NULL, 'SUBORDER1701968846296'),
(11, 10, 5, 'TESTTTT', 'SUBORDER1701968877847'),
(11, 10, 5, 'TESTING', 'SUBORDER1701973709361');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 4, 4, '2023-11-09 10:15:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 1, 5, '2023-11-07 11:30:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 4, 4, '2023-11-09 10:15:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 5, 3, '2023-11-09 11:30:00'),
(5, 3, 5, '2023-11-08 10:15:00'),
(6, 2, 4, '2023-11-09 13:15:00'),
(10, 2, 3, '2023-11-09 16:15:00'),
(1, 2, 5, '2023-11-28 03:33:10'),
(1, 2, 5, '2023-11-28 03:34:56'),
(2, 2, 3, '2023-11-28 03:35:32'),
(3, 1, 4, '2023-11-28 03:37:53'),
(10, 1, 4, '2023-12-07 16:24:16'),
(10, 5, 4, '2023-12-07 16:27:36'),
(11, 5, 4, '2023-12-07 17:05:44'),
(11, 4, 4, '2023-12-07 17:06:28'),
(11, 1, 4, '2023-12-07 18:29:14');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Nhà hàng ABC', 'abc-restaurant.jpg', 'Nhà hàng phục vụ các món ăn ngon');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Nhà hàng XYZ', 'xyz-restaurant.jpg', 'Nhà hàng với không gian thoải mái');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Nhà hàng 123', '123-restaurant.jpg', 'Nhà hàng với phong cách hiện đại');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Nhà hàng MNP', 'mnp-restaurant.jpg', 'Nhà hàng đặc biệt với món ăn độc đáo'),
(5, 'Nhà hàng QRS', 'qrs-restaurant.jpg', 'Nhà hàng sang trọng với dịch vụ tốt');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Thêm trứng', 1.99, 5);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Thêm thịt', 2.99, 5);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Thêm phô mai', 1.99, 5);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Canh Gà Lá Vang', 5.99, 6),
(5, 'Canh Chua', 4.49, 8),
(6, 'Canh Rau Củ', 5.49, 8),
(7, 'Bánh Mì Gà Xối Mỡ', 3.99, 4);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Nguyễn Văn A', 'nguyenvana@example.com', 'password123');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Trần Thị B', 'tranthib@example.com', 'securepassword1');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Lê Văn C', 'levanc@example.com', 'mypassword2023');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Phạm Thị D', 'phamthid@example.com', 'strongpass#456'),
(5, 'Hoàng Văn E', 'hoangvane@example.com', 'userpass789'),
(6, 'Ngọc Anh', 'ngocanh@example.com', 'mysecretpass'),
(7, 'Minh Anh', 'minhanh@example.com', 'anotherpass'),
(8, 'Hà Đức', 'haduc@example.com', 'password2023'),
(9, 'Trần Văn F', 'tranvanf@example.com', 'newpassword123'),
(10, 'Nguyễn Thị G', 'nguyenthig@example.com', 'securepass567'),
(11, 'Tester', 'test01@gmail.com', '$2b$10$Lm9MnKTRjt9PZSwQyNgvHuD.goyqVg50DFd2.w05241oojRlgZKY2');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;