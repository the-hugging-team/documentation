-- MySQL Script generated by MySQL Workbench
-- Sat Dec 11 14:42:18 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cella
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cella` ;

-- -----------------------------------------------------
-- Schema cella
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cella` DEFAULT CHARACTER SET utf8 ;
USE `cella` ;

-- -----------------------------------------------------
-- Table `cella`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`roles` ;

CREATE TABLE IF NOT EXISTS `cella`.`roles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`users` ;

CREATE TABLE IF NOT EXISTS `cella`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  `sex` INT NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL,
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
    REFERENCES `cella`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_updated_by`
    FOREIGN KEY (`updated_by`)
    REFERENCES `cella`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `cella`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`permissions` ;

CREATE TABLE IF NOT EXISTS `cella`.`permissions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`role_has_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`role_has_permissions` ;

CREATE TABLE IF NOT EXISTS `cella`.`role_has_permissions` (
  `role_id` INT UNSIGNED NOT NULL,
  `permission_id` INT UNSIGNED NOT NULL,
  INDEX `fk_role_id_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_permission_id_idx` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `fk_role_has_permissions_role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `cella`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_has_permissions_permission_id`
    FOREIGN KEY (`permission_id`)
    REFERENCES `cella`.`permissions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`product_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`product_categories` ;

CREATE TABLE IF NOT EXISTS `cella`.`product_categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`rooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`rooms` ;

CREATE TABLE IF NOT EXISTS `cella`.`rooms` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`shelves`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`shelves` ;

CREATE TABLE IF NOT EXISTS `cella`.`shelves` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `room_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `idx_shelves_room_id` (`room_id` ASC) INVISIBLE,
  CONSTRAINT `fk_shelves_room_id`
    FOREIGN KEY (`room_id`)
    REFERENCES `cella`.`rooms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`product_quantity_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`product_quantity_types` ;

CREATE TABLE IF NOT EXISTS `cella`.`product_quantity_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`products` ;

CREATE TABLE IF NOT EXISTS `cella`.`products` (
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
    REFERENCES `cella`.`product_categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_shelf_id`
    FOREIGN KEY (`shelf_id`)
    REFERENCES `cella`.`shelves` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_product_quantity_type_id`
    FOREIGN KEY (`product_quantity_type_id`)
    REFERENCES `cella`.`product_quantity_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`addresses` ;

CREATE TABLE IF NOT EXISTS `cella`.`addresses` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`companies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`companies` ;

CREATE TABLE IF NOT EXISTS `cella`.`companies` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `address_id` INT UNSIGNED NOT NULL,
  `bulstat` VARCHAR(13) NOT NULL,
  `dds_number` VARCHAR(15) NOT NULL,
  `mol` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_companies_address_id_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_companies_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `cella`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`invoices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`invoices` ;

CREATE TABLE IF NOT EXISTS `cella`.`invoices` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` INT UNSIGNED NOT NULL,
  `base_price` DOUBLE UNSIGNED NOT NULL DEFAULT 0.00,
  `dds` DOUBLE UNSIGNED NOT NULL DEFAULT 0.00,
  `total_price` DOUBLE NOT NULL DEFAULT 0.00,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_created_by_idx` (`created_by` ASC) VISIBLE,
  INDEX `fk_invoices_company_id_idx` (`company_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `cella`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `cella`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`deliveries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`deliveries` ;

CREATE TABLE IF NOT EXISTS `cella`.`deliveries` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL,
  `created_by` INT UNSIGNED NOT NULL,
  `updated_by` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_created_by_idx` (`created_by` ASC) VISIBLE,
  INDEX `fk_updated_by_idx` (`updated_by` ASC) VISIBLE,
  INDEX `fk_deliveries_invoice_id_idx` (`invoice_id` ASC) VISIBLE,
  CONSTRAINT `fk_deliveries_created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `cella`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deliveries_updated_by`
    FOREIGN KEY (`updated_by`)
    REFERENCES `cella`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deliveries_invoice_id`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `cella`.`invoices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`delivery_has_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`delivery_has_products` ;

CREATE TABLE IF NOT EXISTS `cella`.`delivery_has_products` (
  `delivery_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` DOUBLE NOT NULL DEFAULT 0.00,
  `product_quantity_type_id` INT UNSIGNED NOT NULL,
  INDEX `fk_delivery_id_idx` (`delivery_id` ASC) VISIBLE,
  INDEX `fk_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_product_quantity_type_id_idx` (`product_quantity_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_has_products_delivery_id`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `cella`.`deliveries` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_has_products_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `cella`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_has_products_product_quantity_type_id`
    FOREIGN KEY (`product_quantity_type_id`)
    REFERENCES `cella`.`product_quantity_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`cash_registers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`cash_registers` ;

CREATE TABLE IF NOT EXISTS `cella`.`cash_registers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `balance` DOUBLE UNSIGNED NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_cash_registers_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `cella`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`sales` ;

CREATE TABLE IF NOT EXISTS `cella`.`sales` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` INT UNSIGNED NULL DEFAULT NULL,
  `cash_register_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cash_register_id_idx` (`cash_register_id` ASC) VISIBLE,
  INDEX `fk_created_by_idx` (`created_by` ASC) VISIBLE,
  INDEX `fk_sales_invoice_id_idx` (`invoice_id` ASC) VISIBLE,
  CONSTRAINT `fk_sales_cash_register_id`
    FOREIGN KEY (`cash_register_id`)
    REFERENCES `cella`.`cash_registers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `cella`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_invoice_id`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `cella`.`invoices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`sales_has_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`sales_has_products` ;

CREATE TABLE IF NOT EXISTS `cella`.`sales_has_products` (
  `sale_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` DOUBLE NOT NULL DEFAULT 0.00,
  `product_quantity_type_id` INT UNSIGNED NOT NULL,
  INDEX `fk_sale_id_idx` (`sale_id` ASC) VISIBLE,
  INDEX `fk_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_product_quantity_type_id_idx` (`product_quantity_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_sales_has_products_sale_id`
    FOREIGN KEY (`sale_id`)
    REFERENCES `cella`.`sales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_has_products_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `cella`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_has_products_product_quantity_type_id`
    FOREIGN KEY (`product_quantity_type_id`)
    REFERENCES `cella`.`product_quantity_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`transaction_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`transaction_types` ;

CREATE TABLE IF NOT EXISTS `cella`.`transaction_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`transactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`transactions` ;

CREATE TABLE IF NOT EXISTS `cella`.`transactions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cash_register_id` INT UNSIGNED NOT NULL,
  `transaction_type_id` INT UNSIGNED NOT NULL,
  `amount` DOUBLE UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` TIMESTAMP NOT NULL,
  `created_by` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cash_register_id_idx` (`cash_register_id` ASC) VISIBLE,
  INDEX `fk_created_by_idx` (`created_by` ASC) VISIBLE,
  INDEX `fk_transaction_type_id_idx` (`transaction_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_transactions_cash_register_id`
    FOREIGN KEY (`cash_register_id`)
    REFERENCES `cella`.`cash_registers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `cella`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_transaction_type_id`
    FOREIGN KEY (`transaction_type_id`)
    REFERENCES `cella`.`transaction_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`activity_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`activity_types` ;

CREATE TABLE IF NOT EXISTS `cella`.`activity_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cella`.`activities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cella`.`activities` ;

CREATE TABLE IF NOT EXISTS `cella`.`activities` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity_type_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_activity_type_id_idx` (`activity_type_id` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_activities_activity_type_id`
    FOREIGN KEY (`activity_type_id`)
    REFERENCES `cella`.`activity_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activities_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `cella`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
