create database Academy_3_11;
use Academy_3_11;


create table People(
[Id] int primary key identity(1, 1),
[Name] nvarchar(30) NOT NULL,
[Surname] nvarchar(30) NOT NULL,
[Age] int NOT NULL check (Age >= 14 and Age < 100)
);

create table Employee(
[Id] int primary key identity(1, 1),
[Salary] smallmoney NOT NULL check ([Salary] >= 300),
[Experience] int NOT NULL check ([Experience] >= 0)
);

create table Faculty(
[Id] int primary key identity(1, 1),
[Name] nvarchar(30) NOT NULL
);

create table Students(
[Id] int primary key identity(1, 1),
[PersonId] int foreign key references People(Id),
[GPA] int NOT NULL check ([GPA] >= 0 and [GPA] <= 12)
);

create table Teachers(
[Id] int primary key identity(1, 1),
[PersonId] int foreign key references People(Id),
[EmployeeId] int foreign key references Employee(Id)
);


create table Groups(
[Id] int primary key identity(1, 1),
[Name] nvarchar(30) NOT NULL,
[Course] int NOT NULL check ([Course] >= 1 and [Course] <= 6),
[FacultyId] int foreign key references Faculty(Id)
);

create table GroupData(
[Id] int primary key identity(1, 1),
[StudentId] int foreign key references Students(Id),
[GroupId] int foreign key references Groups(Id)
);

create table StudyPlan(
[Id] int primary key identity(1, 1),
[TeacherId] int foreign key references Teachers(Id),
[GroupId] int foreign key references Groups(Id)
);


select * from People;

insert into People([Name], [Surname], [Age]) values(N'Elvin', N'Azimov', 22);
insert into People([Name], [Surname], [Age]) values(N'Samir', N'Azimov', 28);
insert into People([Name], [Surname], [Age]) values(N'Namiq', N'Rasullu', 26);
insert into People([Name], [Surname], [Age]) values(N'Cavid', N'Atamoqlanov', 24);


insert into Employee(Salary, Experience) values(4000, 4);
insert into Employee(Salary, Experience) values(4001, 4);
insert into Employee(Salary, Experience) values(4002, 4);
insert into Employee(Salary, Experience) values(4003, 4);

insert into Teachers(PersonId, EmployeeId) values(1, 1);
insert into Teachers(PersonId, EmployeeId) values(2, 2);
insert into Teachers(PersonId, EmployeeId) values(3, 3);
insert into Teachers(PersonId, EmployeeId) values(4, 4);

select * from Teachers;


insert into Faculty(Name) values(N'Computer Science');
insert into Faculty(Name) values(N'Information Technology');

insert into Groups(Name, Course, FacultyId) values(N'P311', 3, 1);
insert into Groups(Name, Course, FacultyId) values(N'P312', 3, 1);
insert into Groups(Name, Course, FacultyId) values(N'P313', 3, 2);

insert into StudyPlan(TeacherId, GroupId) values(9, 1);
insert into StudyPlan(TeacherId, GroupId) values(10, 2);

select * from StudyPlan;

select P.Name, P.Surname, E.Salary, E.Experience, G.Name
from StudyPlan
inner join Teachers as T on T.Id = StudyPlan.TeacherId
inner join People as P on P.Id = T.PersonId
inner join Employee as E on E.Id = T.EmployeeId
inner join Groups as G on G.Id = StudyPlan.GroupId


select *
from StudyPlan
right join Teachers T on T.Id = StudyPlan.TeacherId


select P.Name, P.Surname, E.Salary, E.Experience, G.Name
from StudyPlan
right join Teachers T on T.Id = StudyPlan.TeacherId
left join Groups G on G.Id = StudyPlan.GroupId
inner join People P on P.Id = T.PersonId
inner join Employee E on E.Id = T.EmployeeId


select P.Name, P.Surname, E.Salary, E.Experience, G.Name
from StudyPlan
full outer join  Groups G on G.Id = StudyPlan.GroupId
full outer join  Teachers T on T.Id = StudyPlan.TeacherId
full outer join  Employee E on E.Id = T.EmployeeId
left join People P on P.Id = T.PersonId

select * from Students
inner join People P on P.Id = Students.PersonId

insert into People(name, surname, age) values(N'Vagif', N'Aliyev', 16);
insert into People(name, surname, age) values(N'Nilay', N'Aliyeva', 15);
insert into People(name, surname, age) values(N'Yusif', N'Bayramov', 20);
insert into People(name, surname, age) values(N'Gariba', N'Dadasheva', 18);
insert into People(name, surname, age) values(N'Tatyana', N'Ermakova', 25);
insert into People(name, surname, age) values(N'Eldaniz', N'Yolchuyev', 19);
insert into People(name, surname, age) values(N'Afghan', N'Maksudlu', 16);
insert into People(name, surname, age) values(N'Anver', N'Mamedov', 19);
insert into People(name, surname, age) values(N'Yusif', N'Melikov', 15);
insert into People(name, surname, age) values(N'Xelil', N'Oruclu', 16);
insert into People(name, surname, age) values(N'Baxa', N'Mirzayev', 17);
insert into People(name, surname, age) values(N'Alina', N'Orucova', 15);
insert into People(name, surname, age) values(N'Magomed', N'Farmanov', 23);
insert into People(name, surname, age) values(N'Murad', N'Efendiyev', 15);


select * from People;

select * from Students;

insert into Students(PersonId, GPA) values(7, 10);
insert into Students(PersonId, GPA) values(8, 11);
insert into Students(PersonId, GPA) values(9, 12);
insert into Students(PersonId, GPA) values(10, 9);
insert into Students(PersonId, GPA) values(11, 10);
insert into Students(PersonId, GPA) values(12, 11);
insert into Students(PersonId, GPA) values(13, 12);
insert into Students(PersonId, GPA) values(14, 9);
insert into Students(PersonId, GPA) values(15, 10);
insert into Students(PersonId, GPA) values(16, 1);
insert into Students(PersonId, GPA) values(17, 10);

select * from Students;
select * from Groups;

select * from GroupData;

insert into GroupData(StudentId, GroupId) values(12, 1);
insert into GroupData(StudentId, GroupId) values(13, 1);
insert into GroupData(StudentId, GroupId) values(14, 1);
insert into GroupData(StudentId, GroupId) values(15, 1);
insert into GroupData(StudentId, GroupId) values(16, 1);
insert into GroupData(StudentId, GroupId) values(17, 1);
insert into GroupData(StudentId, GroupId) values(18, 1);

insert into GroupData(StudentId, GroupId) values(19, 2);
insert into GroupData(StudentId, GroupId) values(20, 2);
insert into GroupData(StudentId, GroupId) values(21, 2);
insert into GroupData(StudentId, GroupId) values(22, 2);


select * from GroupData;


select G.Name, AVG(S.GPA)
from GroupData
inner join Groups G on G.Id = GroupData.GroupId
inner join Students S on S.Id = GroupData.StudentId
inner join People P on P.Id = S.PersonId
where P.Age >= 18
group by G.Name, FacultyId
having FacultyId = 1
