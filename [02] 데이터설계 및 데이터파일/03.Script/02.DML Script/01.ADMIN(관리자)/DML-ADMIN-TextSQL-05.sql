-- 1. ������ ? 4. ���� ��ȸ

-- 1. ������ - 4. ���� ��ȸ - a. ������ ���� ��ȸ
-- a. �������� ������(�������� PK�� �ѱ�)
-- DTO_ViewOpenCourse
SELECT oc.openCourse_seq as openCourse_seq, rownum, cl.name as courselistName, oc.startDate || '~' || oc.endDate as courseDuration, t.name as teacherName, r.Name as className
    FROM tblCourselist cl
        INNER JOIN tblOpenCourse oc
            ON cl.courselist_seq = oc.openCourse_seq
                INNER JOIN tblRoom r
                    ON oc.room_seq = r.room_seq
                        INNER JOIN tblTeacherCourse tc
                            ON tc.openCourse_seq = oc.openCourse_seq
                                INNER JOIN tblTeacher t
                                    ON tc.teacher_seq = t.teacher_seq;
                                    

-- b. �������� ���� ���������� ������,���������ȣ(PK)�� �Ѱ��� , ������Ͽ��θ� ��� ����?(grade�� ���� ���� 250���� ����)
-- DTO_ViewOpenSubject
SELECT ss.subjectschedule_seq as openSubject_seq, rownum, s.name as subjectName, ss.startDate || '~' || ss.endDate as subjectDuration
--    CASE
--            WHEN s.score is not null then 'O'
--            WHEN g.score is null then 'X'
--    END
        FROM tblOpenCourse oc
            INNER JOIN tblsubjectschedule ss
                ON oc.openCourse_seq = ss.openCourse_seq
                    INNER JOIN tblSubject s
                        ON ss.subject_seq = s.subject_seq
--                            INNER JOIN tblGrade g
--                                ON g.openSubjectMgmt_seq = osm.openSubjectMgmt_seq
--                                    WHERE oc.openCourse_seq = '�޾ƿ°���������ȣ';
                                    WHERE oc.openCourse_seq = 1;
                                    
                                    
                                    
-- ***************************************************************
-- b. �������� ���� ���������� ������,���������ȣ(PK)�� �Ѱ��� , ������Ͽ��θ� ��� ����?(grade�� ���� ���� 250���� ����)
-- DTO_ViewOpenSubject
SELECT  DISTINCT ss.subjectschedule_seq as openSubject_seq, s.name as subjectName, ss.startDate || '~' || ss.endDate as subjectDuration,
    CASE
            WHEN sc.scoresubjective is not null then 'O'
            WHEN sc.scoresubjective is null then 'X'
    END as ������Ͽ���    ,
    CASE
            WHEN e.question is not null then 'O'
            WHEN e.question is null then 'X'
    END as �����Ͽ���
        FROM tblOpenCourse oc
            INNER JOIN tblsubjectschedule ss
                ON oc.openCourse_seq = ss.openCourse_seq
                    INNER JOIN tblSubject s
                        ON ss.subject_seq = s.subject_seq
                            INNER JOIN tblscore sc
                                ON sc.subjectschedule_seq = ss.subjectschedule_seq
                                    INNER JOIN tblexam e
                                        on e.subjectschedule_seq = ss.subjectschedule_seq
--                                    WHERE oc.openCourse_seq = '�޾ƿ°���������ȣ';
                                    WHERE oc.openCourse_seq = 12;
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
-- c. ���� �ش��ϴ� �л����� ���������ֱ�
-- DTO_StudentGradesSubject
SELECT s.name as �����, oc.startDate || '~' || oc.endDate as courseDuration, oc.room_seq as ���ǽǸ�, t.name as �����, b.name as �����, stu.name as studentName, stu.ssn as �ֹι�ȣ, sc.scoresubjective as �ʱ�, sc.scoreobjective as �Ǳ� 
    FROM tblOpenCourse oc
            INNER JOIN tblsubjectschedule ss
                ON oc.openCourse_seq = ss.openCourse_seq
                    INNER JOIN tblSubject s
                        ON ss.subject_seq = s.subject_seq
                            INNER JOIN tblscore sc
                                ON sc.subjectschedule_seq = ss.subjectschedule_seq
                                    INNER JOIN tblRegiCourse rc
                                        ON sc.regiCourse_seq = rc.regiCourse_seq
                                            INNER JOIN tblStudent stu
                                                ON rc.student_seq = stu.student_seq
                                                    INNER JOIN tblcourselist cl
                                                        on cl.courselist_seq = oc.courselist_seq
                                                            INNER JOIN tblteachercourse tc
                                                                on tc.opencourse_seq = oc.opencourse_seq
                                                                    INNER JOIN tblteacher t
                                                                        on t.teacher_seq = tc.teacher_seq
                                                                            INNER JOIN tblbook b
                                                                                on b.book_seq = s.book_seq
                                                                            
--                                                    WHERE oc.openCourse_seq = '�޾ƿ°���������ȣ' and osm.openSubjectMgmt_seq = '�޾ƿ°��������ȣ';
                                                    WHERE oc.openCourse_seq = '13' and ss.subjectschedule_seq = '77';

-- 1. ������ - 4. ���� ��ȸ - b. �л��� ���� ��ȸ(�ش� ��ȣ ����, �л������� ���ڴ� ������2���̻��ϸ� ��ȣ�� ��ġ��, ������ȣ�� ���ڴ� �ǳʶٴ� ��ȣ�� ����,
-- �ڹٿ��� ��ȣ �����ְ� �ش� �л���ȣ�� �迭�� �־ �����൵��)
-- �л��� �������� ����� �����ֱ�
-- DTO_StudentsTakingCourses
SELECT rownum, s.name as studentName, s.ssn as studentssn, cl.name as courselistName, oc.startDate || '~' || oc.endDate as courseDuration, r.Name as className
    FROM tblStudent s
        INNER JOIN tblRegiCourse rc
            ON s.student_seq = rc.student_seq
                INNER JOIN tblOpenCourse oc
                    ON rc.openCourse_seq = oc.openCourse_seq
                        INNER JOIN tblCourseList cl
                            ON oc.courselist_seq = cl.courselist_seq
                                INNER JOIN tblRoom r
                                    ON oc.room_seq = r.room_seq
--                                        WHERE s.name = '�Է����л���';
                                        WHERE s.name = '������';
                                        
select * from tblstudent;                                        

-- 1. ������ - 4. ���� ��ȸ - b. �л��� ���� ��ȸ - �л�
-- a. �� �л��̸�
SELECT name
    FROM tblStudent
        WHERE student_seq = '�޾ƿ� �л���ȣ';

-- b. ����� ����Ⱓ ���� ���
-- DTO_StudentCourseGrades
SELECT sj.name as subjectName, t.name as �����, ss.startDate || '~' || ss.endDate as subjectDuration, sc.scoresubjective as �ʱ�, sc.scoreobjective as �Ǳ� 
    FROM tblStudent stu
        INNER JOIN tblRegiCourse rc
            ON stu.student_seq = rc.student_seq
                INNER JOIN tblScore sc
                    ON rc.regiCourse_seq = sc.regiCourse_seq
                        INNER JOIN tblsubjectschedule ss
                            ON sc.subjectschedule_seq = ss.subjectschedule_seq
                                INNER JOIN tblSubject sj
                                    ON ss.subject_seq = sj.subject_seq
                                     INNER JOIN tblOpenCourse oc
                                         ON rc.openCourse_seq = oc.openCourse_seq
                                            INNER JOIN tblteachercourse tc
                                                 on tc.opencourse_seq = oc.opencourse_seq
                                                     INNER JOIN tblteacher t
                                                          on t.teacher_seq = tc.teacher_seq                                                       
                                                              WHERE stu.student_seq = '�޾ƿ��л���ȣ';
--                                        WHERE stu.student_seq = '1';

select * from tblscore;
delete from tblscore;