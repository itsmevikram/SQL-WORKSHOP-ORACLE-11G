connect sys as sysdba

/*Pop-Up for password
/*Connected*/

create user book_store identified by obs123;
/*User Created*/

/*Giving certain priveledges to user*/
grant connect to book_store;
grant create session to book_store;
grant create sequence to book_store;
grant unlimited tablespace to book_store;
grant create table to book_store;


disconnect;
