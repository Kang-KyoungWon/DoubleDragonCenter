-- 1. ������ - 3. �л� ���� - a. �л� ���� ��ü����
-- a. �л���, �ֹι�ȣ, ��ȭ��ȣ, �����, ������ûȽ��
-- DTO_Student
SELECT name, ssn, tel, regiDate,
    (SELECT COUNT(*) 
        FROM tblStudent s
            INNER JOIN tblRegiCourse rc
                ON s.student_seq = rc.student_seq
                    WHERE s.student_seq = '�ڹٿ���for������ ��������') as numberCourseRequests
                        FROM tblStudent;

-- �ڹٿ��� for�� ���� ����
-- DTO_Student
SELECT COUNT(*) as numberStudent FROM tblStudent;

-- 1. ������ ? 3. �л� ���� - b. �л� ���� ��� (�л���, �ֹι�ȣ, ��ȭ��ȣ, �����)
-- DTO_Student
INSERT INTO tblStudent
    VALUES(student_seq.nextval, '�Է��� �л���', '�Է��� �ֹι�ȣ', '�Է��� ��ȭ��ȣ', sysdate);

-- �л���� �ֹι�ȣ�� ���ÿ� �ش� �л� ���̺� �����ϴ°� ������ ��Ͼȵ�
-- DTO_Student
SELECT name, ssn FROM tblStudent;

select * from tblattendance;

-- 1. ������ ? 3. �л� ���� - c. �л� ���� �˻� �� ���� (������ �ش� �л� PK��ȣ �����ؼ� �������� �Ѱ���)
-- a. �̸� �˻�
-- ������û
-- DTO_Student
SELECT student_seq FROM tblStudent WHERE name = '�Է��л���'; -- ������ ����

-- DTO_Student
SELECT rownum, s.name as studentName, s.ssn as studentssn, s.tel as studentTel, s.regidate as studentRegidate, 
    (SELECT COUNT(*) 
        FROM tblStudent s
            INNER JOIN tblRegiCourse rc
                ON s.student_seq = rc.student_seq
                    WHERE s.student_seq = '������ ������ �����Ѱ��� �ϳ��� ����') as numberCourseRequests
                        FROM tblStudent  s
                            WHERE name = '�Է��л���';

-- b. �ֹι�ȣ �˻�
-- DTO_Student
SELECT student_seq FROM tblStudent WHERE name = '�Է��ֹι�ȣ'; -- ������ ����

-- DTO_Student
SELECT student_seq, name, ssn, tel, regidate,
    (SELECT COUNT(*) 
        FROM tblStudent s
            INNER JOIN tblRegiCourse rc
                ON s.student_seq = rc.student_seq
                    WHERE s.student_seq = '������ ������ �����Ѱ��� �ϳ��� ����') as numberCourseRequests
                        FROM tblStudent 
                            WHERE ssn = '�Է��ֹι�ȣ';

-- c. ��ȭ��ȣ �˻�
-- ������û
-- DTO_Student
SELECT student_seq FROM tblStudent WHERE name = '�Է���ȭ��ȣ'; -- ������ ����

-- DTO_Student
SELECT student_seq, name, ssn, tel, regidate,
    (SELECT COUNT(*) 
        FROM tblStudent s
            INNER JOIN tblRegiCourse rc
                ON s.student_seq = rc.student_seq
                    WHERE s.student_seq = '������ ������ �����Ѱ��� �ϳ��� ����') as numberCourseRequests
                        FROM tblStudent 
                            WHERE tel = '�Է���ȭ��ȣ';

-- d. ����� �˻�
-- ������û
-- DTO_Student
SELECT student_seq FROM tblStudent WHERE name = '�Էµ����'; -- ������ ����

-- DTO_Student
SELECT student_seq, name, ssn, tel, regidate,
    (SELECT COUNT(*) 
        FROM tblStudent s
            INNER JOIN tblRegiCourse rc
                ON s.student_seq = rc.student_seq
                    WHERE s.student_seq = '������ ������ �����Ѱ��� �ϳ��� ����') as numberCourseRequests
                        FROM tblStudent 
                        WHERE regidate = '�Էµ����';

select * from tblregicourse;



-- a. �����ϱ�(�����ϱ� ���� �Է��� �л���� �ֹι�ȣ �Ѵ� ��ġ�ϴ� ����� ������ �����Ұ�)
-- DTO_Student
SELECT name, ssn FROM tblStudent; -- �迭�̳� ����Ʈ�� �ְ� �ϳ��� ��

-- ���ǿ� �����ϸ�
-- DTO_Student
UPDATE tblStudent 
    SET name = '�Է����̸�', ssn = '�Է��� �ֹι�ȣ', tel = '�Է�����ȭ��ȣ'
        WHERE student_seq = '�޾ƿ¹�ȣ��';


--  1. ������ ? 3. �л� ���� - c. �л� ���� �˻� �� ���� ? (�˻���) ? ���� ���ý�
-- b. �����ϱ�
-- DTO_Student
DELETE FROM tblStudent WHERE student_seq = '�޾ƿ¹�ȣ��';



----------------------------------------------------------
-- 1. ������ ? 5. ��� ���� �� �����ȸ - a. �л��� ��ȸ �� ����
SELECT rownum, s.name as studentName, s.ssn as studentssn, cl.name as courselistName, oc.startDate || '~' || oc.endDate as courseDuration, r.Name as className
    FROM tblStudent s
        INNER JOIN tblRegiCourse rc
            ON s.student_seq = rc.student_seq
                INNER JOIN tblOpenCourse oc
                    ON rc.openCourse_seq = oc.openCourse_seq
                        INNER JOIN tblCourselist cl
                            ON oc.courselist_seq = cl.courselist_seq
                                INNER JOIN tblRoom r
                                    ON oc.room_seq = r.room_seq
                                        WHERE s.name = '�л��� �Է� : ';
--                                        WHERE s.name = '������';
                                        
select * from tblstudent;                                        

-- �л���ȣ ������ ���� �л� ��ȣ ��ȸ
SELECT s.student_seq as studentNumber
    FROM tblStudent s
        INNER JOIN tblRegiCourse rc
            ON s.student_seq = rc.student_seq
                INNER JOIN tblOpenCourse oc
                    ON rc.openCourse_seq = oc.openCourse_seq
                        INNER JOIN tblCourselist cl
                            ON oc.courselist_seq = cl.courselist_seq
                                INNER JOIN tblRoom r
                                    ON oc.room_seq = r.room_seq
                                        WHERE s.name = '�Է¹��� �л���';
--                                        WHERE s.name = '������';                                        


-- 1. ������ ? 5. ��� ���� �� �����ȸ - a. �л��� ��ȸ ? �л� ���ý�(�տ��� �л���ȣ�� ��ȸ�Ⱓ ������, �������� �޾ƿ�)
-- �Ⱓ : �Է¹��� ������ ~ �Է¹��� ������
-- �̸�
SELECT name
    FROM tblStudent
        WHERE student_seq = '�޾ƿ� �л���ȣ';

select * from tblattendance;
-- ��¥, ��ٽð�, ��ٽð�, ���»�Ȳ
SELECT am.workOn as attendanceDay, to_char(am.workOn, 'hh24:mi') as commuteTime, to_char(am.workOff, 'hh24:mi') as quittingTime, am.state as attendanceSituation
    FROM tblAttendance am
        INNER JOIN tblRegiCourse rc
            ON am.regiCourse_seq = rc.regiCourse_seq
                WHERE rc.student_seq = '�޾ƿ� �л���ȣ' AND workOn BETWEEN to_date('�޾ƿ� ������','yyyy-mm-dd') AND to_date('�޾ƿ� ������','yyyy-mm-dd');

--�Է¹��� �л� ��ȣ�� ������û ��ȣ(�ڹ� ������ ����)
SELECT rc.regiCourse_seq as enrollmentNumbers
    FROM tblStudent s
        INNER JOIN tblRegiCourse rc
            ON s.student_seq = rc.student_seq
                INNER JOIN tblOpenCourse oc
                    ON oc.openCourse_seq = rc.openCourse_seq
                        WHERE s.student_seq = '�Է¹��� �л� ��ȣ' 
                            AND oc.openCourse_seq = '�Է¹��� ����������ȣ';

-- �����ϱ�
UPDATE tblattendance 
    SET state = '��ĥ����'
        WHERE to_char(ad.workon, 'YYYY-MM-DD') = '�Է¹��� ��ȸ��¥' and regicourse_seq = '���� ��û��ȣ';
        
        




select * from tblteachercourse;
-- 1. ������ ? 5. ��� ���� �� �����ȸ - b. ������ ��ȸ
-- a. ������ȣ ������ �����Ⱓ ����� ���ǽ�(����������ȣ,��ȸ�Ⱓ �Է¹޾� �Ѱ���)
select rownum, cl.name as courselistName, oc.startdate || ' ~ ' || oc.enddate as courseDuration, t.name as teacherName, r.name as className 
    from tblopencourse oc
        inner join tblteachercourse tc
            on tc.opencourse_seq = oc.opencourse_seq
                inner join tblteacher t
                    on t.teacher_seq = tc.teacher_seq
                        inner join tblcourselist cl
                            on cl.courselist_seq = oc.courselist_seq
                                inner join tblroom r
                                    on r.room_seq = oc.room_seq;
select * from tblcourselist;

--������ȣ �Է��� ���� ������ ����������ȣ(�ڹٿ� ����)
select oc.courselist_seq as openingCourseNumber
    from tblopencourse oc
        inner join tblteachercourse tc
            on tc.opencourse_seq = oc.opencourse_seq
                inner join tblteacher t
                    on t.teacher_seq = tc.teacher_seq
                        inner join tblcourselist cl
                            on cl.courselist_seq = oc.courselist_seq
                                inner join tblroom r
                                    on r.room_seq = oc.room_seq;

--�Է¹��� ��¥(�ڹ� ������ �����ؾ���)


--�Է¹��� ��¥�� ���� ��� ����
--�й� �л��� ��ٽð� ��ٽð� ���»�Ȳ(�������� �л��̸��� ��ĥ �� �ֱ⶧���� �л���ȣ�� �ٲ�ߵ�)
--*********************************���̺� ������ �ٽ����� *****************************************
select  rownum, s.name as studentName, to_char(ad.workon, 'hh24:mm') as commuteTime, to_char(ad.workoff, 'hh24:mm') as quittingTime, ad.state as attendanceSituation
    from tblstudent s
        inner join tblregicourse rc
            on s.student_seq = rc.student_seq
                inner join tblopencourse oc
                    on oc.opencourse_seq = rc.opencourse_seq
                        inner join tblattendance ad
                            on ad.regicourse_seq = rc.regicourse_seq
                                where oc.opencourse_seq = 13
                                      and to_char(ad.workon, 'YYYY-MM-DD') = '�Է¹��� ��ȸ��¥';
--                                    and to_char(ad.workon, 'YYYY-MM-DD') = '2020-01-06';
--                                where oc.opencourse_seq = '�Է¹��� ����������ȣ'
--                                    and ad.workOn = to_date('�Է¹��� ��ȸ��¥''yyyy-mm-dd');

select * from tblopencourse;

select * from tblstudent;

select * from tblattendance order by attendance_seq;
 

--�Է¹��� �л���ȣ(�ڹ� ������ ����)
select s.student_seq as stdentNumber
    from tblstudent s
        inner join tblregicourse rc
            on s.student_seq = rc.student_seq
                inner join tblopencourse oc
                    on oc.opencourse_seq = rc.opencourse_seq
                        inner join tblattendance ad
                            on ad.regicourse_seq = rc.regicourse_seq
                                where oc.opencourse_seq = '�Է¹��� ����������ȣ'
                                    and to_char(ad.workon, 'YYYY-MM-DD') = '�Է¹��� ��ȸ��¥';
                                    

--�Է¹��� �л� ��ȣ�� ������û ��ȣ(�ڹ� ������ ����)
SELECT rc.regiCourse_seq as enrollmentNumbers
    FROM tblStudent s
        INNER JOIN tblRegiCourse rc
            ON s.student_seq = rc.student_seq
                INNER JOIN tblOpenCourse oc
                    ON oc.openCourse_seq = rc.openCourse_seq
                        WHERE s.student_seq = '�Է¹��� �л� ��ȣ' 
                            AND oc.openCourse_seq = '�Է¹��� ����������ȣ';
                            
                            

                            
