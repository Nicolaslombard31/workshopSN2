CREATE DATABASE IF NOT EXISTS immo_maison CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE immo_maison;


CREATE TABLE `users`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `email_verified_at` DATETIME NULL,
    `password` VARCHAR(255) NOT NULL,
    `remember_token` VARCHAR(100) NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `phone_number` VARCHAR(20) NOT NULL,
    `description` TEXT NOT NULL,
    `profile_image_id` INT NOT NULL,
    `owned_rooms_count` INT NOT NULL,
    `property_count` INT NOT NULL,
    UNIQUE KEY `users_email_unique` (`email`)
);

CREATE TABLE `rooms`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `home_type` VARCHAR(100) NOT NULL,
    `room_type` VARCHAR(100) NOT NULL,
    `total_occupancy` INT NOT NULL,
    `total_bedrooms` INT NOT NULL,
    `total_bathrooms` INT NOT NULL,
    `summary` TEXT NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `price` INT NOT NULL,
    `published_at` DATETIME NOT NULL,
    `owner_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `latitude` DECIMAL(10, 7) NOT NULL,
    `longitude` DECIMAL(10, 7) NOT NULL,
    `city` VARCHAR(100) NOT NULL,
    `state` VARCHAR(100) NOT NULL,
    `country` VARCHAR(100) NOT NULL,
    `max_people` INT NOT NULL,
    `total_rooms` INT NOT NULL,
    `main_image_id` INT NOT NULL,
    `is_available` BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (`owner_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `calendar`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `room_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `is_available` BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY(`room_id`) REFERENCES `rooms`(`id`)
);

CREATE TABLE `reservations`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `room_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `total_price` INT NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `duration_days` INT NOT NULL,
    `adults_count` INT NOT NULL,
    `children_count` INT NOT NULL,
    FOREIGN KEY(`room_id`) REFERENCES `rooms`(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `reviews`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `reservation_id` INT NOT NULL,
    `rating` INT NOT NULL,
    `comment` TEXT NOT NULL,
    FOREIGN KEY(`reservation_id`) REFERENCES `reservations`(`id`)
);

CREATE TABLE `media`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `model_id` INT NOT NULL,
    `model_type` ENUM('image', 'video', 'document') NOT NULL,
    `file_name` VARCHAR(255) NOT NULL,
    `mime_type` VARCHAR(100) NOT NULL
);

CREATE TABLE `room_equipments`(
    `room_id` INT NOT NULL,
    `equipment_name` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`room_id`, `equipment_name`),
    FOREIGN KEY(`room_id`) REFERENCES `rooms`(`id`)
);

CREATE TABLE `conditions`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `type` ENUM('rule', 'restriction') NOT NULL
);

CREATE TABLE `room_conditions`(
    `room_id` INT NOT NULL,
    `condition_id` INT NOT NULL,
    PRIMARY KEY(`room_id`, `condition_id`),
    FOREIGN KEY(`room_id`) REFERENCES `rooms`(`id`),
    FOREIGN KEY(`condition_id`) REFERENCES `conditions`(`id`)
);

CREATE TABLE `payments`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `reservation_id` INT NOT NULL,
    `amount` INT NOT NULL,
    `payment_method` VARCHAR(50) NOT NULL,
    `payment_status` ENUM('pending', 'completed', 'failed') NOT NULL,
    `payment_date` DATETIME NOT NULL,
    `refund` BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY(`reservation_id`) REFERENCES `reservations`(`id`)
);

CREATE TABLE `favorites`(
    `user_id` INT NOT NULL,
    `room_id` INT NOT NULL,
    PRIMARY KEY(`user_id`, `room_id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`room_id`) REFERENCES `rooms`(`id`)
);

-- Ajout des clés étrangères
ALTER TABLE `users`
    ADD CONSTRAINT `users_profile_image_id_foreign` FOREIGN KEY(`profile_image_id`) REFERENCES `media`(`id`);
ALTER TABLE `rooms`
    ADD CONSTRAINT `rooms_main_image_id_foreign` FOREIGN KEY(`main_image_id`) REFERENCES `media`(`id`);
ALTER TABLE `calendar`
    ADD CONSTRAINT `calendar_room_id_foreign` FOREIGN KEY(`room_id`) REFERENCES `rooms`(`id`);
ALTER TABLE `reservations`
    ADD CONSTRAINT `reservations_room_id_foreign` FOREIGN KEY(`room_id`) REFERENCES `rooms`(`id`),
    ADD CONSTRAINT `reservations_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE `reviews`
    ADD CONSTRAINT `reviews_reservation_id_foreign` FOREIGN KEY(`reservation_id`) REFERENCES `reservations`(`id`);
ALTER TABLE `payments`
    ADD CONSTRAINT `payments_reservation_id_foreign` FOREIGN KEY(`reservation_id`) REFERENCES `reservations`(`id`);
ALTER TABLE `favorites`
    ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    ADD CONSTRAINT `favorites_room_id_foreign` FOREIGN KEY(`room_id`) REFERENCES `rooms`(`id`);
ALTER TABLE `room_conditions`
    ADD CONSTRAINT `room_conditions_condition_id_foreign` FOREIGN KEY(`condition_id`) REFERENCES `conditions`(`id`);