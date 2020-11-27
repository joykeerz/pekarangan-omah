CREATE TABLE `detail_order` (
	`detail_order_id` INT(10) NOT NULL AUTO_INCREMENT,
	`menu_id` INT(10) NOT NULL,
	`subtotal` INT(10) NOT NULL,
	`jumlah_makanan` INT(10) NOT NULL,
	PRIMARY KEY (`detail_order_id`)
);

CREATE TABLE `menu` (
	`menu_id` INT(10) NOT NULL AUTO_INCREMENT,
	`nama_menu` varchar(255) NOT NULL,
	`jenis` varchar(255) NOT NULL,
	`harga_jual` FLOAT(255) NOT NULL,
	`harga_modal` FLOAT(255) NOT NULL,
	`stok` INT(10) NOT NULL,
	PRIMARY KEY (`menu_id`)
);

CREATE TABLE `user` (
	`user_id` INT(10) NOT NULL AUTO_INCREMENT,
	`username` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`user_roles` varchar(255) NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `stok_bahan` (
	`bahan_id` INT(10) NOT NULL AUTO_INCREMENT,
	`nama_bahan` varchar(255) NOT NULL AUTO_INCREMENT,
	`stok` INT(10) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`bahan_id`)
);

CREATE TABLE `pelanggan` (
	`pelanggan_id` INT(10) NOT NULL AUTO_INCREMENT,
	`meja` varchar(25) NOT NULL,
	PRIMARY KEY (`pelanggan_id`)
);

CREATE TABLE `meja` (
	`meja_id` INT(10) NOT NULL AUTO_INCREMENT,
	`status` BOOLEAN(10) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`meja_id`)
);

CREATE TABLE `transaksi` (
	`transaksi_id` INT(10) NOT NULL AUTO_INCREMENT,
	`user_id` INT(10) NOT NULL,
	`pelanggan_id` INT(10) NOT NULL,
	`detail_order_id` INT(10) NOT NULL,
	`total` INT(10) NOT NULL,
	`meja_id` INT(10) NOT NULL,
	PRIMARY KEY (`transaksi_id`)
);

ALTER TABLE `detail_order` ADD CONSTRAINT `detail_order_fk0` FOREIGN KEY (`menu_id`) REFERENCES `menu`(`menu_id`);

ALTER TABLE `transaksi` ADD CONSTRAINT `transaksi_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `transaksi` ADD CONSTRAINT `transaksi_fk1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan`(`pelanggan_id`);

ALTER TABLE `transaksi` ADD CONSTRAINT `transaksi_fk2` FOREIGN KEY (`detail_order_id`) REFERENCES `detail_order`(`detail_order_id`);

ALTER TABLE `transaksi` ADD CONSTRAINT `transaksi_fk3` FOREIGN KEY (`meja_id`) REFERENCES `meja`(`meja_id`);

