INSERT INTO roles (id, name, slug)
VALUES (1, 'Admin', 'roles.admin'),
       (2, 'Operator', 'roles.operator');

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `role_id`, `sex`, `created_at`,
                     `updated_at`, `created_by`, `updated_by`)
VALUES (1, 'admin', '$2a$10$BYvTmmXOu1QbbGIbZB/DEeXTIsGdD/1s7w.dk0tklmrcNS1BPRJ8q', 'Admin', '', 1, 1,
        '2021-11-23 00:00:00', '2021-11-23 00:00:00', 1, 1),
       (2, 'operator', '$2a$10$U9fJx0VGX8kGcAqUD3Lrn.GDCNom/FbjgGBUtCPbXmnl0.UF2K.Ju', 'Operator', '', 2, 1,
        '2021-11-23 00:00:00', '2021-11-23 00:00:00', 1, 1);

INSERT INTO `suppliers` (`id`, `name`)
VALUES (1, 'Asus'),
       (2, 'Nvidia'),
       (3, 'Zaharni Zavodi'),
       (4, 'Eko mes'),
       (5, 'Devin'),
       (6, 'Bankiq'),
       (7, 'Intel'),
       (8, 'AMD'),
       (9, 'Svoge'),
       (10, 'Milka');

INSERT INTO `clients` (`id`, `name`)
VALUES (1, 'Apple'),
       (2, 'Ivan'),
       (3, 'Google'),
       (4, 'MyMarket'),
       (5, 'Lidl'),
       (6, 'Kaufland'),
       (7, 'Ardes'),
       (8, 'Ozone'),
       (9, 'CBA'),
       (10, 'TU VARNA');

INSERT INTO `cash_registers` (`id`, `user_id`, `balance`)
VALUES (1, 2, 1432),
       (2, 2, 3542);


INSERT INTO `transaction_types` (`id`, `name`, `slug`)
VALUES (1, 'Buy', 'transaction_types.buy'),
       (2, 'Sell', 'transaction_types.sell');

INSERT INTO `product_categories` (`id`, `name`, `slug`)
VALUES (1, 'processors', 'product_categories.processors'),
       (2, 'graphics cards', 'product_categories.graphics_cards'),
       (3, 'phones', 'product_categories.phones'),
       (4, 'chocolates', 'product_categories.chocolates'),
       (5, 'ovens', 'product_categories.ovens'),
       (6, 'fridges', 'product_categories.fridges'),
       (7, 'waters', 'product_categories.waters'),
       (8, 'motherboards', 'product_categories.motherboards'),
       (9, 'sweets', 'product_categories.sweets'),
       (10,
        'deli meats',
        'product_categories.deli_meats');

INSERT INTO `product_quantity_types` (`id`, `name`, `slug`)
VALUES (1, 'kg', 'product_quantity_types.kilograms'),
       (2, 't', 'product_quantity_types.tones'),
       (3, 'l', 'product_quantity_types.liters'),
       (4, 'pcs.', 'product_quantity_types.pieces');

INSERT INTO `activity_types` (`id`, `name`, `slug`)
VALUES (1, 'Create user', 'activity_types.cretae_user'),
       (2, 'Update user', 'activity_types.update_user'),
       (3, 'Create client', 'activity_types.create_client'),
       (4, 'Update client', 'activity_types.update_client'),
       (5, 'Sell stock', 'activity_types.sell_stock'),
       (6, 'Buy stock', 'activity_types.buy_stock'),
       (7, 'Create cash register', 'activity_types.create_cash_register');
