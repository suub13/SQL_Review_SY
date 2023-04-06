# 230406 
create database java;
use java;

create table table1(
column1 varchar(100),
column2 varchar(100),
column3 varchar(100));

desc table1;
select * from table1;

# 데이터 삽입하기
INSERT INTO table1(column1, column2, column3) values ('b','bb','bbb');

# 모든 컬럼에 대해서 값을 넣을 때에는 table안 column이름들 생략 가능
INSERT INTO table1 VALUES ('a','aa','aaa');

# 일부 컬럼에는 column명 지칭해야함
INSERT INTO table1(column2, column3) values ('cc','ccc'); -- column1 에는 null이 들어감.

# 테이블의 데이터 수정하기
# 하나의 컬럼의 데이터 다 바꾸기
update table1 set column1 = 'z'; -- 모든 column1의 값이 'z'로 바뀜. !!!!WARNING!!!!!

# 해당 컬럼에서 특정 값을 가진 데이터를 바꾸기 
INSERT INTO table1 values('c','cc','ccc');
UPDATE table1 SET column2 = 'zz' WHERE column2 = 'cc'; -- column2 에 'cc' 모든 값을 'zz'로 바꿈

UPDATE table1 SET column2 = 'x', column3 = 'xx' WHERE column2 = 'bb';

# table에서 row 단위로 데이터를 삭제할 때
DELETE FROM table1 WHERE column2 = 'zz';

# 모든 테이블의 row 데이터 삭제하기
DELETE FROM table1;

select * from table1;

# 테스트용 테이블 생성
DROP TABLE if exists day_visitor_realtime;
create table if not exists day_visitor_realtime(
	id bigint auto_increment primary key,
	ipaddress varchar(16),
    iptime_first datetime default now(),
    before_url varchar(250),
    device_info varchar(40),
    os_info varchar(40),
    session_id varchar(80));

# now()는 현재 시간을 return해 준다.
select now();

# 테이블에 데이터 삽입하기(길이를 초과하지 않게)
insert INTO day_visitor_realtime(
ipaddress, before_url, device_info) 
values(
'192.168.0.1', 'https://www.google.com','iphone');

# 테이블에 데이터 삽입하기(데이터 길이를 초과하기) -- ipaddress가 16자리까지 받을수 있음
insert INTO day_visitor_realtime(
ipaddress, before_url, device_info) 
values(
'192.168.100.10004', 'https://www.google.com','iphone'); -- ipaddress 길이 17

# NOT NULL
DROP TABLE if exists day_visitor_realtime;
create table if not exists day_visitor_realtime(
	id bigint auto_increment primary key,
	ipaddress varchar(16) not null,
    iptime_first datetime default now(),
    before_url varchar(250),
    device_info varchar(40),
    os_info varchar(40),
    session_id varchar(80));

# 테이블에 데이터 삽입하기 not null값을 넣어주지 않으면 작동하지 않는다.
insert INTO day_visitor_realtime(
before_url, device_info) 
values(
'https://www.google.com','iphone');

# PRIMARY KEY
DROP TABLE if exists day_visitor_realtime;
create table if not exists day_visitor_realtime(
	id bigint, -- 여기서 PRIMARY KEY 지정하지 않고
	ipaddress varchar(16) ,
    iptime_first datetime default now(),
    before_url varchar(250),
    device_info varchar(40),
    os_info varchar(40),
    session_id varchar(80),
    primary key(id));

insert INTO day_visitor_realtime(
id, before_url, device_info) 
values
(1, 'https://www.google.com','iphone'),
(2, 'htt','d');

select * FROM day_visitor_realtime;

# FOREIGN KEY
create table orders(
	order_id int,
    customer_id int,
    order_data datetime,
    primary key (order_id));

desc orders;
insert into orders values(1,1,now());
select * from orders;

# orders를 참조하는 테이블 생성
create table order_detail(
	order_id int, -- FK
    product_id int,
    product_name varchar(200),
    constraint FK_ORDERS_ORDERID foreign key (order_id) 
    references orders(order_id));
    
Insert into order_detail values(1, 2023, 'iphone');
Insert into order_detail values(2, 2023, 'iphone'); -- 추가 할 수 없음
# orders에 primary key인 order_id에 존재하지 않는 key를 order_detail FK 위치에 넣으면 작동 X
select * from order_detail;


show tables;
