SELECT ti.item_seq as �������ȣ, ti.name as �������, ti.itemqty as ���������, ti.room_seq as ���ǽ�
    FROM tblItem ti
        INNER JOIN tblroom tr
            ON tr.room_seq = ti.room_seq
                INNER JOIN tblCourselist cl
                    ON cl.Courselist_seq = ti.Courselist_seq                        
                        WHERE ti.room_seq = "�Է¹��� ���ǽ� ��ȣ";
                        --WHERE ti.room_seq = 1;
                        
SELECT ti.item_seq as �������ȣ, ti.name as �������, ti.itemqty as ���������, cl.name as ������
    FROM tblItem ti
        INNER JOIN tblroom tr
            ON tr.room_seq = ti.room_seq
                INNER JOIN tblCourselist cl
                    ON cl.Courselist_seq = ti.Courselist_seq                        
                        WHERE cl.courselist_seq = "�Է¹��� ������ȣ";      
                        --WHERE cl.courselist_seq = 1;         
                        
INSERT INTO tblItem
    VALUES(Item_seq.nextval, '�Է��� �������', '�Է��� �������', '���ǽǹ�ȣ', '������ȣ');                        
    

select * from tblscore;
select * from tblsupplement;