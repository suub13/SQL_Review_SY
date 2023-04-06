# mysql 데이터베이스의 user 테이블
-- desc mysql.user; #얘를 기준으로 해서 실행행 user는 table, desc = describe

# 위와 동일
-- show columns from mysql.user; 
show full columns from mysql.user; # 권한 등에  대한 내용이 추가 되었음.

# select 문
select user
	  ,host
      from mysql.user -- Database
;

# DDL (Data Definition Language) 
# 사용자 생성 (이름 = test, 비밀번호 = 1234, 접속 범위 = localhost)
# localhost = ip또한 확인해 준다.
CREATE USER 'test'@'localhost'IDENTIFIED BY'1234';
SELECT user, host from mysql.user;

-- host에 '%' 값을 넣게되면 어떤 IP라도 접속이 가능합니다.
CREATE user 'anywhere'@'%' identified by '1234'; 
select user, host from mysql.user;

-- # 특정 ip에서만 접근 가능 
create user 'test2'@'192.168.0.%' identified by '1234';
select user, host from mysql.user;

-- # create or replace -> 이미 존재하는 사용자일 경우 주어진 값으로 replace한다.
CREATE or REPLACE user 'test'@'localhost' IDENTIFIED BY '1234';
SELECT USER, HOST FROM MYSQL.USER;

-- # 생성하고자 하는 사용자 이름이 이미 사용중이지 않을 때만 생성
create user if not exists 'test'@'localhost' identified by '1234';
SELECT USER, HOST FROM MYSQL.USER;

# 사용자의 데이터를 변경
rename user 'test2'@'192.168.0.%' to 'test3'@'%';
SELECT USER, HOST FROM MYSQL.USER;

# 사용자의 비밀번호를 변경
set password for 'test3'@'%' = password('12345');
SELECT USER, HOST FROM MYSQL.USER;

# 사용자를 삭제
-- drop user 'test3'@'%';
-- SELECT USER, HOST FROM MYSQL.USER;

# 조걱에 따라 해당 사용자가 존재할 때 삭제
drop user if exists 'anywhere'@'%';
SELECT USER, HOST FROM MYSQL.USER;

# 데이터베이스 생성하기
create database test;

# 권한 조회하기
show grants for 'test'@'localhost';

# 데이터베이스 권한 부여하기  test.* -> test라는 모든 부분에서 
grant all privileges on test.* to 'test'@'localhost';
flush privileges;

# 권한 삭제하기
revoke all on test.* from 'test'@'localhost';
flush privileges;

# database의 목록을 조회하기
show databases;

# 특수한 문자를 포함하는 database 생성
create database `test.test`;
show databases;

# database 삭제
drop database `test.test`;
show databases;


create database test1;

create database java;
show databases; 

#지금부터 자바라는 데이터베이스에 대해 사용하겠다.
# 데이터 베이스를 생략해도 java에서 찾아라.
use java;

# varchar = 가변형 문자열을 같은 자료형
create Table table1(column1 varchar(100));

# 테이블 목록 조회
show tables;

# 지금 use되고 있는 데이터베이스를 조회 
select database();

# 테이블 이름 변경
rename table table1 to table2;
show tables; -- 이름 바뀜을 확인
# 테이블 제거
drop table table2;
show tables; -- 아무것도 없음을 확인

# 테이블 열에 대해 수정을 할 테이블 생성
create table test_table(
	test_column1 int,
    test_column2 int,
    test_column3 int
);
desc test_table;

# 테이블에 column 추가하기
alter table test_table add test_column4 int;
desc test_table;

# 여러 개의 컬럼을 동시에 추가하기
alter table test_table add(test_column5 int, test_column6 int, test_column7 int);
desc test_table;

# 테이블에 column삭제 테이블 안 데이터를 바꾸려면 alter를 해야한다.
alter table test_table drop test_column5;
desc test_table;

# 테이블 컬럼들 간의 순서를 바꾸기
alter table test_table modify test_column4 int first;
desc test_table;

# 특정 위치로 컬럼 순서 변경하기
# 특정 table 뒤로 보내기
alter table test_table modify test_column7 int after test_column4;
desc test_table;

# 컬럼의 이름 변경하기
alter table test_table change test_column1 test_column0 int;
desc test_table;

# 컬럼의 타입 변경하기
alter table test_table change test_column0 test_column0 varchar(100);
desc test_table;

# 컬럼의 타입과 이름을 동시에 변경
alter table test_table change test_column0 test_column1 int;
desc test_table;

# auto_increment로 자동으로 증가하는 column 만들기 
CREATE TABLE test(id INT auto_increment primary key); -- primary key 적지 않으면 error 발생
show tables;
desc test;

# auto_increment로 지정된 컬럼은 데이터를 지정하지 않아도 된다.
# 데이터를 삽입: value뒤에 오는 소괄호에 데이터를 넣어줘야 합니다.
insert into test value(); -- 이거 돌리는 만큼 데이터가 들어간다

select * from test;
desc test;

# 값을 지정해서 auto_increment 컬럼에 데이터 삽입
insert into test value(100);
insert into test value(); -- 101 이 들어감
insert into test value(22); 
insert into test value(); -- 앞에 22가 들어갔지만 다음은 23이 아닌 102가 들어간다

# 마지막 값을 삭제하고 auto로 데이터를 넣어보기
delete from test where id = 102;
select * from test;

insert into test value(); -- 103이 추가 된다. 삭제한 값이랑 상관없다.
select * from test;

# test 테이블의 모든 데이터 지우기
delete from test; -- 위험하다.


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


select * FROM day_visitor_realtime;

show databases;




