create database Rusin109,
use Rusin109,
go,

alter database RS928
collate Chinese_PRC_CI_AS

if exists(select name from sysobjects
	where name='DEPARTMENT' and type='U')
	drop table DEPARTMENT
go
create table DEPARTMENT
(
	DNO char(4) primary key,
	DNAME nchar(20),
	HEAD nchar(20),
)


create table DORM
(
	DORMNO char(5) primary key,
	TELE char(7),
)

create table COURSE
(
	CNO char(2) primary key,
	CNAME nchar(20),
	CPNO char(2),
	CREDIT int,
	TEACHER nchar(8),
	foreign key (CPNO) references COURSE(CNO),
)

create table STUDENT
(
	SNO char(6) primary key,
	SNAME nchar(8) not null,
	SSEX nchar(2),
	SAGE int,
	DNO char(4) foreign key references DEPARTMENT(DNO),
	DORMNO char(5)foreign key references DORM(DORMNO),
)

create table GRADE
(
	SNO char(6),
	CNO char(2),
	SCORE int,
	constraint pk_grade primary key(SNO,CNO),
	foreign key (CNO) references COURSE(CNO),
	foreign key (SNO) references STUDENT(SNO),
)

insert into DEPARTMENT
values('1',N'�����ϵ',N'������');
insert into DEPARTMENT
values('2',N'��ѧϵ',N'������');
insert into DEPARTMENT
values('3',N'����ϵ',N'����');
insert into DEPARTMENT
values('4',N'����ϵ',N'�ط�');

insert into DORM
values('2101','8302101');
insert into DORM
values('2202','8302202');
insert into DORM
values('2303','8302303');
insert into DORM
values('2404','8302404');
insert into DORM
values('2505','8302505');

insert into COURSE
values('01',N'���ݿ�ԭ��','05',4,N'����');
insert into COURSE
values('02',N'�ߵ���ѧ',null,6,N'�ŷ�');
insert into COURSE
values('03',N'��Ϣϵͳ','01',2,N'����');
insert into COURSE
values('04',N'����ϵͳ','06',4,N'��ǿ');
insert into COURSE
values('05',N'���ݽṹ','07',4,N'·��');
insert into COURSE
values('06',N'�㷨���',null,2,N'�ƺ�');
insert into COURSE
values('07',N'C����','06',3,N'�ߴ�');

insert into STUDENT
values('990101',N'ԭҰ',N'��',21,'1','2101');
insert into STUDENT
values('990102',N'��ԭ',N'��',21,'1','2101');
insert into STUDENT
values('990103',N'���',N'��',20,'1','2101');
insert into STUDENT
values('990104',N'��Զ',N'��',20,'1','2101');
insert into STUDENT
values('990105',N'����',N'��',20,'1','2101');
insert into STUDENT
values('990201',N'������',N'��',19,'2','2202');
insert into STUDENT
values('990202',N'�춫',N'��',19,'2','2202');
insert into STUDENT
values('990301',N'����',N'Ů',21,'1','2303');
insert into STUDENT
values('990302',N'����',N'Ů',20,'3','2303');
insert into STUDENT
values('990303',N'Ҧ־Ѯ',N'��',19,'4','2404');
insert into STUDENT
values('990401',N'������',N'��',19,'4',null);
insert into STUDENT
values('990402',N' ����',N'��',21,'4','2404');


insert into GRADE
values('990101','01',85);
insert into GRADE
values('990101','03',65);
insert into GRADE
values('990101','04',83);
insert into GRADE
values('990101','07',72);
insert into GRADE
values('990102','02',80);
insert into GRADE
values('990102','04',81);
insert into GRADE
values('990102','01',null);
insert into GRADE
values('990103','07',74);
insert into GRADE
values('990103','06',74);
insert into GRADE
values('990103','01',74);
insert into GRADE
values('990103','02',70);
insert into GRADE
values('990103','04',70);
insert into GRADE
values('990104','01',55);
insert into GRADE
values('990104','02',42);
insert into GRADE
values('990104','03',0);
insert into GRADE
values('990105','03',85);
insert into GRADE
values('990105','06',null);
insert into GRADE
values('990301','01',46);
insert into GRADE
values('990301','02',70);
insert into GRADE
values('990302','01',85);
insert into GRADE
values('990401','01',0);

use Rusin109
/*1-5*/
select sno,sname,dormno from STUDENT where DNO=1 order by DORMNO asc
select *from STUDENT where DNO=1 order by SSEX asc,SAGE desc
select SNAME,2003-sage'BIRTHDAY' from STUDENT where DNO=2 
select distinct CNO from GRADE 
select SNAME,DORMNO from STUDENT where sage>=21 and sage<=23
/*6-10*/
select SNAME from STUDENT where DNO in(2,3,4)
select *from STUDENT where ltrim(sname like N'��%'
select *from STUDENT where ltrim(sname) like N'_��%'
select CNAME,TEACHER from COURSE where cpno is null
select *from STUDENT where DNO=1 and ssex=N'��'

11-15
select DNO,count(SNO)as ���� from STUDENT group by DNO
    select DNO,count(SNO)as ���� from STUDENT where DNO=1 group by DNO
select 
