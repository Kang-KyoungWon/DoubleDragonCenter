--������ DML

--�����ڴ� ���� ���� ���� �� ���� ����, ���� ���� ����ϰԵ� ���� ������ ��� �� ������ �� �־�� �Ѵ�.
--���� �������� ������, �����, ���ǽǸ�(���� ����), �����(���ǻ�� ����) ���� ���Եȴ�.

--1. ���� ���� ����(id:�̸�, pw:�ֹι�ȣ���ڸ�)
select * from tblTeacher;
--1-1. ���� ������ ���� �̸�, �ֹι�ȣ ���ڸ�, ��ȭ��ȣ, ���� ���� ������ �⺻���� ����ϰ�, �ֹι�ȣ ���ڸ��� ���� ������ �α��ν� �н������ ���ǵ��� �Ѵ�.
insert into tblTeacher values (teacher_seq.nextVal,'�̸�','�ֹι�ȣ','��ȭ��ȣ');
--1-2. ������ ���� ���� ������ ���� ���� ������� �̿��ؼ� ���������� �߰��� �� �־�� �Ѵ�.
select * from tblSubject; --���� ���� �����
create or replace procedure procAddAvlSubject(
    pteacherNum number,
    psubjectName varchar2
)
is
    vsubjectNum tblsubject.subject_seq%type;
begin
    select subject_seq into vsubjectNum from tblSubject where name = psubjectName;
    insert into tblAvlSubject values(avlSubject_seq.nextVal,pteacherNum,vsubjectNum);
end;

begin
    procAddAvlSubjet(�����ȣ,'�����̸�');
end;

--1-3.a ���� ���� ��½� ���� ��ü ����� �����, �ֹι�ȣ ���ڸ�, ��ȭ��ȣ, ���� ���� ������ ����ϰ�, 
SELECT teacher_seq,name, substr(ssn,8), tel,(SELECT LISTAGG(s.name, ',') WITHIN GROUP (ORDER BY s.name) as tAvlSubject
    FROM tblTeacher t
        INNER JOIN tblAvlSubject a
            ON t.teacher_seq = a.teacher_seq 
                    INNER JOIN tblSubject s
                        ON a.subject_seq = s.subject_seq
                                where t.teacher_Seq = 1)
        FROM tblTeacher;

--1-3.b Ư�� ���縦 ������ ��� ������ ���� �����, ���� ����Ⱓ(���� �����, �� �����), ������, ���� �����Ⱓ(���� �����, �� �����), 
--�����, ���ǽ�, �������࿩��(���� ����, ������, ��������)�� Ȯ���� �� �־�� �Ѵ�.
--�������࿩�δ� ��¥�� �������� Ȯ���Ѵ�.
--������
select rownum, cll.name, oc.startDate, oc.endDate, oc.countStudent, oc.room_seq
    from tblTeacher t inner join tblTeacherCourse tc on t.teacher_seq = tc.teacher_seq
        inner join tblOpenCourse oc on tc.opencourse_seq = oc.opencourse_seq
            inner join tblCourseList cll on oc.courselist_seq = cll.courselist_seq
                where t.teacher_seq = '�����ȣ';
--where t.teacher_seq = '1';

--�����
select s.name as subjectName, ss.startdate, ss.enddate, b.name
    from tblTeacher t inner join tblTeacherCourse tc on t.teacher_seq = tc.teacher_seq
        inner join tblOpenCourse oc on tc.opencourse_seq = oc.opencourse_seq
            inner join tblCourseList cll on oc.courselist_seq = cll.courselist_seq
                inner join tblCourseSubject cs on cll.courselist_seq = cs.courselist_seq
                    inner join tblSubject s on cs.subject_seq = s.subject_seq
                        inner join tblbook b on s.book_seq = b.book_seq
                            inner join tblSubjectSchedule ss on s.subject_seq = ss.subject_seq
                                where t.teacher_seq = '�����ȣ' and cll.courselist_seq = '������ ������ȣ' and oc.opencourse_seq= '����������ȣ'
                                --where t.teacher_seq = '1' and cll.courselist_seq = '1' and oc.opencourse_seq= '11'
                                     and oc.enddate>=ss.enddate and oc.startdate<=ss.startdate;

--1-4.���� ������ ���� �Է�, ���, ����, ���� ����� ����� �� �־�� �Ѵ�.
--���� ���� ���
select * from tblTeacher where teacher_seq = '�Է¹��� ��ȣ' ;
--���� ���� ����
update tblTeacher set name='��',ssn='��',tel='��' where teacher_seq = '������ ��ȣ';
--���� ���� ����
delete from tblTeacher where teacher_seq = '������ �����ȣ';
--���� ���� �Է�
insert into tblTeacher (teacher_seq,name,ssn,tel) values (teacher_seq.nextVal, '�̸�','�ֹι�ȣ','��ȭ');

--2. ���� ��
--���������� ���� �����ֱ�
select cll.name as ������, s.name as �����
from tblOpenCourse oc inner join tblCourseList cll on oc.courselist_seq = cll.courselist_seq
    inner join tblCourseSubject cs on cll.courselist_seq = cs.courselist_seq
        inner join tblSubject s on cs.subject_seq = s.subject_seq
            where oc.opencourse_seq = '����������ȣ';
--            where oc.opencourse_seq = 13;

--2-1 ������ ��ȸ + ��� ����
select s.name,round(avg(sr.retingScore),1) as ���
    from tblSubjectRating sr inner join tblsubjectschedule ss on sr.subjectschedule_seq = ss.subjectschedule_seq
        inner join tblSubject s on ss.subject_seq = s.subject_seq
--            where s.name = '�����'
--            where s.name = 'Back-end ����'
                group by s.name;

select avg(retingScore) from tblSubjectRating;
select * from tblSubjectRating;



select * from tblSubjectSchedule;
--2-2 ������ ��ȸ + ��� ����

create or replace view viewCourseRating
as
select cll.name, round(avg(sr.retingScore),1) as ���
    from tblSubjectRating sr inner join tblsubjectschedule ss on sr.subjectschedule_seq = ss.subjectschedule_seq
        inner join tblOpenCourse oc on ss.opencourse_seq = oc.opencourse_seq
            inner join tblCourseList cll on oc.courselist_seq = cll.courselist_seq
                group by cll.name;

select *
from tblOpenCourse oc inner join tblCourseList cll on oc.courselist_seq = cll.courselist_seq;

select * from tblCourseList;

--3. �����н�
--3-1. �����н� ��ȸ
select * from tblsupplement;

select sp.suppledate, sc.scoreresult,s.name
from tblSupplement sp inner join tblScore sc on sp.score_seq=sc.score_seq
inner join tblRegiCourse rc on sc.regicourse_seq = rc.regiCourse_seq
inner join tblStudent s on rc.student_seq = s.student_seq
where sc.scoreresult = '����';

--3.2 Ư�� ������ ���� ��½� �����н� ����
select sp.suppledate, sc.scoreresult,s.name
from tblSupplement sp inner join tblScore sc on sp.score_seq=sc.score_seq
inner join tblRegiCourse rc on sc.regicourse_seq = rc.regiCourse_seq
inner join tblStudent s on rc.student_seq = s.student_seq
where s.student_seq = '��������ȣ' and sc.scoreresult = '����';
--where s.student_seq = 21 and sc.scoreresult = '����';

--3.2 Ư�� �������� ���ý� �����н��� �л��� ��ȸ
select sp.suppledate, sc.scoreresult,s.name
from tblSupplement sp inner join tblScore sc on sp.score_seq=sc.score_seq
inner join tblRegiCourse rc on sc.regicourse_seq = rc.regiCourse_seq
inner join tblStudent s on rc.student_seq = s.student_seq
where sc.scoreresult = '����' and rc.opencourse_seq = '����������ȣ';
--where sc.scoreresult = '����' and rc.opencourse_seq = 1;


