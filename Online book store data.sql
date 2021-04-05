--DATA INSERTION----5 ROWS EACH 

--TEMPORARILY DISABLING THE FOREIGN KEYS
alter table books disable constraint BK_PUB_ID_FK; 
alter table books disable constraint BK_A_ID_FK;
alter table credit_card_details disable constraint CCD_C_ID_FK;
alter table order_details disable constraint OD_ST_FK;
alter table order_details disable constraint OD_SC_ID_FK;
alter table order_details disable constraint OD_C_ID_FK;
alter table shopping_cart disable constraint SC_BK_ID_FK;

--INSERING DATA

--CUSTOMER
insert into customer(customer_id,customer_name,street_address,city,zip,state,email_address,phone_number)
values('c'||to_char(cust_id_seq.nextval,'fm0999'),'David','jamir Lane','Mangalore',580254,'BN','david@oracle.com',8457692461);
insert into customer(customer_id,customer_name,street_address,city,zip,state,email_address,phone_number)
values('c'||to_char(cust_id_seq.nextval,'fm0999'),'Ramanuj','jamir Lane','Mangalore',580254,'BN','ramanuj@oracle.com',7894563271);
insert into customer(customer_id,customer_name,street_address,city,zip,state,email_address,phone_number)
values('c'||to_char(cust_id_seq.nextval,'fm0999'),'venkatesh','ho chin minh','Jp nagar',580254,'BN','venky@oracle.com',5412975236);
insert into customer(customer_id,customer_name,street_address,city,zip,state,email_address,phone_number)
values('c'||to_char(cust_id_seq.nextval,'fm0999'),'subramanian','paratha gali','whitefield',580254,'BN','subram@oracle.com',4536578925);
insert into customer(customer_id,customer_name,street_address,city,zip,state,email_address,phone_number)
values('c'||to_char(cust_id_seq.nextval,'fm0999'),'vikram','khaogali','whitefield',580254,'BN','vikram@oracle.com',1453698258);


--CREDIT CARD DETAILS
insert into credit_card_details(credit_card_number,credit_card_type,customer_id,expiry_date)
values(6547981236453287,'Maestro',(select customer_id from customer where customer_name='David'),'10-12-2025');
insert into credit_card_details(credit_card_number,credit_card_type,customer_id,expiry_date)
values(7895314521795463,'Maestro',(select customer_id from customer where customer_name='Ramanuj'),'01-11-2026');
insert into credit_card_details(credit_card_number,credit_card_type,customer_id,expiry_date)
values(6847925814236541,'Maestro',(select customer_id from customer where customer_name='venkatesh'),'12-12-2025');
insert into credit_card_details(credit_card_number,credit_card_type,customer_id,expiry_date)
values(4236152819743652,'Maestro',(select customer_id from customer where customer_name='subramanian'),'20-12-2021');
insert into credit_card_details(credit_card_number,credit_card_type,customer_id,expiry_date)
values(2459736814563871,'Maestro',(select customer_id from customer where customer_name='vikram'),'31-12-2030');


--AUTHOR
insert into author(author_id,author_name)
values('A'||to_char(auth_id_seq.nextval,'fm0999'),'Chetan Bhagat');
insert into author(author_id,author_name)
values('A'||to_char(auth_id_seq.nextval,'fm0999'),'Jerome');
insert into author(author_id,author_name)
values('A'||to_char(auth_id_seq.nextval,'fm0999'),'Nancy ');
insert into author(author_id,author_name)
values('A'||to_char(auth_id_seq.nextval,'fm0999'),'Krishnamurthy');
insert into author(author_id,author_name)
values('A'||to_char(auth_id_seq.nextval,'fm0999'),'Salvador');


--PUBLISHER
insert into publisher(publisher_id,publisher_name)
values('P'||to_char(pub_id_seq.nextval,'fm0999'),'PENGUIN PUBLISHERS');
insert into publisher(publisher_id,publisher_name)
values('P'||to_char(pub_id_seq.nextval,'fm0999'),'WB PUBLISHERS');
insert into publisher(publisher_id,publisher_name)
values('P'||to_char(pub_id_seq.nextval,'fm0999'),'LAYMAN PUBLISHERS');
insert into publisher(publisher_id,publisher_name)
values('P'||to_char(pub_id_seq.nextval,'fm0999'),'DEAD PUBLISHERS');
insert into publisher(publisher_id,publisher_name)
values('P'||to_char(pub_id_seq.nextval,'fm0999'),'ROCKSTAR PUBLISHERS');


--SHIPPING TYPE
insert into shipping_type(shipping_type,shipping_price)
values('COD',246.54);
insert into shipping_type(shipping_type,shipping_price)
values('CARD',659.99);
insert into shipping_type(shipping_type,shipping_price)
values('COD',1578.92);
insert into shipping_type(shipping_type,shipping_price)
values('UPI',789.52);
insert into shipping_type(shipping_type,shipping_price)
values('PAYTM',123.56);
insert into shipping_type(shipping_type,shipping_price)
values('IMPS',1578.92);


--BOOKS
insert into books(book_id,book_name,author_id,price,publisher_id)
values('BK'||to_char(book_id_seq.nextval,'fm0999'),
'Musings and More',
(select author_id from author where author_name='Chetan Bhagat'),
(select ROUND(shipping_price*80/100) from shipping_type where shipping_type='COD'),
(select publisher_id from publisher where publisher_name='PENGUIN PUBLISHERS'));

insert into books(book_id,book_name,author_id,price,publisher_id)
values('BK'||to_char(book_id_seq.nextval,'fm0999'),
'Akbar and Birbal',
(select author_id from author where author_name='Nancy'),
(select ROUND(shipping_price*80/100) from shipping_type where shipping_type='COD'),
(select publisher_id from publisher where publisher_name='LAYMAN PUBLISHERS'));

insert into books(book_id,book_name,author_id,price,publisher_id)
values('BK'||to_char(book_id_seq.nextval,'fm0999'),
'Two States',
(select author_id from author where author_name='Chetan Bhagat'),
(select ROUND(shipping_price*80/100) from shipping_type where shipping_type='CARD'),
(select publisher_id from publisher where publisher_name='PENGUIN PUBLISHERS'));

insert into books(book_id,book_name,author_id,price,publisher_id)
values('BK'||to_char(book_id_seq.nextval,'fm0999'),
'3 Men in a Boat',
(select author_id from author where author_name='Chetan Bhagat'),
(select ROUND(shipping_price*80/100) from shipping_type where shipping_type='IMPS'),
(select publisher_id from publisher where publisher_name='PENGUIN PUBLISHERS'));

insert into books(book_id,book_name,author_id,price,publisher_id)
values('BK'||to_char(book_id_seq.nextval,'fm0999'),
'Pirates',
(select author_id from author where author_name='Salvador'),
(select ROUND(shipping_price*80/100) from shipping_type where shipping_type='IMPS'),
(select publisher_id from publisher where publisher_name='DEAD PUBLISHERS'));


--SHOPPING CART
insert into shopping_cart(shopping_cart_id,book_id,price,shoping_date,quantity)
values(shop_cart_id_seq.nextval,(select book_id from books where book_name='Pirates'),
(select price *2 from books where book_name='Pirates'),'12-02-2019',2);

insert into shopping_cart(shopping_cart_id,book_id,price,shoping_date,quantity)
values(shop_cart_id_seq.nextval,(select book_id from books where book_name='Pirates'),
(select price *3 from books where book_name='3 Men in a Boat'),'14-02-2019',3);

insert into shopping_cart(shopping_cart_id,book_id,price,shoping_date,quantity)
values(shop_cart_id_seq.nextval,(select book_id from books where book_name='Pirates'),
(select price *3 from books where book_name='Musings and More'),'18-02-2019',3);

insert into shopping_cart(shopping_cart_id,book_id,price,shoping_date,quantity)
values(shop_cart_id_seq.nextval,(select book_id from books where book_name='Pirates'),
(select price *4 from books where book_name='Two States'),'15-02-2019',4);

insert into shopping_cart(shopping_cart_id,book_id,price,shoping_date,quantity)
values(shop_cart_id_seq.nextval,(select book_id from books where book_name='Pirates'),
(select price *2 from books where book_name='Musings and More'),'20-02-2019',2);

--ORDER DETAILS
insert into order_details(order_id,customer_id,shipping_type,date_of_purchase,shopping_cart_id)
values('O'||to_char(od_id_seq.nextval,'fm0999'),
(select customer_id from customer where customer_name='David'),
'COD',(select shoping_date from shopping_cart where price='2526'),
(select shopping_cart_id from shopping_cart where price='2526'));

insert into order_details(order_id,customer_id,shipping_type,date_of_purchase,shopping_cart_id)
values('O'||to_char(od_id_seq.nextval,'fm0999'),
(select customer_id from customer where customer_name='venkatesh'),
'COD',(select shoping_date from shopping_cart where price='2526'),
(select shopping_cart_id from shopping_cart where price='2526'));

insert into order_details(order_id,customer_id,shipping_type,date_of_purchase,shopping_cart_id)
values('O'||to_char(od_id_seq.nextval,'fm0999'),
(select customer_id from customer where customer_name='vikram'),
'IMPS',(select shoping_date from shopping_cart where price='594'),
(select shopping_cart_id from shopping_cart where price='594'));

insert into order_details(order_id,customer_id,shipping_type,date_of_purchase,shopping_cart_id)
values('O'||to_char(od_id_seq.nextval,'fm0999'),
(select customer_id from customer where customer_name='Ramanuj'),
'CARD',(select shoping_date from shopping_cart where price='3789'),
(select shopping_cart_id from shopping_cart where price='3789'));

insert into order_details(order_id,customer_id,shipping_type,date_of_purchase,shopping_cart_id)
values('O'||to_char(od_id_seq.nextval,'fm0999'),
(select customer_id from customer where customer_name='Ramanuj'),
'IMPS',(select shoping_date from shopping_cart where price='2112'),
(select shopping_cart_id from shopping_cart where price='2112'));


--PURCHASE HISTORY
insert into purchase_history(customer_id,order_id)
values((select customer_id from customer where customer_name='David' ),(select order_id from order_details where date_of_purchase='12-02-2019'));
insert into purchase_history(customer_id,order_id)
values((select customer_id from customer where customer_name='Vikram' ),(select order_id from order_details where date_of_purchase='14-02-2019'));
insert into purchase_history(customer_id,order_id)
values((select customer_id from customer where customer_name='Subramanian' ),(select order_id from order_details where date_of_purchase='18-02-2019'));
insert into purchase_history(customer_id,order_id)
values((select customer_id from customer where customer_name='Vikram' ),(select order_id from order_details where date_of_purchase='15-02-2019'));
insert into purchase_history(customer_id,order_id)
values((select customer_id from customer where customer_name='David' ),(select order_id from order_details where date_of_purchase='20-02-2019'));

COMMIT;

--RE-ENABLING FOREIGN KEYS
alter table books enable constraint BK_PUB_ID_FK; 
alter table books enable constraint BK_A_ID_FK;
alter table credit_card_details enable constraint CCD_C_ID_FK;
alter table order_details enable constraint OD_ST_FK;
alter table order_details enable constraint OD_SC_ID_FK;
alter table order_details enable constraint OD_C_ID_FK;
alter table shopping_cart enable constraint SC_BK_ID_FK;

COMMIT;