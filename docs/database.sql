CREATE TABLE `users` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `students` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `user_id` integer UNIQUE NOT NULL,
  `nim` varchar(20) UNIQUE NOT NULL,
  `study_program` varchar(100) NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `lecturers` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `user_id` integer UNIQUE NOT NULL,
  `nidn` varchar(20) UNIQUE NOT NULL,
  `study_program` varchar(100) NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `registrations` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `student_id` integer NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `documents` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `registration_id` integer NOT NULL,
  `document_type` varchar(50) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `verification_status` varchar(20) NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `schedules` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `registration_id` integer NOT NULL,
  `schedule_date` date NOT NULL,
  `start_time` time NOT NULL,
  `room` varchar(100) NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `schedule_lecturers` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `schedule_id` integer NOT NULL,
  `lecturer_id` integer NOT NULL,
  `role` varchar(30) NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp
);

ALTER TABLE `students` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `lecturers` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `registrations` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

ALTER TABLE `documents` ADD FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`);

ALTER TABLE `schedules` ADD FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`);

ALTER TABLE `schedule_lecturers` ADD FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`);

ALTER TABLE `schedule_lecturers` ADD FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`);
