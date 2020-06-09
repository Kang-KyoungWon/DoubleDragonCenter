/*
������ : DDL...?
�ۼ��� : 1��(�����, ������, �����, �̿���, ������, ���缺)
�ۼ����� : 2019.06.02
������Ʈ�� : ?????
���α׷��� : �ֿ뱳������
���α׷� ���� : �ֿ� �������� �ý����� �����ϱ� ���� ���α׷��̴�.
*/

/*
-- INDEX
01. ������(tblAdmin)
02. ����(tblTeacher)
03. ���ɰ���(tblAvlSubject) 
04. ������(tblTeacherCourse)
05. ��������(tblOpenCourse)
06. �������(������������)(tblCourseList)
07. ������ ����(tblCourseSubject)
08. ����(tblSubject)
09. ���� (tblBook)
10. ���ǽ�(tblRoom)
11. ������ ǰ��(tblItem)
12. ������û(tblRegiCourse)
13. ���(tblAttendance)
14. ������(tblStudent)
15. ����������ȸ(tblSubjectSchedule)
16. ���������(tblScorePercent)
17. ����(tblExam)
18. ����(tblScore)
19. �����н�(tblSupplement)
20. ������(tblSubjectRating)
21. ������ ����(tblInterview)
22. ����Ȱ��(tblAS)
23. �����(tblEmployment)
24. ��ü(tblCompany)
*/

---------------------------------------------------------------------------------------------------
--01. ������(tblAdmin)
---------------------------------------------------------------------------------------------------
CREATE TABLE tblAdmin   -- ������
(
	admin_seq number primary key,                           -- ������ ��ȣ(PK)
	name varchar2(30) not null                              -- ������ �̸�
);

create sequence admin_seq;
--DROP TABLE tblAdmin;
--DROP SEQUENCE amdin_seq;

select * from tblAdmin;


---------------------------------------------------------------------------------------------------
--02. ����(tblTeacher)
---------------------------------------------------------------------------------------------------
CREATE TABLE  tblTeacher -- ����
(
	teacher_seq number primary key,                         -- ���� ��ȣ(PK)
	name varchar2(30) not null,                             -- �̸�
	ssn varchar2(14) not null,                              -- �ֹι�ȣ
	tel varchar2(13) not null                               -- ��ȭ��ȣ
);

create sequence teacher_seq;        
--DROP TABLE tblTeacher;              
--DROP SEQUENCE teacher_seq;          

select * from tblTeacher;

---------------------------------------------------------------------------------------------------
-- 03. ���ǰ��ɰ��� (tblAvlSubject)
---------------------------------------------------------------------------------------------------
create table tblAvlSubject -- ���� ���� ����
(
	avlSubject_seq number primary key,            --���� ���� ��ȣ(PK)
	teacher_seq number not null references tblTeacher(teacher_seq),   --�����ȣ(FK)
	subject_seq number not null references tblSubject(subject_seq)      --�����ȣ(FK)
);

create sequence avlSubject_seq;

--DROP table tblAvlSubject;
--DROP sequence avlSubject_seq;

select * from tblAvlSubject;

---------------------------------------------------------------------------------------------------
--04. ������(tblTeacherCourse)
---------------------------------------------------------------------------------------------------
CREATE TABLE tblTeacherCourse -- ���� ������
(
	teacherCourse_seq number primary key,                               -- ������ ��ȣ(PK)
	teacher_seq not null references tblTeacher(teacher_seq),            -- �����ȣ(FK)
	openCourse_seq not null references tblOpenCourse(openCourse_seq)    --����������ȣ(FK)
);

create sequence teacherCourse_seq;
--DROP TABLE tblTeacherCourse;
--DROP SEQUENCE teacherCourse_seq;

select * from tblTeacherCourse;

---------------------------------------------------------------------------------------------------
--05. ��������(tblOpenCourse)
---------------------------------------------------------------------------------------------------
CREATE TABLE tblOpenCourse -- ��������
(
	openCourse_seq number primary key,              -- �������� ��ȣ(PK)
	courseList_seq number not null references tblCourseList(courseList_seq),   -- ���� ��ȣ(FK)
	startDate date not null,                            -- ���� �Ⱓ(����)
	endDate date not null,                              -- ���� �Ⱓ(��)
	countStudent number not null,                       -- ������ �ο�
	room_seq not null references tblRoom(room_seq)      -- ���ǽ� ��ȣ(FK)
);

create sequence openCourse_seq;
--DROP TABLE tblOpenCourse;
--DROP SEQUENCE openCourse_seq;

select * from tblOpenCourse;

---------------------------------------------------------------------------------------------------
--06. �������(������������)(tblCourseList)
---------------------------------------------------------------------------------------------------
CREATE TABLE tblCourseList -- �������(������������)
(
	courseList_seq number primary key,              -- ���� ��ȣ(PK)
	name varchar2(120) not null,                     -- ������
	period number not null                          -- ���� �Ⱓ
);

create sequence courseList_seq;
--DROP TABLE tblCourseList;
--DROP SEQUENCE courseList_seq;


select * from tblCourseList;

---------------------------------------------------------------------------------------------------
--07. ������ ����(tblCourseSubject)
---------------------------------------------------------------------------------------------------
CREATE TABLE tblCourseSubject -- ������ ����
(
	courseSubject_seq number primary key,                               -- ������ ���� ��ȣ(PK)
	courseList_seq not null references tblCourseList(courseList_seq),   -- ���� ��ȣ(FK)
	subject_seq not null references tblSubject(subject_seq)             -- ���� ��ȣ(FK)
);

create sequence courseSubject_seq;
--DROP TABLE tblCourseSubject;
--DROP SEQUENCE courseSubject_seq;

select * from tblCourseSubject;  

---------------------------------------------------------------------------------------------------
--08. ����(tblSubject)
---------------------------------------------------------------------------------------------------
create table tblsubject -- ����
(
	subject_seq number primary key,               --�����ȣ(PK)
	name varchar2(60) not null,               --�����
	period number not null,                  --����Ⱓ
	book_seq number not null references tblBook(book_seq)      --�����ȣ(FK)
);

create sequence subject_seq;

--DROP table tblSubject;
--DROP sequence subject_seq;

select * from tblSubject;

---------------------------------------------------------------------------------------------------
-- 09. ���� (tblBook)
---------------------------------------------------------------------------------------------------
create table tblBook -- ����
(
	book_seq number primary key,               --�����ȣ(PK)
	name varchar2(60) not null,               --�����
	publisher varchar2(30) not null               --���ǻ�
);

create sequence book_seq;

--DROP table tblBook;
--DROP sequence book_seq;

select * from tblBook;

---------------------------------------------------------------------------------------------------
--10. ���ǽ�(tblRoom)
---------------------------------------------------------------------------------------------------
CREATE TABLE tblRoom -- ���ǽ�
(
	room_seq number primary key, -- ���ǽ� ��ȣ(PK)
	name varchar2(12) not null, -- ���ǽ� ��
	count number not null -- ���ǽ� ����
);

create sequence room_seq;                           
--DROP TABLE tblRoom;                                 
--DROP SEQUENCE room_seq;                             

select * from tblRoom;

---------------------------------------------------------------------------------------------------
--11. ������ ǰ��(tblItem)
---------------------------------------------------------------------------------------------------
CREATE TABLE tblItem -- ������ ǰ��
(
	item_seq number primary key, -- ǰ�� ��ȣ(PK)
	name varchar2(20) not null, -- ������ �̸�
	itemqty number not null, -- ����
	room_seq number not null references tblRoom(room_seq), -- ���ǽ� ��ȣ(FK)
	courseList_seq number not null references tblcourseList(courseList_seq) -- ������ȣ(FK)
);

create sequence item_seq;                           
--DROP TABLE tblItem;                                 
--DROP SEQUENCE item_seq;                             

select * from tblItem;




---------------------------------------------------------------------------------------------------
-- 12. ������û(tblRegiCourse)
---------------------------------------------------------------------------------------------------

create table tblRegiCourse -- ������û
(
	regiCourse_seq number primary key, -- ������û ��ȣ
	student_seq number references tblStudent(student_seq) not null, --������ ��ȣ(FK)
	openCourse_seq number references tblOpenCourse(openCourse_seq) not null, -- �������� ��ȣ(FK)
	finalState varchar2(15), -- ����/�ߵ�Ż�� ����
	finalDate date, -- ����/�ߵ�Ż�� ��¥
	state varchar2(15) not null, -- ����(������û, ���, �Ϸ�, ���)
	asState varchar2(15) not null -- ��� ����
);

create sequence regiCourse_seq;

--DROP table tblRegiCourse;
--DROP sequence regiCourse_seq;

select * from tblRegiCourse;

---------------------------------------------------------------------------------------------------
-- 13. ���(tblAttendance)
---------------------------------------------------------------------------------------------------

create table tblAttendance -- ���
(
	attendance_seq number primary key, -- ��� ��ȣ
	regiCourse_seq number references tblRegiCourse(regiCourse_seq) not null, --������û ��ȣ(FK)
--	attendDate date not null, -- ��¥
	workOn date, -- ��ٽð�
	workOff date, -- ��ٽð�
	state varchar2(15) not null -- ���»���
);

create sequence attendance_seq;

--DROP table tblAttendance;
--DROP sequence attendance_seq;

select * from tblAttendance;



---------------------------------------------------------------------------------------------------
-- 14. ������(tblStudent)
---------------------------------------------------------------------------------------------------


create table tblStudent -- ������
(
	student_seq number primary key, -- ������ ��ȣ
	name varchar2(30) not null, -- ������ �̸�
	ssn varchar2(14) not null, -- ������ �ֹι�ȣ
	tel varchar2(13) not null, -- ������ ��ȭ��ȣ
	regiDate date not null -- �����
);

create sequence student_seq;

--DROP table tblStudent;
--DROP sequence student_seq;

select * from tblStudent;

---------------------------------------------------------------------------------------------------
--15. ����������ȸ(tblSubjectSchedule)
---------------------------------------------------------------------------------------------------
create table tblSubjectSchedule -- ���� ������ ��ȸ
(
	subjectSchedule_seq number primary key,            --�������ٹ�ȣ(PK)
	subject_seq number not null references tblSubject(subject_seq),      --�����ȣ(FK)
	startDate date not null,                  --����Ⱓ(����)
	endDate date not null,                  --����Ⱓ(��)
	openCourse_seq number not null references tblOpenCourse(openCourse_seq)--����������ȣ(FK)
);

create sequence subjectSchedule_seq;

--DROP table tblSubjectSchedule;
--DROP sequence subjectSchedule_seq;

select * from tblSubjectSchedule;

---------------------------------------------------------------------------------------------------
--16. ���������(tblScorePercent) 
---------------------------------------------------------------------------------------------------
create table tblScorePercent -- ���������
(
	scorePercent_seq number primary key,            --������ȣ(PK)
	percentSubjective number,               --�ʱ����
	percentObjective number,               --�Ǳ����
	percentAtt number,                  --������
	examDate date not null,                  --���賯¥
	subjectSchedule_seq number not null references tblSubjectSchedule(subjectSchedule_seq) --�������ٹ�ȣ
);

create sequence scorePercent_seq;

--DROP table tblScorePercent;
--DROP sequence scorePercent_seq;

select * from tblScorePercent;

---------------------------------------------------------------------------------------------------
--17.  ����(tblExam) 
---------------------------------------------------------------------------------------------------
create table tblExam -- ����
(
	exam_seq number primary key,               --�����ȣ(PK)
	question_seq number,                  --������ȣ
	type varchar2(15),                  -- ���� ����
	question varchar2(600),                  --����
	subjectSchedule_seq number not null references tblSubjectSchedule(subjectschedule_seq)--�������ٹ�ȣ(FK)
);

create sequence exam_seq;

--DROP table tblExam;
--DROP sequence exam_seq;

select * from tblExam;


---------------------------------------------------------------------------------------------------
-- 18. ����(tblScore) ************************ �������� scoreResult
---------------------------------------------------------------------------------------------------

create table tblScore -- ����
(
	score_seq number primary key, -- ���� ��ȣ
	scoreSubjective number, -- �Ǳ� ����
	scoreObjective number, -- �ʱ� ����
	scoreAtt number, -- ��� ����
	scoreResult varchar2(15), -- ���� ���� 
	regiCourse_seq number references tblRegiCourse(regiCourse_seq) not null, -- ������û ��ȣ(FK)
	subjectschedule_seq number references tblSubjectschedule(subjectschedule_seq) not null -- �������� ��ȣ(FK)
);

create sequence score_seq;

--DROP table tblScore;
--DROP sequence score_seq;

select * from tblScore;

---------------------------------------------------------------------------------------------------
-- 19. ���� �н�(tblSupplement)
---------------------------------------------------------------------------------------------------

create table tblSupplement
(
	supplement_seq number primary key, -- ���� �н� ��ȣ
	suppleDate date not null, -- ���� �н� ��¥
	score_seq number references tblScore(score_seq) not null -- ���� ��ȣ
);

create sequence supplement_seq;

--DROP table tblSupplement;
--DROP sequence supplement_seq;

select * from tblSupplement;

---------------------------------------------------------------------------------------------------
-- 20. ���� ��(tblSubjectRating)
---------------------------------------------------------------------------------------------------

create table tblSubjectRating
(
	subjectRating_seq number primary key, -- ���� �� ��ȣ
    ratingDate date not null, -- �� ��¥
	ratingScore number not null, -- ����
	ratingContents varchar2(100), -- �� ����
	regiCourse_seq number references tblRegiCourse(regiCourse_seq) not null, --������û ��ȣ(FK)
	subjectschedule_seq number references tblSubjectschedule(subjectschedule_seq) not null -- �������� ��ȣ(FK)
);


create sequence subjectRating_seq;

--DROP table tblSubjectRating;
--DROP sequence subjectRating_seq;

select * from tblSubjectRating;

---------------------------------------------------------------------------------------------------
-- 21. ������ ����(tblInterview)
---------------------------------------------------------------------------------------------------

create table tblInterview -- ������ ����
(
	interview_seq number primary key, -- ���� ��ȣ
	interviewDate date not null, -- ���� ��¥
	interviewResult varchar2(15) not null, -- �հ� ����
	regiCourse_seq number references tblRegiCourse(regiCourse_seq) not null --������û ��ȣ(FK)
);

create sequence interview_seq;

--DROP table tblInterview;
--DROP sequence interview_seq;

select * from tblInterview;

---------------------------------------------------------------------------------------------------
-- 22. ����Ȱ��(tblAS)
---------------------------------------------------------------------------------------------------

create table tblAS -- ����Ȱ��
(
	as_seq number primary key, -- ����Ȱ�� ��ȣ
	asDate date, -- ����Ȱ�� ��¥
	asService varchar2(15), -- ����Ȱ��
	asList varchar2(500), -- ����Ȱ�� ����
	regiCourse_seq number references tblRegiCourse(regiCourse_seq) not null -- ������û ��ȣ(FK)

);

create sequence as_seq;

--DROP table tblAS;
--DROP sequence as_seq;

select * from tblAS;

---------------------------------------------------------------------------------------------------
-- 23. �����(tblEmployment)
---------------------------------------------------------------------------------------------------

create table tblEmployment
(
	employment_seq number primary key, -- ����� ��ȣ
	employmentDate date not null, -- ��� ��¥
	company_seq number references tblCompany(company_seq) not null, -- ��ü ��ȣ
	regiCourse_seq number references tblRegiCourse(regiCourse_seq) not null -- ������û ��ȣ
);

create sequence employment_seq;

--DROP table tblEmployment;
--DROP sequence employment_seq;

select * from tblEmployment;

---------------------------------------------------------------------------------------------------
-- 24. ��ü(tblCompany)
---------------------------------------------------------------------------------------------------

create table tblCompany
(
	company_seq number primary key, -- ��ü ��ȣ
	name varchar2(30) not null, -- ��ü �̸�
	salary number, --����
	address varchar2(100) not null, -- ��ü �ּ�
	tel varchar2(13) not null -- ��ü ��ȭ��ȣ
);

create sequence company_seq;

--DROP table tblCompany;
--DROP sequence company_seq;

select * from tblCompany;

commit;


