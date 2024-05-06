create database Shopee;
use Shopee;

create table user (
    id int primary key auto_increment,
    username varchar(50) not null unique,
    password varchar(100)
);

create table role (
    id int primary key auto_increment,
    name varchar(100) not null
);

create table user_role (
    id int primary key auto_increment,
    user_id int,
    role_id int,
    foreign key (user_id) references user(id),
    foreign key (role_id) references role(id)
);

create table customer (
    id int primary key auto_increment,
    name varchar(50),
    email varchar(50),
    phone_number varchar(50),
    gender boolean,
    birthDay date,
    foreign key (id) references user(id)
);

create table product (
    id int primary key auto_increment,
    name varchar(50),
    price int,
    quantity varchar(50)
);

create table customer_product (
    id int primary key auto_increment,
    customer_id int,
    product_id int,
    quantity int,
    dateBuy date,
    foreign key (customer_id) references customer(id),
    foreign key (product_id) references product(id)
);

create table comment (
    id int primary key auto_increment,
    customer_id int,
    product_id int,
    content varchar(50),
    foreign key (customer_id) references customer(id),
    foreign key (product_id) references product(id)
);

insert into comment(customer_id, product_id, content) values (1, 2, 'tốt');
insert into comment(customer_id, product_id, content) values (2, 7, 'không ổn');
insert into comment(customer_id, product_id, content) values (3, 8, 'vừa');

select cm.product_id, cm.content  from comment as cm
left join customer c on c.id = cm.customer_id
left join product p on cm.product_id = p.id
left join user u on c.id = u.id
where u.username = ?;

insert into user(username, password)
values ('admin', '$2a$12$IjmEFniZkr3iGEGust1..uOWGIklFR/ojoaYduj4D5eXZct/hf5vW'),
       ('user', '$2a$12$B6yRuqa7XIuwNlYBi220xOhyRJIYZLKvv362sm.AhFRDZ4GPJsGIO');
insert into role (id, name)
values (1, 'user'),
       (2, 'admin');
insert into user_role (user_id, role_id) values (1, 1);
insert into user_role (user_id, role_id) values (2, 2);

insert into product (name, price) values ('iphone 14', '14.500.000');
insert into product (name, price) values ('iphone 15', '20.500.000');
insert into product (name, price) values ('iphone 15 pro', '27.500.000');
insert into product (name, price) values ('iphone 14 pro', '24.500.000');

alter table product modify price int;

select name, price from product;
insert into customer_product (product_id) values (?);
select cp.product_id, p.name, p.price from product as p left join customer_product as cp on p.id = cp.id;

insert into customer(id, name) values (1, 'admin');
insert into customer(id, name) values (2, 'user');
insert into customer(id, name) values (3, 'vohuyhoang');



select cp.product_id, p.name, p.price, cp.quantity from customer_product as cp
    left join customer c on c.id = cp.customer_id
    left join product p on cp.product_id = p.id
    left join user u on c.id = u.id
    where u.username = ?;

update customer_product set quantity = quantity + ? where product_id = ? and customer_id = ?;


