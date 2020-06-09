--�����ڴ� ���� ���� ���� �� ���� ����, ���� ���� ����ϰԵ� ���� ������ ��� �� ������ �� �־�� �Ѵ�.

--���� ����(tblTeacher)
--1. ���� ���� �˻�
select * from tblTeacher;
--2. ���� ���� ���
insert into tblTeacher (teacher_seq, name, ssn, tel) values (teacher_seq.nextVal, �̸�, �ֹι�ȣ, ��ȭ��ȣ);
--3. ���� ���� ����
update tblTeacher set �����Ϸ��� �÷��� = �� where ����(��ġ);
--4. ���� ���� ����
delete from tblTeacher where ����(��ġ);



--���� ����(tblOpenCourse)
--1. ���� ���� �˻�
select * from tblOpenCourse;
--2. ���� ���� ���
insert into tblOpenCourse (openCourse_seq, courseList_seq, startDate, endDate, countStudent, room_seq)
    values (openCourse_seq.nextVal, ������ȣ, �����Ⱓ(����), �����Ⱓ(��), ������ �ο�, ���ǽ� ��ȣ);
--3. ���� ���� ����
update tblOpenCourse set �����Ϸ��� �÷��� = �� where ����(��ġ);
--4. ���� ���� ����
delete from tblOpenCourse where ����(��ġ);



--���� ����(tblCourseList)
--������(tblCourseList), �����(tblSubject), ���ǽǸ�(���� ����)(tblRoom), �����(���ǻ�� ����)(tblBook)
--���� ������ ���� �Է�, ���, ����, ���� ����� ����� �� �־�� �Ѵ�.
--1. ���� ���� �Է�
insert into tblCourseList name values ������;
insert into tblSubject name values �����;
insert into tblRoom (name, count) values (���ǽǸ�, ����);
insert into tblBook (name, publisher) values (�����, ���ǻ��);

--2. ���� ���� ���
select name from tblCourseList;
select name from tblSubject;
select name, count from tblRoom;
select name, publisher from tblBook;

--3. ���� ���� ����
update tblCourseList set name = ������ where ����;
update tblSubject set name = ����� where ����;
update tblRoom set name = ���ǽǸ� and count = ���� where ����;
update tblBook set name = ����� and publisher = ���ǻ�� where ����;

--4. ���� ���� ����
delete from tblCourseList where ����;
delete from tblSubject where ����;
delete from tblRoom where ����;
delete from tblBook where ����;





--���� ���� ����

--Ư�� ���� ���� ���ý� ���� ���� ���� ���-�������� ��ȣ, ������, �����ȣ,�����,����Ⱓ(����),(��)
select oc.openCourse_seq as ����������ȣ, cl.name as ������, s.subject_seq as �����ȣ, s.name as �����, ss.startDate as �������, ss.endDate as ����
    from tblOpenCourse oc -- ��������
        inner join tblSubjectSchedule ss -- ����������ȸ
            on oc.openCourse_seq = ss.openCourse_seq
                inner join tblSubject s -- ����
                    on s.subject_seq = ss.subject_seq
                        inner join tblCourseList cl -- �������
                            on cl.courseList_seq = oc.courseList_seq
where oc.openCourse_seq = ����������ȣ;
--where oc.openCourse_seq = 1;


--���� ���� �ű� ����� �� �� �ֵ��� �Ѵ�.
insert into tblSubject (subject_seq, name, period, book_seq) values (subject_seq.nextVal, �����, ����Ⱓ, �����ȣ);


--���� ���� ���� �Է½� �����, ����Ⱓ(���� �����, �� �����), �����, ������� �Է��� �� �־�� �Ѵ�.
insert into tblSubject (subject_seq, name, period, book_seq) values (subject_seq.nextVal, �����, ����Ⱓ, �����ȣ);
insert into tblBook (book_seq, name, publisher) values (book_seq.nextVal, �����, ���ǻ�);
insert into tblTeacher (teacher_seq, name, ssn, tel) values (teacher_seq.nextVal, �����, �ֹι�ȣ, ��ȭ��ȣ);


--������� ���� ���� ������� ���������� �߰��� �� �־�� �Ѵ�.
insert into tblBook (book_seq, name, publisher) values (book_seq.nextVal, �����, ���ǻ�);

--������� ���� ��ܿ��� ���������� �߰��� �� �־�� �Ѵ�.
insert into tblTeacher (teacher_seq, name, ssn, tel) values (teacher_seq.nextVal, �����, �ֹι�ȣ, ��ȭ��ȣ);

--���� ����� ���� ����� ���� ���� ������ ��ġ�ϴ� ���� ��ܸ� ������ �Ѵ�.
select distinct t.name
    from tblSubjectSchedule ss --����������ȸ
        inner join tblSubject s -- ����
            on sc.subject_seq = s.subject_seq
                inner join tblAvlSubject avlS -- ���ɰ���
                    on avlS.subject_seq = s.subject_seq
                        inner join tblTeacher t --����
                            on avlS.teacher_seq = t.teacher_seq
                                inner join tblOpenCourse oc -- ��������
                                    on oc.opencourse_seq = sc.opencourse_seq
where ss.subject_seq = 13  -- ���� ���� ���� ����
and ss.subject_seq = avls.subject_seq; --���ǽ����� ���� �����ȣ(��������� ����) = ���� ���� ������ �����ȣ


--���� ���� ��½� ���� ���� ����(������, �����Ⱓ(���� �����, �� �����), ���ǽ�)�� �����, ����Ⱓ(���� �����, �� �����), �����, ������� ����Ѵ�.
select cl.name as ������, oc.startDate as ��������, oc.endDate as ������, r.name as ���ǽǸ�
    , s.name as �����, ss.startDate as �������, ss.endDate as ����, b.name as �����,t.name as �����
    from tblSubjectSchedule ss -- ����������ȸ
        inner join tblOpenCourse oc -- ��������
            on sc.openCourse_seq = oc.openCourse_seq
                inner join tblTeacherCourse tc -- ������
                    on tc.openCourse_seq = oc.openCourse_seq
                        inner join tblTeacher t -- ����
                            on t.teacher_seq = tc.teacher_seq
                                inner join tblRoom r -- ���ǽ�
                                    on r.room_seq = oc.room_seq
                                        inner join tblCourseList cl --�������
                                            on cl.courseList_seq = oc.courseList_seq
                                                inner join tblSubject s --����
                                                    on sc.subject_seq = s.subject_seq
                                                        inner join tblBook b --����
                                                            on b.book_seq = s.book_seq;
           
                                                            

--���� ���� ������ ���� �Է�, ���, ����, ���� ����� ����� �� �־�� �Ѵ�.
--����������ȸ tblSubjectSchedule(subjectSchedule_seq, subject_seq, startDate, endDate, openCourse_seq)
--1. ���� ���� �Է�
insert into tblsubjectSchedule (subjectSchedule_seq, subject_seq, startDate, endDate, openCourse_seq)
    values (subjectSchedule_seq.nextVal, �����ȣ, to_date('���������', 'yyyy-mm-dd'), to_date('����', 'yyyy-mm-dd'), ����������ȣ);

--2. ���� ���� ���
select subject_seq as �����ȣ, startDate as �������, endDate as ����, openCourse_seq as ����������ȣ
from tblSubjectSchedule;

--3. ���� ���� ����
update tblSubjectSchedule set �÷��� = �ٲܰ� where ����;

--4. ���� ���� ����
delete from tblSubjectSchedule where ����;




<�߰�����>
--������ ����(tblInterView) >����
--1. �Է�
insert into tblInterView (interview_seq, interviewDate, interviewResult, regiCourse_seq)
    values (interview_seq.nextVal, to_date('��-��-��', 'yyyy-mm-dd'),'�հ�' Ȥ�� '���հ�', ������û ��ȣ);
    
--2. ���
select �÷��� from tblInterView;

--3. ����
update tblInterView set �÷��� = �ٲ� �� where ����;

--4. ����
delete from tblInterView where ����;
																		