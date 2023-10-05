-- belajar_spring_restful_api.addresses definition

CREATE TABLE `addresses` (
  `id` varchar(100) NOT NULL,
  `contact_id` varchar(100) NOT NULL,
  `street` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contacts_addresses` (`contact_id`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- belajar_spring_restful_api.contacts definition

CREATE TABLE `contacts` (
  `id` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_contacts` (`username`),
  CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- belajar_spring_restful_api.users definition

CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `token_expired_at` bigint DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;