---------------------------------------------------------------------------------------------------------------------------
1. �л��� �л� �������� �α��� �ؾ��Ѵ�	(400�� ������ �� ���Ƿ� ����)
*** �ڹ� ������ �� ����
---------------------------------------------------------------------------------------------------------------------------
select *
from tblstudent
where name = '�ֹ���'  				 --�ڹٷ� �̸� �Է¹ޱ�
    and substr(ssn,8,7) = '2598859'; 		 --�ڹٷ� �ֹι�ȣ �� 7�ڸ� �޾ƿ��� 700117-2598859


---------------------------------------------------------------------------------------------------------------------------
2. �α��� ���� �� ������ ���� ������ �������� ������ ������, ���� �Ⱓ(���� �����, �� �����, ���ǽ��� Ÿ��Ʋ�� ��µȴ�.
***����� �л� ��ȣ ���***
---------------------------------------------------------------------------------------------------------------------------
select s.name, s.ssn, s.tel, s.regidate, list.name as ������,  o.startDate, o.endDate, room.name   from tblStudent s    --�л� ���̺�
    inner join tblRegiCourse regi   --���� ��û ���̺�
        on s.student_seq = regi.student_seq
            inner join tblOpenCourse o  -- ���� ���� ���̺�
                on regi.opencourse_seq = o.openCourse_seq
                    inner join tblRoom room -- ���ǽ� ���̺�
                        on o.room_seq = room.room_seq
                                inner join tblCourseList list   -- ���� ��� ���̺�
                                    on list.courselist_seq = o.courselist_seq
                                where s.student_seq = 
                                  (select student_seq
                                    from tblstudent
                                        where name = '������'   
                                            and substr(ssn,8,7) = '1847454'); -- �α����� �л��� �л���ȣ


---------------------------------------------------------------------------------------------------------------------------
3. ���� ������ ���񺰷� ��� ���·� ���.
   ���� ��ȣ, �����, ���� �Ⱓ(����, ��), �����, �����, ���� ���� ����(���, �ʱ�, �Ǳ� ����), ���� ���� ����(���, �ʱ�, �Ǳ�����)
   , ���� ���賯¥, ���� ����
   ������ ��ϵ��� ���� ������ ���, ���� ������ ��µǰ� ������ null������ ��µǵ��� �Ѵ�.
---------------------------------------------------------------------------------------------------------------------------
select  s.name as �л���, score.score_seq,
        schedule.subject_seq as �����ȣ, sublist.name as �����, schedule.startdate||'~'||schedule.enddate as ����Ⱓ,
        book.name as �����, teacher.name as �����, spercent.percentSubjective as  "������ ����", spercent.percentObjective"�ְ��� ����"
        , spercent.percentAtt as "�⼮����",
        nvl(score.scoresubjective, null) as "������ ����", nvl(score.scoreobjective,null) as "�ְ��� ����", nvl(score.scoreatt,null)as "�⼮����" -- ���� null�� ��� null ���
        ,spercent.examdate,exam.question as "���蹮��"from tblStudent s      --�л� ���̺�
    inner join tblRegiCourse regi   --���� ��û ���̺� (regi)
        on s.student_seq = regi.student_seq
            inner join tblOpenCourse o -- ���� ���� ���̺�(o)
                on regi.opencourse_seq = o.opencourse_seq
                    inner join tblTeacherCourse tcourse -- ������ ���̺�(tcourse)
                        on o.opencourse_seq = tcourse.opencourse_seq
                            inner join tblTeacher teacher       --���� ���̺�(teacher)
                                on teacher.teacher_seq = tcourse.teacher_seq
                                    inner join tblCourseList list      --���� ��� ���̺�(list)
                                        on list.courselist_seq = o.courselist_seq
                                            inner join tblCourseSubject subject -- ������ ���� ���̺�(subject)
                                                on list.courseList_seq = subject.courselist_seq
                                                    inner join tblSubject sublist   -- ���� ���̺�(sublist)
                                                        on  subject.subject_seq = sublist.subject_seq
                                                            inner join tblbook book -- ���� ���̺�(book)
                                                                on sublist.book_seq = book.book_seq
                                                                    inner join tblsubjectschedule schedule  --���� ������ ���̺�(schedule)
                                                                        on o.opencourse_seq = schedule.opencourse_seq
                                                                            inner join tblScorePercent spercent --���� �����(spercent)
                                                                                on schedule.subjectschedule_seq = spercent.subjectschedule_seq
                                                                                    inner join tblExam exam -- �������̺�(exam)
                                                                                        on schedule.subjectschedule_seq = exam.subjectschedule_seq
                                                                                            inner join tblScore score   --���� ���̺�(score)
                                                                                                 on regi.regicourse_seq = score.regicourse_seq


where s.student_seq =          (select openCourse_seq from tblstudent s2
                                    inner join tblRegiCourse regi2
                                        on s2.student_seq = regi2.student_seq
                                            where name = '������'
                                                and  substr(ssn,8,7) = '1847454')and schedule.subject_seq = 8   --'�л���ȣ�� ����ִ� �������� ��ȣ'
                                                            order by sublist.name;




---------------------------------------------------------------------------------------------------------------------------
1. �л� ��ȣ�� ������û ��ȣ ���ϱ�
---------------------------------------------------------------------------------------------------------------------------
select * from tblstudent s
	inner join tblregicourse regi
		on s.student_seq = regi.student_seq
			where s.seq = 1;			--1�� �л��� ������ȣ ���ϱ�


---------------------------------------------------------------------------------------------------------------------------
2. �л�, ������û, ���� ������ inner join Table
---------------------------------------------------------------------------------------------------------------------------
select * from tblstudent s
    inner join tblregicourse regi
        on s.student_seq = regi.student_seq
            inner join tblScore score
                on regi.regicourse_seq = score.regicourse_seq 
                    where s.student_seq = 1;

---------------------------------------------------------------------------------------------------------------------------
3. ��������, ������, ����, ���ɰ��� inner join Table
---------------------------------------------------------------------------------------------------------------------------
select distinct ocourse.courselist_seq from tblopencourse ocourse
    inner join tblteachercourse tcourse
        on ocourse.opencourse_seq = tcourse.opencourse_seq
            inner join tblTeacher t
                on tcourse.teacher_seq = t.teacher_seq
                    inner join tblavlsubject able
                        on t.teacher_seq = able.teacher_seq
                           
                           --�л� ��ȣ�� 1�� �л��� �Ҽӵ� ���� ���� ��ȣ --> �л���ȣ�� �ڹٿ��� �޾ƿ�
                            where ocourse.opencourse_seq=(select regi.opencourse_seq from tblstudent s
                                               inner join tblregicourse regi
                                                  on s.student_seq = regi.student_seq
                                                        where s.student_seq = 1);

---------------------------------------------------------------------------------------------------------------------------
4. ���ɰ���, ����, ������ ����, �������, ���� inner join Table
---------------------------------------------------------------------------------------------------------------------------
***** �л���ȣ�� 1�� �н��� ����� ������ ������Ϲ�ȣ, ������, ������ ���� ��ȣ, �����ȣ..

select DISTINCT list.courselist_seq as ������Ϲ�ȣ, list.name as ������, csubject.coursesubject_seq as �����������ȣ, sub.name as �����ȣ,sub.subject_seq from tblavlsubject avl
    inner join tblsubject sub
        on sub.subject_seq = avl.subject_seq
            inner join tblbook book
                on sub.book_seq = book.book_seq
                    inner join tblcoursesubject csubject
                        on csubject.subject_seq = sub.subject_seq
                            inner join tblcourselist list
                                on list.courselist_seq = csubject.courselist_seq

				 --������ȣ�� �л���ȣ 1�� �л��� �Ҽӵ� ��ȣ�� �������
                                   where list.courselist_seq = (select distinct ocourse.courselist_seq from tblopencourse ocourse
                                      inner join tblteachercourse tcourse
                                        on ocourse.opencourse_seq = tcourse.opencourse_seq
                                            inner join tblTeacher t
                                              on tcourse.teacher_seq = t.teacher_seq
                                                  inner join tblavlsubject able
                                                      on t.teacher_seq = able.teacher_seq
				
							where ocourse.opencourse_seq=(select regi.opencourse_seq from tblstudent s
                                               inner join tblregicourse regi
                                                  on s.student_seq = regi.student_seq
                                                        where s.student_seq = 1));

---------------------------------------------------------------------------------------------------------------------------
5. ��������, ���������, ����, ���� inner join Table
---------------------------------------------------------------------------------------------------------------------------
select * from tblsubjectschedule schedule
    inner join tblscorepercent spercent
        on schedule.subjectschedule_seq = spercent.subjectschedule_seq
            inner join tblExam exam
                on schedule.subjectschedule_seq = exam.subjectschedule_seq
                    inner join tblScore score
                        on schedule.subjectschedule_seq = score.subjectschedule_seq
                            where schedule.opencourse_seq = 1;  --�ڹٿ��� �Է¹ޱ�(�ٸ� ���̺��� openCourse_seq�� ������)





































































