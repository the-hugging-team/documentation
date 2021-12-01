-- MySQL Script generated by MySQL Workbench
-- Wed Dec  1 12:36:15 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='';

-- -----------------------------------------------------
-- Schema warehouse
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `warehouse` ;

-- -----------------------------------------------------
-- Schema warehouse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `warehouse` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `warehouse` ;

-- -----------------------------------------------------
-- Table `warehouse`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`roles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  `sex` INT NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT "0000-00-00 00:00:00",
  `updated_at` TIMESTAMP NOT NULL DEFAULT "0000-00-00 00:00:00",
  `created_by` INT UNSIGNED NOT NULL,
  `updated_by` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `fk_created_by_idx` (`created_by` ASC) VISIBLE,
  INDEX `fk_updated_by_idx` (`updated_by` ASC) VISIBLE,
  INDEX `fk_role_id_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `warehouse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_updated_by`
    FOREIGN KEY (`updated_by`)
    REFERENCES `warehouse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `warehouse`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`permissions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`role_has_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`role_has_permissions` (
  `role_id` INT UNSIGNED NOT NULL,
  `permission_id` INT UNSIGNED NOT NULL,
  INDEX `fk_role_id_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_permission_id_idx` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `fk_role_has_permissions_role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `warehouse`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_has_permissions_permission_id`
    FOREIGN KEY (`permission_id`)
    REFERENCES `warehouse`.`permissions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`product_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`product_categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`rooms` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`shelves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`shelves` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `room_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `idx_shelves_room_id` (`room_id` ASC) INVISIBLE,
  CONSTRAINT `fk_shelves_room_id`
    FOREIGN KEY (`room_id`)
    REFERENCES `warehouse`.`rooms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`product_quantity_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`product_quantity_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `nomenclature` VARCHAR(45) NOT NULL,
  `product_category_id` INT UNSIGNED NOT NULL,
  `quantity` DOUBLE NOT NULL DEFAULT 0.00,
  `product_quantity_type_id` INT UNSIGNED NOT NULL,
  `retail_price` DOUBLE UNSIGNED NOT NULL DEFAULT 0.00,
  `wholesale_price` DOUBLE UNSIGNED NOT NULL DEFAULT 0.00,
  `delivery_price` DOUBLE UNSIGNED NOT NULL DEFAULT 0.00,
  `shelf_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nomenclature_UNIQUE` (`nomenclature` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_product_category_id_idx` (`product_category_id` ASC) VISIBLE,
  INDEX `fk_shelf_id_idx` (`shelf_id` ASC) VISIBLE,
  INDEX `fk_product_quantity_type_id_idx` (`product_quantity_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_product_category_id`
    FOREIGN KEY (`product_category_id`)
    REFERENCES `warehouse`.`product_categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_shelf_id`
    FOREIGN KEY (`shelf_id`)
    REFERENCES `warehouse`.`shelves` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_product_quantity_type_id`
    FOREIGN KEY (`product_quantity_type_id`)
    REFERENCES `warehouse`.`product_quantity_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`clients` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`suppliers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`deliveries` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_id` INT UNSIGNED NOT NULL,
  `invoice_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT "0000-00-00 00:00:00",
  `updated_at` TIMESTAMP NOT NULL DEFAULT "0000-00-00 00:00:00",
  `created_by` INT UNSIGNED NOT NULL,
  `updated_by` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_supplier_id_idx` (`supplier_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_created_by_idx` (`created_by` ASC) VISIBLE,
  INDEX `fk_updated_by_idx` (`updated_by` ASC) VISIBLE,
  CONSTRAINT `fk_deliveries_supplier_id`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `warehouse`.`suppliers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deliveries_created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `warehouse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deliveries_updated_by`
    FOREIGN KEY (`updated_by`)
    REFERENCES `warehouse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`delivery_has_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`delivery_has_products` (
  `delivery_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` DOUBLE NOT NULL DEFAULT 0.00,
  `product_quantity_type_id` INT UNSIGNED NOT NULL,
  INDEX `fk_delivery_id_idx` (`delivery_id` ASC) VISIBLE,
  INDEX `fk_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_product_quantity_type_id_idx` (`product_quantity_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_has_products_delivery_id`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `warehouse`.`deliveries` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_has_products_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `warehouse`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_has_products_product_quantity_type_id`
    FOREIGN KEY (`product_quantity_type_id`)
    REFERENCES `warehouse`.`product_quantity_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`cash_registers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`cash_registers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `balance` DOUBLE UNSIGNED NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_cash_registers_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `warehouse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`sales` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` INT UNSIGNED NOT NULL,
  `invoice_id` INT UNSIGNED NULL DEFAULT NULL,
  `cash_register_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT "0000-00-00 00:00:00",
  `created_by` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_id_idx` (`client_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cash_register_id_idx` (`cash_register_id` ASC) VISIBLE,
  INDEX `fk_created_by_idx` (`created_by` ASC) VISIBLE,
  CONSTRAINT `fk_sales_client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `warehouse`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_cash_register_id`
    FOREIGN KEY (`cash_register_id`)
    REFERENCES `warehouse`.`cash_registers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `warehouse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`sales_has_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`sales_has_products` (
  `sale_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` DOUBLE NOT NULL DEFAULT 0.00,
  `product_quantity_type_id` INT UNSIGNED NOT NULL,
  INDEX `fk_sale_id_idx` (`sale_id` ASC) VISIBLE,
  INDEX `fk_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_product_quantity_type_id_idx` (`product_quantity_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_sales_has_products_sale_id`
    FOREIGN KEY (`sale_id`)
    REFERENCES `warehouse`.`sales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_has_products_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `warehouse`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_has_products_product_quantity_type_id`
    FOREIGN KEY (`product_quantity_type_id`)
    REFERENCES `warehouse`.`product_quantity_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`invoices` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `total_price` DOUBLE NOT NULL DEFAULT 0.00,
  `created_at` TIMESTAMP NOT NULL DEFAULT "0000-00-00 00:00:00",
  `created_by` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_created_by_idx` (`created_by` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `warehouse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`transaction_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`transaction_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`transactions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cash_register_id` INT UNSIGNED NOT NULL,
  `transaction_type_id` INT UNSIGNED NOT NULL,
  `amount` DOUBLE UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` TIMESTAMP NOT NULL DEFAULT "0000-00-00 00:00:00",
  `created_by` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cash_register_id_idx` (`cash_register_id` ASC) VISIBLE,
  INDEX `fk_created_by_idx` (`created_by` ASC) VISIBLE,
  INDEX `fk_transaction_type_id_idx` (`transaction_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_transactions_cash_register_id`
    FOREIGN KEY (`cash_register_id`)
    REFERENCES `warehouse`.`cash_registers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `warehouse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_transaction_type_id`
    FOREIGN KEY (`transaction_type_id`)
    REFERENCES `warehouse`.`transaction_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`activity_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`activity_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `warehouse`.`activities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `warehouse`.`activities` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity_type_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT "0000-00-00 00:00:00",
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_activity_type_id_idx` (`activity_type_id` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_activities_activity_type_id`
    FOREIGN KEY (`activity_type_id`)
    REFERENCES `warehouse`.`activity_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activities_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `warehouse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
