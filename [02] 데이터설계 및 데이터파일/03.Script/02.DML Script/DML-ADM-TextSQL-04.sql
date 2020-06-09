-- 1. ������ ? 7. �������� �� ��ȸ - a. �������� - a. �ϰ� ��ȸ �� ����
-- ��ȣ �л��� ����� ������ ����ó �⼮�� �����Ͻ� ����û ����(�⼮���̸� ���� ����ϴ���? ���� �̷��� ����? ���� ������, �⼮�� ���°� ����)
SELECT rownum, stu.name as studentName, t.name as teacherName, cl.name as courselistName, stu.tel as studentTel,  Ass.asdate as callasDate, Ass.asService as callasService
    FROM tblAs ass
        INNER JOIN tblRegiCourse rc
            ON ass.regiCourse_seq = rc.regiCourse_seq
                INNER JOIN tblOpenCourse oc
                    ON rc.openCourse_seq = oc.openCourse_seq
                        INNER JOIN tblCourselist cl
                            ON oc.courselist_seq = cl.courselist_seq
                                INNER JOIN tblTeacherCourse tc
                                    ON oc.openCourse_seq = tc.openCourse_seq
                                        INNER JOIN tblTeacher t
                                            ON tc.teacher_seq = t.teacher_seq
                                                INNER JOIN tblStudent stu
                                                    ON rc.student_seq = stu.student_seq;
select * from tblsubjectrating;
select *from tblattendance;
-- ������û ��ȣ ����(�迭)
SELECT as_seq FROM tblas;

-- �����ϱ�� �����ϱ�� �ش� ��û��¥�� ����ð� ������ �Ұ���
SELECT asDate FROM tblas WHERE as_seq = '�迭[�Է��ѹ�ȣ -1]'; -- ��û��¥
SELECT sysdate FROM dual; -- ���� ��¥

-- �����ϱ�
UPDATE tblas SET asDate = '�Է��� ��û��¥', asService = '�Է��� ��û����'
    WHERE as_seq = '�迭[�Է��ѹ�ȣ-1]';

-- �����ϱ�
DELETE FROM tblas WHERE as_seq = '�迭[�Է��ѹ�ȣ-1]';



-- 1. ������ ? 7. ���� ���� �� ��ȸ - a. �������� - b. ���纰 ��ȸ �� ���� (53��)
-- a. ���������Ⱓ��ȣ(PK) �迭�� ����
SELECT openCourse_seq FROM tblOpenCourse;

-- b. ��±���
SELECT rownum, cl.name as courselistName, oc.startDate || '~' || oc.endDate as coureseDuration, t.name as teacherName, r.Name as className
    FROM tblCourselist cl
        INNER JOIN tblOpenCourse oc
            ON cl.courselist_seq = oc.openCourse_seq
                INNER JOIN tblRoom r
                    ON oc.room_seq = r.room_seq
                        INNER JOIN tblTeacherCourse tc
                            ON oc.openCourse_seq = tc.openCourse_seq
                                INNER JOIN tblTeacher t
                                    ON tc.teacher_seq = t.teacher_seq;

select * from tblcourselist;

-- 1. ������ ? 7. �������� �� ��ȸ - a. �������� - b. ���纰 ��ȸ �� ���� ? 1.����(����������ȣPK�� �Ѿ��)
-- �����̸�
SELECT t.name as teacherName
    FROM tblTeacher t
        INNER JOIN tblTeacherCourse tc
            ON t.teacher_seq = tc.teacher_seq
                INNER JOIN tblOpenCourse oc
                    ON tc.openCourse_seq = oc.openCourse_seq
                        WHERE oc.openCourse_seq = '����������ȣPK�� ����� �迭[�Է��ѹ�ȣ-1]';

-- ������
SELECT cl.name as courselistName
    FROM tblCourselist cl
        INNER JOIN tblOpenCourse oc
            ON cl.courselist_seq = oc.courselist_seq
                WHERE oc.openCourse_seq = '����������ȣPK�� ����� �迭[�Է��ѹ�ȣ-1]';

-- ��ȣ, �л���, ����ó,  ������, ��������
SELECT rownum, stu.name as studentName, stu.tel as studentTel, ass.asDate as callasDate, ass.asservice as callasservice, ass.aslist as callaslist
    FROM tblStudent stu
        INNER JOIN tblRegiCourse rc
            ON stu.student_seq = rc.student_seq
                INNER JOIN tblAS ass
                    ON rc.regiCourse_seq = ass.regiCourse_seq
                        INNER JOIN tblOpenCourse oc
                            ON oc.openCourse_seq = rc.openCourse_seq
--WHERE oc.openCourse_seq = '13';
                                WHERE oc.openCourse_seq = '����������ȣPK�� ����� �迭[�Է��ѹ�ȣ-1]';

-- ������ȣ(PK) �迭�� ����
SELECT ass.as_seq as asNumber
    FROM tblStudent stu
        INNER JOIN tblRegiCourse rc
            ON stu.student_seq = rc.student_seq
                INNER JOIN tblAs ass
                    ON rc.regiCourse_seq = ass.regiCourse_seq
                        INNER JOIN tblOpenCourse oc
                            ON oc.openCourse_seq = rc.openCourse_seq
--WHERE oc.openCourse_seq = '1';
                                WHERE oc.openCourse_seq = '����������ȣPK�� ����� �迭[�Է��ѹ�ȣ-1]';

-- �����ϱ�
UPDATE tblas SET asDate = '�Է��� ��û��¥', asservice = '�Է��� ��û����'
    WHERE as_seq = '������ȣ(PK) �迭[�����ѹ�ȣ-1]';

-- �����ϱ�
DELETE FROM tblas
    WHERE as_seq = '������ȣ(PK) �迭[�����ѹ�ȣ-1]';


-- 1. ������ ? 7. ���� ���� �� ��ȸ - a. ���� ���� ? c. �л��� ��ȸ �� ���� - �˻�
-- �л��� �Է¹���
-- �л��� �ֹι�ȣ���ڸ� ��ȭ��ȣ ����� ����(��û)Ƚ�� ����Ƚ���� �л���ȣ ����
SELECT rownum, stu.name as studentName, stu.ssn as studentPw, stu.tel as studentTel, ass.asDate as callasDate
    FROM tblStudent stu
        INNER JOIN tblRegiCourse rc
            ON stu.student_seq = rc.student_seq
                INNER JOIN tblAs ass
                    ON rc.regiCourse_seq = ass.regiCourse_seq
                        WHERE stu.name = '�Է��� �̸���';
                        
select * from tblas;                        

-- ������ȣ(PK) �迭�� �����ϱ�
SELECT ass.as_seq as asNumber
    FROM tblStudent stu
        INNER JOIN tblRegiCourse rc
            ON stu.student_seq = rc.student_seq
                INNER JOIN tblAs ass
                    ON rc.regiCourse_seq = ass.regiCourse_seq
                        WHERE stu.name = '�Է��� �̸���';


-- 1. ������ ? 7. ���� ���� �� ��ȸ - a. ���� ���� ? c. �л��� ��ȸ �� ���� ? �˻� ? ��ȸ �� ����
-- �Է��� �л��� ���
-- ������
SELECT cl.name as courselistName
    FROM tblCourselist cl
        INNER JOIN tblOpenCourse oc
            ON cl.courselist_seq = oc.courselist_seq
                INNER JOIN tblRegiCourse rc
                    ON oc.openCourse_seq = rc.openCourse_seq
                        INNER JOIN tblAs ass
                            ON rc.regiCourse_seq = ass.regiCourse_seq
                                WHERE ass.consult_seq = '�迭[�Է¹�����ȣ-1]';

-- ���� ���, �⼮���̶� �й� ����
SELECT rownum, stu.name as studentName, stu.tel as studentTel,  ass.asDate as callasDate, ass.asservice as callasservice
    FROM tblAs ass
        INNER JOIN tblRegiCourse rc
            ON ass.regiCourse_seq = rc.regiCourse_seq
                INNER JOIN tblOpenCourse oc
                    ON rc.openCourse_seq = oc.openCourse_seq
                        INNER JOIN tblCourselist cl
                            ON oc.courselist_seq = cl.courselist_seq
                                INNER JOIN tblStudent stu
                                    ON stu.student_seq = rc.student_seq
                                        WHERE ass.as_seq = '�迭[�Է¹�����ȣ-1]';

-- �����ϱ�(��û��ȣ�� �����ϱ�, �̹� �տ��� �޾ƿ���)
UPDATE tblAs SET asDate = '�Է¹��� ��û��¥', asservice = '�Է¹��� ��û����'
    WHERE as_seq = '�迭[�Է¹�����ȣ-1]';

-- �����ϱ�(��û��ȣ�� �����ϱ�, �̹� �տ��� �޾ƿ�
DELETE FROM tblAs
    WHERE as_seq = '�迭[�Է¹�����ȣ-1]';
    
    
_