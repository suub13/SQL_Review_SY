show databases;
use employees;

select database();
show tables;

select * from departments;
select  * from titles;

# unique 값만 뽑기
select distinct title from titles;

# select where 절
select * from salaries where salary >150000;

# dept_manager 테이블에서 emp_np가 111133인 데이터 조회
select * from dept_manager where emp_no = 111133;

select * from dept_manager where emp_no between 111133 and 111939;

# first_name이 Geo 로 시작되는 데이터 찾기
select * from employees where first_name like 'Geo%';

select * from titles where title = 'Senior Engineer' and from_date > "2002-06-01";

# ORDER BY
select * 
  from titles
 where title = "Senior Engineer"
   and from_date > "2002-06-01"
order by from_date DESC, emp_no; -- from_date는 거꾸로, emp_no은 증가순.

# ISNULL ISNOT NULL

# 보여주는 개수 제한
SELECT * 
FROM employees
LIMIT 10;

# MIN MAX 사용하기
SELECT MAX(salary), MIN(salary)
FROM salaries;

select count(*)
	from salaries
    where salary > 150000;
    
select avg(salary)
	from salaries
    where salary > 150000;
    
select * 
	from dept_manager as dm
	where dm.emp_no > 110000;
    
select emp_no, max(salary)
	from salaries
    group by emp_no;


