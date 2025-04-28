CREATE TABLE `user` (
  `id` integer PRIMARY KEY,
  `email` varchar(100) UNIQUE NOT NULL,
  `password` varchar(100),
  `firstname` varchar(50),
  `lastname` varchar(50),
  `avatar` varchar(100),
  `created_at` timestamp
);

CREATE TABLE `user_device` (
  `id` integer PRIMARY KEY,
  `user_id` integer NOT NULL,
  `device_token` varchar(200),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
);

CREATE TABLE `driver` (
  `id` integer PRIMARY KEY,
  `firstname` varchar(100),
  `lastname` varchar(100),
  `id_card_number` varchar(11),
  `car_driver_license` varchar(100),
  `image` varchar(100),
  `address` text
);

CREATE TABLE `taxi` (
  `id` integer PRIMARY KEY,
  `driver_id` integer NOT NULL,
  `license_plate` varchar(30),
  `disabled` bool DEFAULT false,
  `status` enum('available', 'working'),
  FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`)
);

CREATE TABLE `booking` (
  `id` INTEGER PRIMARY KEY,
  `user_id` integer NOT NULL,
  `taxi_id` integer,
  `status` enum('on_queue', 'complete', 'cancel', 'to_queue'),
  `booking_time` datetime NOT NULL,
  `taxi_coming_time` datetime,
  `cancel_time` datetime,
  `created_at` timestamp NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  FOREIGN KEY (`taxi_id`) REFERENCES `taxi` (`id`)
);



CREATE TABLE `notification` (
  `id` integer PRIMARY KEY,
  `booking_id` uuid NOT NULL,
  `user_id` integer NOT NULL,
  `type` enum('queue arriving', 'taxi_arriving', 'booking_confirm', 'booking_cancellation'),
  `created_at` timestamp,
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
);
