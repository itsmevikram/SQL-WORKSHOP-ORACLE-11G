--CREATING DATABASE OBJECTS
-- AUTHOR
create table author
(
author_id varchar2(10),
author_name varchar2(20),
constraint a_id_pk primary key(author_id)
);

--PUBLISHER
create table publisher
(
publisher_id varchar2(10),
publisher_name varchar2(50),
constraint pub_id_pk primary key(publisher_id)
);

--BOOKS
create table books
(
book_id varchar2(10),
book_name varchar2(50),
author_id varchar2(10),
price number(10),
publisher_id varchar2(10),
constraint bk_id_pk primary key(book_id),
constraint bk_a_id_fk foreign key(author_id) references author(author_id) on delete cascade,
constraint bk_pub_id_fk foreign key(publisher_id) references publisher(publisher_id) on delete cascade
);

--SHIPPING TYPE
create table shipping_type
(
shipping_type varchar2(10),
shipping_price number(6),
constraint st_pk primary key(shipping_type)
);

--SHOPPING CART
create table shopping_cart
(
shopping_cart_id number(4),
book_id varchar2(10),
price number(10),
shoping_date date ,
quantity number(10),
constraint sc_id_pk primary key(shopping_cart_id),
constraint sc_bk_id_fk foreign key(book_id) references books(book_id) on delete cascade
);

--CUSTOMER
create table CUSTOMER
(
customer_id varchar2(6) not null,
customer_name varchar2(40),
Street_Address varchar2(50),
City varchar2(25),
Zip varchar2(20),
State varchar2(2),
Email_Address varchar2(50),
Phone_Number integer check(phone_number <=99999999999),
constraint c_id_pk primary key(customer_id),
constraint c_email_uk unique(Email_Address)
);

--CREDIT CARD DETAILS
create table credit_card_details
(
credit_card_number integer not null check(credit_card_number <=9999999999999999),
credit_card_type varchar2(10),
customer_id ,
expiry_date date,
constraint ccd_no_pk primary key(credit_card_number),
constraint ccd_c_id_fk foreign key(customer_id) references customer(customer_id) on delete cascade
);


--ORDER DETAILS
create table order_details
(
order_id number(6),
customer_id ,
shipping_type varchar2(10),
date_of_purchase date,
shopping_cart_id number(4),
constraint od_id_pk primary key(order_id),
constraint od_c_id_fk foreign key(customer_id) references customer(customer_id) on delete cascade,
constraint od_st_fk foreign key(shipping_type) references shipping_type(shipping_type) on delete cascade,
constraint od_sc_id_fk foreign key(shopping_cart_id) references shopping_cart(shopping_cart_id) on delete cascade
);

--PURCHASE HISTORY
create table purchase_history
(
customer_id,
order_id,
constraint ph_c_id_fk foreign key(customer_id) references customer(customer_id) on delete cascade,
constraint ph_od_id_fk foreign key(order_id) references order_details(order_id) on delete cascade
);