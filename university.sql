create database university;
use university;

create table class(
classId int auto_increment primary key,
className varchar(10) not null,
amountStudent int not null,
courseId int not null
);

create table student(
studentId int auto_increment primary key,
studentName varchar(50) not null,
classId int not null,
studentAge int not null,
address varchar(255) not null,
email varchar(50) unique not null,
phone varchar(10) unique not null,
foreign key (classId) references class(classId)
);

create table course(
courseId int auto_increment primary key,
courseName varchar(30) not null
);

alter table class add constraint fk_course foreign key (courseId) references course(courseId);
alter table student add constraint ck_age check (studentAge >= 18);
alter table student modify address varchar(255); 
alter table student add column testMark double not null;
alter table class drop column amountStudent;

insert into course(courseId, courseName)
values
(111,"Khóa K1"),
(112,"Khóa K2"),
(113,"Khóa K3"),
(114,"Khóa K4"),
(115,"Khóa K5");

insert into class (classId, className, courseId) 
values
(001,"C04",114),
(002,"C03",113),
(003,"D01",114),
(004,"D02",112),
(005,"A05",115),
(006,"A02",111),
(007,"B03",112);

insert into student (studentId, studentName, classId, studentAge, address, email, phone, testMark)
values
(101, "Văn A", 006, 20, "An Hòa -Huế", "vana@edu.com", "0981234567", 8.0),
(102, "Văn B", 001, 21, "An Cựu -Huế", "vanb123@edu.com", "0971234567", 6.0),
(103, "Văn C", 007, 20, "Sịa -Huế", "vanc345@edu.com", "0931234567", 10.0),
(104, "Văn D", 004, 23, "Tứ Hạ -Huế", "vand234@edu.com", "0931234568", 8.0),
(105, "Thị E", 007, 20, "Triệu Phong -Quảng Trị", "thid456@edu.com", "0981234568", 9.5),
(106, "Thị G", 003, 22, "Thanh Khê -Đà Nẵng", "thig010@edu.com", "0931234569", 6.5),
(107, "Thị H", 004, 21, "Vỹ Dạ -Huế", "thih789@edu.com", "0981234569", 8.5);

update student
set mark = 8.5
where studentId = 104;

alter table student add column gender varchar(5) not null default "Nam";

select * from student;
update student 
set gender = "Nữ"
where studentId in (105,106,107);

select * from student;
select * from course;
