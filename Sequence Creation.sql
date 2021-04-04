--WHAT SEQUENCES DO WE NEED 
--1.CUTOMER ID
--2. ORDER ID
--3.SHOPPING CART ID
--4. BOOK ID
--5.AUTHOR ID
--6. PUBLISHER ID

--CUSTOMER ID
create sequence cust_id_seq
start with 1
increment by 1
maxvalue 1000
nocycle 
nocache;

--ORDER ID
create sequence od_id_seq
start with 1
increment by 1
maxvalue 1000
nocycle 
nocache;

--SHOPPING CART ID
create sequence shop_cart_id_seq
start with 1
increment by 1
maxvalue 1000
nocycle 
nocache;

--BOOK ID
create sequence book_id_seq
start with 1
increment by 1
maxvalue 1000
nocycle 
nocache;

--AUTHOR ID
create sequence auth_id_seq
start with 1
increment by 1
maxvalue 1000
nocycle 
nocache;

--PUBLISHER ID
create sequence pub_id_seq
start with 1
increment by 1
maxvalue 1000
nocycle 
nocache;



