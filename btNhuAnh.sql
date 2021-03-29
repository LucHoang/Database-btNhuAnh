CREATE DATABASE StudentTest_Luc;
USE StudentTest_Luc;
CREATE TABLE Student (
RN INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(20),
Age TINYINT
);

INSERT INTO STUDENT (name, age)
VALUES ('Nguyen Hong Ha', 20);
INSERT INTO STUDENT (name, age)
VALUES ('Truong Ngoc Anh', 30);
INSERT INTO STUDENT (name, age)
VALUES ('Tuan Minh', 25);
INSERT INTO STUDENT (name, age)
VALUES ('Dan Truong', 22);

CREATE TABLE test (
test_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20)
);

INSERT INTO test(name)
VALUES ('EPC');

UPDATE test
SET name = 'DWMX'
WHERE test_id = 2;
UPDATE test
SET name = 'SQL1'
WHERE test_id = 3;

INSERT INTO test(name)
VALUES ('SQL2');

CREATE TABLE studenttest (
rn INT,
FOREIGN KEY (RN) REFERENCES student(rn),
testid INT,
FOREIGN KEY (testid) REFERENCES test(test_id),
Date DATETIME,
Mark FLOAT
);

INSERT INTO studenttest(rn, testid, Date, Mark)
VALUES (1, 1, 7/17/2016, 8);
INSERT INTO studenttest(rn, testid, Date, Mark)
VALUES (1, 2, '2016-07-17', 5);

UPDATE studenttest
SET Date = '2016-07-18'
WHERE testid = 1;

INSERT INTO studenttest(rn, testid, Date, Mark)
VALUES (1, 3, '2016-07-19', 7);

ALTER TABLE student
ADD CHECK (Age>=15 and Age<=55);

INSERT INTO student(RN, Name, Age)
VALUES (8, 'a', 10);

ALTER TABLE studenttest
ALTER Mark SET DEFAULT 0;

ALTER TABLE studenttest
ADD PRIMARY KEY (rn, testid);

ALTER TABLE test
ADD UNIQUE (name);

alter table test
drop index name;

-- 3333333333333333333333333333333333333333333333333333333333333333333
SELECT student.name as 'Student Name', test.name as 'Test Name', studenttest.Mark as 'Mark', studenttest.date as 'Date'
FROM ((studenttest
INNER JOIN student ON student.RN = studenttest.rn)
INNER JOIN test ON test.test_id = studenttest.testid)
order by student.Name;

-- 4444444444444444444444444444444444444444444444444444444444444444444444
select student.rn, student.name, student.age
from student
left join studenttest on student.RN = studenttest.rn
where studenttest.rn is null;

-- 555555555555555555555555555555555555555555555555555555555555555555555555
SELECT student.name as 'Student Name', test.name as 'Test Name', studenttest.Mark as 'Mark', studenttest.date as 'Date'
FROM ((studenttest
INNER JOIN student ON student.RN = studenttest.rn)
INNER JOIN test ON test.test_id = studenttest.testid)
where studenttest.mark < 5
order by student.Name;

-- 6666666666666666666666666666666666666666666666666666666666666666666666666
SELECT student.name as 'Student Name', avg(studenttest.mark) as 'Avarage'
FROM (studenttest
INNER JOIN student ON student.RN = studenttest.rn)
group by student.name
order by avg(studenttest.Mark) desc;

-- 77777777777777777777777777777777777777777777777777777777777777
SELECT student.name as 'Student Name', avg(studenttest.mark) as 'Avarage'
FROM (studenttest
INNER JOIN student ON student.RN = studenttest.rn)
group by student.name
order by avg(studenttest.Mark) desc
limit 1;

-- 88888888888888888888888888888888888888888888888888888888888888
select t.name as 'Test name', max(s.mark) as 'Max Mark' 
from test as t, studenttest as s
where t.test_id = s.testid
group by t.name
order by t.name;

-- 999999999999999999999999999999999999999999999999999999
select s.name as 'Student Name', t.name as 'Test Name' 
from studenttest as st
left join test as t on st.testid = t.test_id
right join student as s on s.rn = st.rn;

-- 1010101010101010101010101010101010
update student
set age = age+1;

-- 111111111111111111111111111111111111111111111
alter table student
add Status varchar(10);

-- 12222222222222222222222222222222222222222222222
update student
set status = 'Young'
where age < 30;
update student
set status = 'Old'
where age >= 30;
select student.rn as RN, student.name as Name, student.age as Age, student.status as Status
from student;

-- 13333333333333333333333333333333333333333333333333
select s.name, t.name,  st.mark, st.date
from student as s, studenttest as st, test as t
where s.rn = st.rn
and st.testid = t.test_id
order by st.date, t.name;

-- 14444444444444444444444444444444444444444444444444
select s.name as 'Student Name', s.age as 'Age', avg(st.mark) as 'Diem trung binh' 
from student as s, studenttest as st
where s.name like 't%' and s.rn = st.rn
group by s.name
having avg(st.mark) > 4.5;

-- 155555555555555555555555555555555555555555555555555
set @temp := 0;
select RN,name,Age,Mark,@temp := @temp +1 as 'Xep hang'
from(
		select s.RN,s.name,s.Age,avg(mark) as Mark
		from (StudentTest as st inner join student as s on st.RN = s.RN)
			 inner join test as t on st.testId = t.test_Id
		group by s.name
		order by avg(mark) desc) as x;
    

create table temp (
xep_hang tinyint auto_increment primary key
);
alter table temp
add rn int;
alter table temp
add foreign key(rn) references student(rn);

SELECT s.rn as Ma, s.name, avg(st.mark)-- , temp.xep_hang as 'Xep hang'
FROM ((studenttest as st
inner join test as t on st.testid = t.test_id)
inner join student as s on s.rn = st.rn)
-- right join temp on )
group by s.name
order by avg(st.mark) desc;

-- SELECT s.rn as Ma, s.name, avg(st.mark),
-- CASE
--     WHEN avg(st.mark) >= 0 THEN 1
--     ELSE 'The quantity is under 30'
-- END AS 'Xep hang'
-- FROM student as s, studenttest as st, test as t
-- where s.rn = st.rn
-- and st.testid = t.test_id
-- group by s.name
-- order by avg(st.mark) desc;

-- 16666666666666666666666666666666666666666666666666
alter table student
modify column Name nvarchar(50);

-- 1777777777777777777777777777777777777777777777777
update student
set name = concat('Old ', name)
where age > 20;
update student
set name = concat('Young ', name)
where age <= 20;

-- 1888888888888888888888888888888888888888888888
DELETE FROM test
WHERE not exists  (
select studenttest.testid
from studenttest
where testid = test.test_id
);

-- 199999999999999999999999999999999999999
delete from studenttest
where mark<5;