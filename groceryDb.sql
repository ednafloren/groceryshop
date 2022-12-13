CREATE DATABASE groceryShopDb;
CREATE TABLE groceryShops(id int primary key,name varchar(200) not null);
CREATE TABLE USERS (id int primary key AUTO_INCREMENT,type varchar(200) not null),
name varchar(200) NOT NULL,contact int NOT NULL UNIQUE);
CREATE TABLE customers(id int primary key,email varchar(200) not null unique,
location varchar(200) not null,gid int,FOREIGN KEY(gid) REFERENCES groceryshops(id),
password varchar(10) unique not null,userId int not null,
FOREIGN KEY(userId) REFERENCES users(id));
CREATE TABLE admin(id int primary key,gid int,FOREIGN KEY(gid) REFERENCES groceryshops(id),userId int not null,
FOREIGN KEY(userId) REFERENCES users(id),shift varchar(25) not null);
CREATE TABLE deliverymen(id int primary key,name varchar(100) not null,contact int not null unique); 
CREATE TABLE vendors(id int primary key,businessName varchar(100) not null unique, gid int not null,
userId int not null);
CREATE TABLE categories(id int primary key,name varchar(200) not null);
CREATE TABLE products(id int PRIMARY key,name varchar(200) not null,price decimal not null,
description varchar(200) not null,image varchar(100) unique,listId int,catId int not null,groceryId int not null,postedBy int not null,FOREIGN KEY(posterId) REFERENCES users(id),FOREIGN KEY(groceryId) REFERENCES groceryshops(id),FOREIGN KEY(listId) REFERENCES wishlist(id),FOREIGN KEY(catId) REFERENCES categories(id));

--
CREATE table wishlist(id int primary key,name varchar(200) not null,
customerId int not null, FOREIGN KEY (customerId) REFERENCES customers(id));


FOREIGN KEY(vendorId) REFERENCES vendors(id),FOREIGN KEY(orderId) REFERENCES orders(id));
delivererId int not null,adminId int not null,productId int not null,FOREIGN KEY(delivererId) REFERENCES deliverymen(id),FOREIGN KEY(productId) REFERENCES products(id),FOREIGN KEY(adminId) REFERENCES admin(id),FOREIGN KEY(customerId) REFERENCES customers(id));
CREATE TABLE orders(id int PRIMARY key,isconfirmed boolean DEFAULT 0 not null, quantity varchar(200) not null,customerId int not null,customerId int not null,adminId int not null,
delivererId int not null,adminId int not null,FOREIGN KEY(delivererId) REFERENCES deliverymen(id),FOREIGN KEY(productId) REFERENCES products(id),FOREIGN KEY(adminId) REFERENCES admin(id),FOREIGN KEY(customerId) REFERENCES customers(id));
CREATE TABLE requests(id int PRIMARY key,vendorId int not null,orderId int not null,

CREATE TABLE payments(id int PRIMARY key AUTO_INCREMENT,amount int not null,customerId int not null,adminId int not null,orderId int not null,FOREIGN KEY(customerId) REFERENCES customers(id),FOREIGN KEY(orderId) REFERENCES orders(id),FOREIGN KEY(adminId) REFERENCES admin(id));


--INSERTING DATA INTO TABLES
insert into groceryshops(id,name) values(1,'new city gocery');
INSERT INTO users(id, type, name,contact) 
VALUES ('admin', 'KATO JOHN', '700845637'), 
( 'admin', 'MUKIIBI MARTIN', '798574647'),
 ( 'vendor', 'MUTYABA LUKE', '789563737'),
  ( 'vendor', 'KAWESA MARK', '786456732'), 
  ('vendor', 'KASUJJA DANIEL', '796543345'),
   ('customer', 'NAKATO MARIA', '786543223'),
    ('customer', 'NAMUKASA JOAN', '786532323'),
     ('customer', 'NAMBOGO FAITH', '798654321')
     , ('customer', 'NABUKENYA ROSE', '789634373'), 
     ('customer', 'MUBIRU JOHN', '705473453'), 
     ('customer', 'MUKASA SAM', '789654444'),
      ('customer', 'KATENDE GRACE', '704545460'),
       ('customer', 'NAMULI VANESA', '786594541');
       insert into admin (id,gid,userId,shift) VALUES(1,1,1,'morning'), (2,1,2,'evening');
       INSERt into customers(id,email,location,gid,password,userId) values(1,'gdrej@gmail.com','kampala',1,'peyer123',6),
       (2,'dreeiw@gmail.com','makindye',1,'etwfs567',7),(3,'diejdg@gmail.com','kawempe',1,"79534er",8),
       (4,'ietrff@gmail.com','kamwokya',1,'geidt675',9),(5,'dahey@gmail.com','masaka',1,'eryscs2',10),(
        6,'therw@gmail.com','banda',1,'786tryuf',11),
       (7,'piwuwb@gmail.com','kireka',1,'8365rtee',12),(8,'tudoisgg@gmail.com','makerere',1,'76543wr',13);
INSERT INTO vendors (id, gid, userId, businessName) VALUES ('1', '1', '3', 'real investments'), ('2', '1', '4', 'my snacks company'), ('3', '1', '5', 's and u company')
INSERT INTO deliverymen (id, name,contact) VALUES ('1', 'SEMAKULA BAKER', '708967654'), ('2', 'MATOVU SAM', '797654312'), ('3', 'SONKO MARTIN', '765434312')

INSERT INTO categories (id,name) VALUES ('1', 'fruits'), ('2', 'snacks'), ('3', 'meat'), ('4', 'drinks')

       INSERT INTO products (`id`, `name`, `price`, `description`, `image`, `listId`, `catId`, `groceryId`, `postedBy`) 
       ALUES ('1', 'apple', '1000', 'I can red or green', NULL, 
       '2', '1', '1', '1'), ('2', 'cake', '40000', 'brown color', 
       NULL, '1', '2', '1', '4'), ('3', 'banana', '1000', 'Yellow banana', NULL, '6', '1', '1', '1'), 
       ('4', 'Juice', '5000', 'orange juice', NULL, '1', '4', '1', '2'), 
       ('5', 'beef', '30000', 'Fresh red meat', NULL, '5', '3', '1', '1'), 
       ('6', 'groundnuts', '1000', 'Salted', NULL, '4', '2', '1', '2'),
        ('7', 'soda', '3000', 'fruity', NULL, '2', '4', '1', '2'),
         ('8', 'Avocado', '1000', 'Ready to eat', NULL, '4', '1', '1', '3'), 
         ('9', 'cabbage', '2000', 'Green and maroon', NULL, '4', '1', '1', '2'), 
         ('10', 'pizza', '50000', 'chicken,beef', NULL, '6', '2', '1', '5');
         INSERT INTO `wishlist` (`id`, `name`, `customerId`) VALUES ('1', 'mylist', '1'), ('2', 'list1', '2'), ('3', 'list2', '3'), ('4', 'mywishlist', '4'), ('5', 'favourites', '5'), ('6', 'list4', '5')

         
INSERT INTO requests (`id`, `vendorId`, `orderId`) VALUES ('20', '1', '126'), ('21', '2', '126');
INSERT INTO orders (`id`, `productId`, `quantity`, `isconfirmed`, `orderDate`, `customerId`, `adminId`, `delivererId`)
VALUES ('123', '1', '10', '1', '2022-12-12', '1', '1', '1'), 
('124', '5', '5kg', '1', '2022-12-01', '6', '2', '3'), 
('125', '7', '10 bottles', '1', '2022-11-07', '3', '1', '1'),
 ('126', '8', '5', '1', '2022-10-04', '7', '2', '3'),
 ('127', '6', '5', '1', '2022-10-03', '6', '1', '3');
INSERT INTO cakes (`id`, `name`, `price`, `image`, `category`, `description`, `receipes`, `productId`) 
VALUES ('1', 'round cake', '40000', ' ', 'birthday cake', 'Has different colors.', 'Flour,milk,sugar', '2'),
 ('2', 'queen and king', '150000', "", 'wedding cake', 'COLOR BLUE', 'Flour,milk,sugar', '2');
INSERT INTO payments (id, amount, customerId, adminId, orderId) VALUES (NULL, '3000', '1', '1', '123'), (NULL, '100000', '6', '2', '124'), (NULL, '70000', '7', '2', '126'), (NULL, '60000', '6', '1', '127')

--ii
select id,productId,quantity from orders

--iii
SELECT name from products where postedBy=1 and 2;
--iv
SELECT name,id FROM products WHERE postedBy IN(3,4,5);

--V
SELECT * FROM users;
--vi
SELECT * FROM users WHERE type='vendor';
--vii
SELECT * FROM users WHERE type IN('admin','customer');



I

