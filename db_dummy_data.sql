INSERT INTO roles (id, name, slug)
VALUES (1, 'Admin', 'roles.admin'),
       (2, 'Operator', 'roles.operator');

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `role_id`, `sex`, `created_at`,
                     `updated_at`, `created_by`, `updated_by`)
VALUES (1, 'admin', '$2a$10$BYvTmmXOu1QbbGIbZB/DEeXTIsGdD/1s7w.dk0tklmrcNS1BPRJ8q', 'Admin', '', 1, 1,
        '2021-11-23 00:00:00', '2021-11-23 00:00:00', 1, 1),/*PASSWORD: admin*/
       (2, 'operator', '$2a$10$U9fJx0VGX8kGcAqUD3Lrn.GDCNom/FbjgGBUtCPbXmnl0.UF2K.Ju', 'Operator', '', 2, 1,
        '2021-11-23 00:00:00', '2021-11-23 00:00:00', 1, 1),/*PASSWORD: operator*/
       (3, 'deni', '$2a$10$.Hto2dHDYrbvBAYnFM/U7ujAqRhlcwwii9968zDDCWOpTpVpnwqva', 'Denis', 'Georgiev', 2, 1,
        '2021-11-25 00:00:00', '2021-11-25 00:00:00', 1, 1),/*PASSWORD: 74826549*/
       (4, 'mitko', '$2a$10$.M5FiUCLqpQu9XfSQLZxPeLpI8GFNO.AB2PrqaqPgze0J5feVOsae', 'Dimitur', 'Petrov', 2, 1,
        '2021-11-25 00:00:00', '2021-11-25 00:00:00', 1, 1),/*PASSWORD: 64016271*/
       (5, 'ani007', '$2a$10$QCJD0q6thij2bApuCh2acOBKyW29zz9sZMmLrK8OoAFTdmWWMr29y', 'Ana', 'Ivanova', 2, 2,
        '2021-11-25 00:00:00', '2021-11-25 00:00:00', 1, 1),/*PASSWORD: 84562717*/
       (6, 'mari97', '$2a$10$V04KtvY0WzAB1eMBWlvpGeG/Loj7affHeLKAxVVmkUShewy9dkqHu', 'Maria', 'Dimitrova', 2, 2,
        '2021-11-25 00:00:00', '2021-11-25 00:00:00', 1, 1);/*PASSWORD: 74526172*/


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
       (10, 'deli meats', 'product_categories.deli_meats');

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

INSERT INTO `permissions` (`id`, `name`, `slug`)
VALUES (1, 'Create user', 'permissions.users.create'),
       (2, 'Edit user', 'permissions.users.edit'),
       (3, 'List users', 'permissions.users.index'),
       (4, 'Delete user', 'permissions.users.delete'),
       (5, 'Create client', 'permissions.clients.create'),
       (6, 'Edit client', 'permissions.clients.edit'),
       (7, 'List clients', 'permissions.clients.index'),
       (8, 'Delete client', 'permissions.clients.delete'),
       (9, 'Create supplier', 'permissions.suppliers.create'),
       (10, 'Edit supplier', 'permissions.suppliers.edit'),
       (11, 'List suppliers', 'permissions.suppliers.index'),
       (12, 'Delete supplier', 'permissions.suppliers.delete'),
       (13, 'Create cash register', 'permissions.cash-registers.create'),
       (14, 'Edit cash register', 'permissions.cash-registers.edit'),
       (15, 'List cash registers', 'permissions.cash-registers.index'),
       (16, 'Delete cash register', 'permissions.cash-registers.delete'),
       (17, 'Create transaction', 'permissions.transaction.create'),
       (18, 'Edit transaction', 'permissions.transaction.edit'),
       (19, 'List transactions', 'permissions.transaction.index'),
       (20, 'Delete transaction', 'permissions.transaction.delete'),
       (21, 'Create rooms', 'permissions.rooms.create'),
       (22, 'Edit rooms', 'permissions.rooms.edit'),
       (23, 'List rooms', 'permissions.rooms.index'),
       (24, 'Delete rooms', 'permissions.rooms.delete'),
       (25, 'Create shelf', 'permissions.shelves.create'),
       (26, 'Edit shelf', 'permissions.shelves.edit'),
       (27, 'List shelves', 'permissions.shelves.index'),
       (28, 'Delete shelf', 'permissions.shelves.delete'),
       (29, 'Create product', 'permissions.products.create'),
       (30, 'Edit product', 'permissions.products.edit'),
       (31, 'List products', 'permissions.products.index'),
       (32, 'Delete product', 'permissions.products.delete');

INSERT INTO `role_has_permissions` (`role_id`, `permission_id`)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (1, 5),
       (1, 6),
       (1, 7),
       (1, 8),
       (1, 9),
       (1, 10),
       (1, 11),
       (1, 12),
       (1, 13),
       (1, 14),
       (1, 15),
       (1, 16),
       (1, 17),
       (1, 18),
       (1, 19),
       (1, 20),
       (1, 21),
       (1, 22),
       (1, 23),
       (1, 24),
       (1, 25),
       (1, 26),
       (1, 27),
       (1, 28),
       (1, 29),
       (1, 30),
       (1, 31),
       (1, 32),
       (2, 5),
       (2, 6),
       (2, 7),
       (2, 8),
       (2, 9),
       (2, 10),
       (2, 11),
       (2, 12),
       (2, 13),
       (2, 14),
       (2, 15),
       (2, 16),
       (2, 17),
       (2, 18),
       (2, 19),
       (2, 20),
       (2, 21),
       (2, 22),
       (2, 23),
       (2, 24),
       (2, 25),
       (2, 26),
       (2, 27),
       (2, 28),
       (2, 29),
       (2, 30),
       (2, 31),
       (2, 32);

INSERT INTO `rooms` (`id`, `name`)
VALUES (1, 'Meats'),
       (2, 'Hardware'),
       (3, 'Beverages'),
       (4, 'Sweets'),
       (5, 'Phones'),
       (6, 'Major Appliances');

INSERT INTO `shelves` (`id`, `name`, `room_id`)
VALUES (1, 'A1', 1),
       (2, 'B1', 1),
       (3, 'A1', 2),
       (4, 'B1', 2),
       (5, 'A1', 3),
       (6, 'B1', 3),
       (7, 'A1', 4),
       (8, 'B1', 4),
       (9, 'A1', 5),
       (10, 'B1', 5),
       (11, 'A1', 6),
       (12, 'B1', 6),
       (13, 'A2', 1),
       (14, 'B2', 1),
       (15, 'A2', 2),
       (16, 'B2', 2),
       (17, 'A2', 3),
       (18, 'B2', 3),
       (19, 'A2', 4),
       (20, 'B2', 4),
       (21, 'A2', 5),
       (22, 'B2', 5),
       (23, 'A2', 6),
       (24, 'B2', 6);

INSERT INTO `addresses` (`id`, `address`)
VALUES (1, 'ul.Studentska 1 9010 Varna');

INSERT INTO `companies` (`id`, `name`, `address_id`, `bulstat`, `dds_number`, `mol`)
VALUES (1, 'CELLA', 1, '4813573204', 'BG84124589', 'Mihail Georgiev');