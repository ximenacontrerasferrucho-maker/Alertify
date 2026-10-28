-- SQL ALERTIFY MODIFICADO: columnas identificadoras y claves foráneas como INT; resto como VARCHAR
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-09-2026 a las 20:19:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alertify` (estructura adaptada a la regla solicitada)
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accident_types`
--

CREATE TABLE `accident_types` (
  `id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(80) NOT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `severity` VARCHAR(30) NOT NULL DEFAULT 'medium',
  `icon` VARCHAR(50) DEFAULT NULL,
  `color` VARCHAR(20) DEFAULT '#FFD60A',
  `is_active` VARCHAR(20) NOT NULL DEFAULT '1',
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `accident_types`
--

INSERT INTO `accident_types` (`id`, `name`, `description`, `severity`, `icon`, `color`, `is_active`, `created_at`) VALUES
(1, 'Choque vehicular', 'Colisión entre dos o más vehículos', 'high', 'car-crash', '#FF6B00', 1, '2026-09-13 12:57:51'),
(2, 'Atropello', 'Persona atropellada por un vehículo', 'critical', 'pedestrian', '#EF4444', 1, '2026-09-13 12:57:51'),
(3, 'Volcamiento', 'Vehículo que se volcó', 'high', 'rollover', '#F59E0B', 1, '2026-09-13 12:57:51'),
(4, 'Incendio vehicular', 'Vehículo en llamas', 'critical', 'fire', '#DC2626', 1, '2026-09-13 12:57:51'),
(5, 'Accidente de moto', 'Accidente que involucra motocicletas', 'high', 'motorcycle', '#F97316', 1, '2026-09-13 12:57:51'),
(6, 'Caída de árbol / objeto', 'Obstáculo en la vía', 'medium', 'obstacle', '#84CC16', 1, '2026-09-13 12:57:51'),
(7, 'Derrumbe / Deslizamiento', 'Material que bloquea la vía', 'high', 'landslide', '#A855F7', 1, '2026-09-13 12:57:51'),
(8, 'Otro', 'Otro tipo de incidente', 'medium', 'other', '#64748B', 1, '2026-09-13 12:57:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerts`
--

CREATE TABLE `alerts` (
  `id` INT(10) UNSIGNED NOT NULL,
  `incident_id` INT(10) UNSIGNED NOT NULL,
  `alert_code` VARCHAR(30) NOT NULL,
  `sent_to` VARCHAR(20) NOT NULL DEFAULT '123',
  `channel` VARCHAR(30) NOT NULL DEFAULT 'api',
  `message` VARCHAR(1000) NOT NULL,
  `status` VARCHAR(30) NOT NULL DEFAULT 'pending',
  `priority` VARCHAR(30) NOT NULL DEFAULT 'high',
  `response_notes` VARCHAR(1000) DEFAULT NULL,
  `sent_at` VARCHAR(30) DEFAULT NULL,
  `acknowledged_at` VARCHAR(30) DEFAULT NULL,
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alerts`
--

INSERT INTO `alerts` (`id`, `incident_id`, `alert_code`, `sent_to`, `channel`, `message`, `status`, `priority`, `response_notes`, `sent_at`, `acknowledged_at`, `created_at`) VALUES
(1, 1, 'ALT-2026-0001', '123', 'api', 'ALERTA ALERTIFY: Choque vehicular en Autopista Norte con Calle 127. 2 posibles afectados. Coordenadas: 4.735, -74.050', 'sent', 'high', NULL, '2026-09-13 12:57:51', NULL, '2026-09-13 12:57:51'),
(2, 2, 'ALT-2026-0002', '123', 'api', 'ALERTA ALERTIFY CRÍTICA: Atropello en Avenida Caracas con Calle 72. 1 persona afectada. Coordenadas: 4.6486, -74.0833', 'acknowledged', 'urgent', NULL, '2026-09-13 12:57:51', '2026-09-13 12:57:51', '2026-09-13 12:57:51'),
(3, 3, 'ALT-2026-0003', '123', 'api', 'ALERTA ALERTIFY: Accidente de moto en Autopista Norte Km 12 (Chía). 1 afectado. Coordenadas: 4.860, -74.060', 'pending', 'high', NULL, NULL, NULL, '2026-09-13 12:57:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alert_logs`
--

CREATE TABLE `alert_logs` (
  `id` INT(10) UNSIGNED NOT NULL,
  `alert_id` INT(10) UNSIGNED NOT NULL,
  `event` VARCHAR(50) NOT NULL,
  `details` VARCHAR(1000) DEFAULT NULL,
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED DEFAULT NULL,
  `action` VARCHAR(80) NOT NULL,
  `table_name` VARCHAR(50) DEFAULT NULL,
  `record_id` INT(10) UNSIGNED DEFAULT NULL,
  `old_values` VARCHAR(10000) DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` VARCHAR(10000) DEFAULT NULL CHECK (json_valid(`new_values`)),
  `ip_address` VARCHAR(45) DEFAULT NULL,
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE `cities` (
  `id` INT(10) UNSIGNED NOT NULL,
  `department_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cities`
--

INSERT INTO `cities` (`id`, `department_id`, `name`) VALUES
(1, 1, 'Bogotá'),
(2, 1, 'Chía'),
(3, 1, 'Soacha'),
(4, 2, 'Medellín'),
(5, 3, 'Cali'),
(6, 4, 'Barranquilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `community_reports`
--

CREATE TABLE `community_reports` (
  `id` INT(10) UNSIGNED NOT NULL,
  `incident_id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED DEFAULT NULL,
  `comment` VARCHAR(1000) NOT NULL,
  `photo_url` VARCHAR(255) DEFAULT NULL,
  `is_anonymous` VARCHAR(20) NOT NULL DEFAULT '0',
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `community_reports`
--

INSERT INTO `community_reports` (`id`, `incident_id`, `user_id`, `comment`, `photo_url`, `is_anonymous`, `created_at`) VALUES
(1, 1, 4, 'Hay mucho tráfico. El camión está bloqueando el carril izquierdo.', NULL, 0, '2026-09-13 12:57:51'),
(2, 2, 3, 'La persona está consciente pero no se puede levantar.', NULL, 0, '2026-09-13 12:57:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coverage_zones`
--

CREATE TABLE `coverage_zones` (
  `id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `city_id` INT(10) UNSIGNED DEFAULT NULL,
  `description` VARCHAR(1000) DEFAULT NULL,
  `geojson` VARCHAR(10000) DEFAULT NULL CHECK (json_valid(`geojson`)),
  `is_active` VARCHAR(20) NOT NULL DEFAULT '1',
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `code` VARCHAR(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id`, `name`, `code`) VALUES
(1, 'Cundinamarca', '25'),
(2, 'Antioquia', '05'),
(3, 'Valle del Cauca', '76'),
(4, 'Atlántico', '08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `device_tokens`
--

CREATE TABLE `device_tokens` (
  `id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `platform` VARCHAR(30) NOT NULL DEFAULT 'android',
  `is_active` VARCHAR(20) NOT NULL DEFAULT '1',
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emergency_units`
--

CREATE TABLE `emergency_units` (
  `id` INT(10) UNSIGNED NOT NULL,
  `unit_code` VARCHAR(20) NOT NULL,
  `unit_type` VARCHAR(30) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(20) DEFAULT NULL,
  `current_lat` VARCHAR(30) DEFAULT NULL,
  `current_lng` VARCHAR(30) DEFAULT NULL,
  `status` VARCHAR(30) NOT NULL DEFAULT 'available',
  `city_id` INT(10) UNSIGNED DEFAULT NULL,
  `is_active` VARCHAR(20) NOT NULL DEFAULT '1',
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `emergency_units`
--

INSERT INTO `emergency_units` (`id`, `unit_code`, `unit_type`, `name`, `phone`, `current_lat`, `current_lng`, `status`, `city_id`, `is_active`, `created_at`) VALUES
(1, 'AMB-01', 'ambulance', 'Ambulancia Norte 1', '3101112233', NULL, NULL, 'available', 1, 1, '2026-09-13 12:57:51'),
(2, 'AMB-02', 'ambulance', 'Ambulancia Centro 2', '3101112244', NULL, NULL, 'busy', 1, 1, '2026-09-13 12:57:51'),
(3, 'POL-15', 'police', 'Patrulla Policía 15', '3102223344', NULL, NULL, 'available', 1, 1, '2026-09-13 12:57:51'),
(4, 'BOM-03', 'fire', 'Bomberos Estación 3', '3103334455', NULL, NULL, 'available', 1, 1, '2026-09-13 12:57:51'),
(5, 'TRA-07', 'transit', 'Agentes de Tránsito 07', '3104445566', NULL, NULL, 'available', 1, 1, '2026-09-13 12:57:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidents`
--

CREATE TABLE `incidents` (
  `id` INT(10) UNSIGNED NOT NULL,
  `public_code` VARCHAR(20) NOT NULL,
  `accident_type_id` INT(10) UNSIGNED NOT NULL,
  `reported_by` INT(10) UNSIGNED DEFAULT NULL,
  `title` VARCHAR(150) NOT NULL,
  `description` VARCHAR(1000) DEFAULT NULL,
  `latitude` VARCHAR(30) NOT NULL,
  `longitude` VARCHAR(30) NOT NULL,
  `address` VARCHAR(255) DEFAULT NULL,
  `city_id` INT(10) UNSIGNED DEFAULT NULL,
  `status` VARCHAR(30) NOT NULL DEFAULT 'reported',
  `severity` VARCHAR(30) NOT NULL DEFAULT 'medium',
  `victims_count` VARCHAR(20) DEFAULT '0',
  `injured_count` VARCHAR(20) DEFAULT '0',
  `deceased_count` VARCHAR(20) DEFAULT '0',
  `is_live` VARCHAR(20) NOT NULL DEFAULT '1',
  `is_verified` VARCHAR(20) NOT NULL DEFAULT '0',
  `weather_conditions` VARCHAR(100) DEFAULT NULL,
  `road_conditions` VARCHAR(100) DEFAULT NULL,
  `reported_at` VARCHAR(30) NOT NULL DEFAULT '',
  `confirmed_at` VARCHAR(30) DEFAULT NULL,
  `resolved_at` VARCHAR(30) DEFAULT NULL,
  `created_at` VARCHAR(30) NOT NULL DEFAULT '',
  `updated_at` VARCHAR(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `incidents`
--

INSERT INTO `incidents` (`id`, `public_code`, `accident_type_id`, `reported_by`, `title`, `description`, `latitude`, `longitude`, `address`, `city_id`, `status`, `severity`, `victims_count`, `injured_count`, `deceased_count`, `is_live`, `is_verified`, `weather_conditions`, `road_conditions`, `reported_at`, `confirmed_at`, `resolved_at`, `created_at`, `updated_at`) VALUES
(1, 'INC-2026-0001', 1, 3, 'Choque en Autopista Norte', 'Colisión entre carro y camión en el carril central', 4.73500000, -74.05000000, 'Autopista Norte con Calle 127', 1, 'confirmed', 'high', 2, 2, 0, 1, 1, NULL, NULL, '2026-09-13 12:57:51', NULL, NULL, '2026-09-13 12:57:51', NULL),
(2, 'INC-2026-0002', 2, 4, 'Atropello cerca a TransMilenio', 'Peatón atropellado en zona de paradero', 4.64860000, -74.08330000, 'Avenida Caracas con Calle 72', 1, 'in_progress', 'critical', 1, 1, 0, 1, 1, NULL, NULL, '2026-09-13 12:57:51', NULL, NULL, '2026-09-13 12:57:51', NULL),
(3, 'INC-2026-0003', 5, 3, 'Accidente de moto en vía a Chía', 'Motociclista caído en la vía', 4.86000000, -74.06000000, 'Autopista Norte Km 12', 2, 'reported', 'high', 1, 1, 0, 1, 0, NULL, NULL, '2026-09-13 12:57:51', NULL, NULL, '2026-09-13 12:57:51', NULL),
(4, 'INC-2026-0004', 1, 4, 'Choque múltiple en Calle 26', 'Tres vehículos involucrados', 4.63000000, -74.09000000, 'Calle 26 con Carrera 50', 1, 'resolved', 'medium', 0, 0, 0, 0, 1, NULL, NULL, '2026-09-13 12:57:51', NULL, NULL, '2026-09-13 12:57:51', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incident_photos`
--

CREATE TABLE `incident_photos` (
  `id` INT(10) UNSIGNED NOT NULL,
  `incident_id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED DEFAULT NULL,
  `photo_url` VARCHAR(255) NOT NULL,
  `caption` VARCHAR(255) DEFAULT NULL,
  `is_main` VARCHAR(20) NOT NULL DEFAULT '0',
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incident_updates`
--

CREATE TABLE `incident_updates` (
  `id` INT(10) UNSIGNED NOT NULL,
  `incident_id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED DEFAULT NULL,
  `old_status` VARCHAR(30) DEFAULT NULL,
  `new_status` VARCHAR(30) NOT NULL,
  `note` VARCHAR(1000) DEFAULT NULL,
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `incident_updates`
--

INSERT INTO `incident_updates` (`id`, `incident_id`, `user_id`, `old_status`, `new_status`, `note`, `created_at`) VALUES
(1, 1, 2, 'reported', 'confirmed', 'Confirmado por operador. Ambulancia en camino.', '2026-09-13 12:57:51'),
(2, 2, 2, 'reported', 'in_progress', 'Unidad de emergencias asignada y en el lugar.', '2026-09-13 12:57:51'),
(3, 4, 2, 'in_progress', 'resolved', 'Incidente cerrado. Vía despejada.', '2026-09-13 12:57:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incident_vehicles`
--

CREATE TABLE `incident_vehicles` (
  `id` INT(10) UNSIGNED NOT NULL,
  `incident_id` INT(10) UNSIGNED NOT NULL,
  `vehicle_type` VARCHAR(30) NOT NULL DEFAULT 'car',
  `plate` VARCHAR(15) DEFAULT NULL,
  `brand` VARCHAR(50) DEFAULT NULL,
  `color` VARCHAR(30) DEFAULT NULL,
  `model_year` VARCHAR(4) DEFAULT NULL,
  `damage_level` VARCHAR(30) DEFAULT 'moderate',
  `occupants` VARCHAR(20) DEFAULT '1',
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `incident_vehicles`
--

INSERT INTO `incident_vehicles` (`id`, `incident_id`, `vehicle_type`, `plate`, `brand`, `color`, `model_year`, `damage_level`, `occupants`, `created_at`) VALUES
(1, 1, 'car', 'ABC123', 'Mazda', 'Rojo', NULL, 'moderate', 2, '2026-09-13 12:57:51'),
(2, 1, 'truck', 'XYZ987', 'Kenworth', 'Blanco', NULL, 'minor', 1, '2026-09-13 12:57:51'),
(3, 2, 'bus', 'TM-045', 'TransMilenio', 'Rojo', NULL, 'none', 1, '2026-09-13 12:57:51'),
(4, 3, 'motorcycle', 'MOT456', 'Yamaha', 'Negro', NULL, 'severe', 1, '2026-09-13 12:57:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `body` VARCHAR(1000) NOT NULL,
  `type` VARCHAR(30) NOT NULL DEFAULT 'system',
  `reference_id` INT(10) UNSIGNED DEFAULT NULL,
  `is_read` VARCHAR(20) NOT NULL DEFAULT '0',
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `body`, `type`, `reference_id`, `is_read`, `created_at`) VALUES
(1, 3, 'Tu reporte fue recibido', 'El incidente INC-2026-0001 ha sido registrado correctamente.', 'incident', 1, 0, '2026-09-13 12:57:51'),
(2, 2, 'Nueva alerta crítica', 'Atropello reportado en Avenida Caracas. Requiere atención inmediata.', 'alert', 2, 0, '2026-09-13 12:57:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `is_active` VARCHAR(20) NOT NULL DEFAULT '1',
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `is_active`, `created_at`) VALUES
(1, 'citizen', 'Ciudadano que reporta incidentes', 1, '2026-09-13 12:57:51'),
(2, 'operator', 'Operador de la central de monitoreo', 1, '2026-09-13 12:57:51'),
(3, 'admin', 'Administrador del sistema', 1, '2026-09-13 12:57:51'),
(4, 'emergency', 'Personal de unidades de emergencia', 1, '2026-09-13 12:57:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_settings`
--

CREATE TABLE `system_settings` (
  `id` INT(10) UNSIGNED NOT NULL,
  `setting_key` VARCHAR(80) NOT NULL,
  `setting_value` VARCHAR(1000) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `updated_at` VARCHAR(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `system_settings`
--

INSERT INTO `system_settings` (`id`, `setting_key`, `setting_value`, `description`, `updated_at`) VALUES
(1, 'app_name', 'Alertify', 'Nombre de la aplicación', NULL),
(2, 'emergency_number', '123', 'Número de emergencia nacional', NULL),
(3, 'auto_alert_enabled', '1', 'Enviar alerta automática al 123', NULL),
(4, 'default_city', 'Bogotá', 'Ciudad por defecto', NULL),
(5, 'map_default_lat', '4.7110', 'Latitud por defecto del mapa', NULL),
(6, 'map_default_lng', '-74.0721', 'Longitud por defecto del mapa', NULL),
(7, 'alert_retry_minutes', '5', 'Minutos para reintentar alerta fallida', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unit_assignments`
--

CREATE TABLE `unit_assignments` (
  `id` INT(10) UNSIGNED NOT NULL,
  `incident_id` INT(10) UNSIGNED NOT NULL,
  `unit_id` INT(10) UNSIGNED NOT NULL,
  `assigned_by` INT(10) UNSIGNED DEFAULT NULL,
  `status` VARCHAR(30) NOT NULL DEFAULT 'assigned',
  `assigned_at` VARCHAR(30) NOT NULL DEFAULT '',
  `arrived_at` VARCHAR(30) DEFAULT NULL,
  `finished_at` VARCHAR(30) DEFAULT NULL,
  `notes` VARCHAR(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unit_assignments`
--

INSERT INTO `unit_assignments` (`id`, `incident_id`, `unit_id`, `assigned_by`, `status`, `assigned_at`, `arrived_at`, `finished_at`, `notes`) VALUES
(1, 1, 1, 2, 'en_route', '2026-09-13 12:57:51', NULL, NULL, NULL),
(2, 2, 2, 2, 'on_scene', '2026-09-13 12:57:51', NULL, NULL, NULL),
(3, 2, 3, 2, 'en_route', '2026-09-13 12:57:51', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` INT(10) UNSIGNED NOT NULL,
  `full_name` VARCHAR(120) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `phone` VARCHAR(20) DEFAULT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `role` VARCHAR(30) NOT NULL DEFAULT 'citizen',
  `document_type` VARCHAR(30) DEFAULT 'CC',
  `document_number` VARCHAR(30) DEFAULT NULL,
  `profile_photo` VARCHAR(255) DEFAULT NULL,
  `is_active` VARCHAR(20) NOT NULL DEFAULT '1',
  `last_login` VARCHAR(30) DEFAULT NULL,
  `created_at` VARCHAR(30) NOT NULL DEFAULT '',
  `updated_at` VARCHAR(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `phone`, `password_hash`, `role`, `document_type`, `document_number`, `profile_photo`, `is_active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'Admin Alertify', 'admin@alertify.co', '3001234567', '$2y$10$examplehashadmin123', 'admin', 'CC', '10000001', NULL, 1, NULL, '2026-09-13 12:57:51', NULL),
(2, 'Operador Central', 'operador@alertify.co', '3009876543', '$2y$10$examplehashoperator', 'operator', 'CC', '10000002', NULL, 1, NULL, '2026-09-13 12:57:51', NULL),
(3, 'Juan Pérez', 'juan.perez@email.com', '3105551234', '$2y$10$examplehashcitizen1', 'citizen', 'CC', '10000003', NULL, 1, NULL, '2026-09-13 12:57:51', NULL),
(4, 'María Gómez', 'maria.gomez@email.com', '3204449876', '$2y$10$examplehashcitizen2', 'citizen', 'CC', '10000004', NULL, 1, NULL, '2026-09-13 12:57:51', NULL),
(5, 'Unidad Emergencias', 'emergencias@alertify.co', '6011234567', '$2y$10$examplehashemergency', 'emergency', 'CC', '10000005', NULL, 1, NULL, '2026-09-13 12:57:51', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_app_usage`
--

CREATE TABLE `user_app_usage` (
  `id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `first_used_at` VARCHAR(30) NOT NULL DEFAULT '',
  `last_used_at` VARCHAR(30) DEFAULT NULL,
  `usage_count` VARCHAR(20) NOT NULL DEFAULT '1',
  `platform` VARCHAR(30) DEFAULT NULL,
  `app_version` VARCHAR(20) DEFAULT NULL,
  `created_at` VARCHAR(30) NOT NULL DEFAULT '',
  `updated_at` VARCHAR(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `device_info` VARCHAR(255) DEFAULT NULL,
  `ip_address` VARCHAR(45) DEFAULT NULL,
  `expires_at` VARCHAR(30) NOT NULL,
  `created_at` VARCHAR(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accident_types`
--
ALTER TABLE `accident_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alert_code` (`alert_code`),
  ADD KEY `fk_alert_incident` (`incident_id`),
  ADD KEY `idx_alert_status` (`status`);

--
-- Indices de la tabla `alert_logs`
--
ALTER TABLE `alert_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_alert` (`alert_id`);

--
-- Indices de la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_audit_user` (`user_id`),
  ADD KEY `idx_audit_action` (`action`),
  ADD KEY `idx_audit_date` (`created_at`);

--
-- Indices de la tabla `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_city_dept` (`department_id`,`name`);

--
-- Indices de la tabla `community_reports`
--
ALTER TABLE `community_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_community_incident` (`incident_id`),
  ADD KEY `fk_community_user` (`user_id`);

--
-- Indices de la tabla `coverage_zones`
--
ALTER TABLE `coverage_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zone_city` (`city_id`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_user_token` (`user_id`,`token`);

--
-- Indices de la tabla `emergency_units`
--
ALTER TABLE `emergency_units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unit_code` (`unit_code`),
  ADD KEY `fk_unit_city` (`city_id`);

--
-- Indices de la tabla `incidents`
--
ALTER TABLE `incidents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `public_code` (`public_code`),
  ADD KEY `fk_incident_type` (`accident_type_id`),
  ADD KEY `fk_incident_user` (`reported_by`),
  ADD KEY `fk_incident_city` (`city_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_live` (`is_live`),
  ADD KEY `idx_severity` (`severity`),
  ADD KEY `idx_location` (`latitude`,`longitude`),
  ADD KEY `idx_reported_at` (`reported_at`);

--
-- Indices de la tabla `incident_photos`
--
ALTER TABLE `incident_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_photo_incident` (`incident_id`),
  ADD KEY `fk_photo_user` (`user_id`);

--
-- Indices de la tabla `incident_updates`
--
ALTER TABLE `incident_updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_update_incident` (`incident_id`),
  ADD KEY `fk_update_user` (`user_id`);

--
-- Indices de la tabla `incident_vehicles`
--
ALTER TABLE `incident_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vehicle_incident` (`incident_id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_read` (`user_id`,`is_read`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indices de la tabla `unit_assignments`
--
ALTER TABLE `unit_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_assign_incident` (`incident_id`),
  ADD KEY `fk_assign_unit` (`unit_id`),
  ADD KEY `fk_assign_user` (`assigned_by`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `idx_email` (`email`);

--
-- Indices de la tabla `user_app_usage`
--
ALTER TABLE `user_app_usage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_user_usage` (`user_id`);

--
-- Indices de la tabla `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `fk_session_user` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accident_types`
--
ALTER TABLE `accident_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `alert_logs`
--
ALTER TABLE `alert_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `community_reports`
--
ALTER TABLE `community_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `coverage_zones`
--
ALTER TABLE `coverage_zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `emergency_units`
--
ALTER TABLE `emergency_units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `incidents`
--
ALTER TABLE `incidents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `incident_photos`
--
ALTER TABLE `incident_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incident_updates`
--
ALTER TABLE `incident_updates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `incident_vehicles`
--
ALTER TABLE `incident_vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `unit_assignments`
--
ALTER TABLE `unit_assignments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `user_app_usage`
--
ALTER TABLE `user_app_usage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `fk_alert_incident` FOREIGN KEY (`incident_id`) REFERENCES `incidents` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `alert_logs`
--
ALTER TABLE `alert_logs`
  ADD CONSTRAINT `fk_log_alert` FOREIGN KEY (`alert_id`) REFERENCES `alerts` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `fk_audit_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `fk_city_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Filtros para la tabla `community_reports`
--
ALTER TABLE `community_reports`
  ADD CONSTRAINT `fk_community_incident` FOREIGN KEY (`incident_id`) REFERENCES `incidents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_community_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `coverage_zones`
--
ALTER TABLE `coverage_zones`
  ADD CONSTRAINT `fk_zone_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD CONSTRAINT `fk_device_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `emergency_units`
--
ALTER TABLE `emergency_units`
  ADD CONSTRAINT `fk_unit_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `incidents`
--
ALTER TABLE `incidents`
  ADD CONSTRAINT `fk_incident_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_incident_type` FOREIGN KEY (`accident_type_id`) REFERENCES `accident_types` (`id`),
  ADD CONSTRAINT `fk_incident_user` FOREIGN KEY (`reported_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `incident_photos`
--
ALTER TABLE `incident_photos`
  ADD CONSTRAINT `fk_photo_incident` FOREIGN KEY (`incident_id`) REFERENCES `incidents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_photo_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `incident_updates`
--
ALTER TABLE `incident_updates`
  ADD CONSTRAINT `fk_update_incident` FOREIGN KEY (`incident_id`) REFERENCES `incidents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_update_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `incident_vehicles`
--
ALTER TABLE `incident_vehicles`
  ADD CONSTRAINT `fk_vehicle_incident` FOREIGN KEY (`incident_id`) REFERENCES `incidents` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notif_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `unit_assignments`
--
ALTER TABLE `unit_assignments`
  ADD CONSTRAINT `fk_assign_incident` FOREIGN KEY (`incident_id`) REFERENCES `incidents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_assign_unit` FOREIGN KEY (`unit_id`) REFERENCES `emergency_units` (`id`),
  ADD CONSTRAINT `fk_assign_user` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `user_app_usage`
--
ALTER TABLE `user_app_usage`
  ADD CONSTRAINT `fk_usage_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `fk_session_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
