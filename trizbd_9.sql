-- Subject: Database development and protection technology
-- Language: SQL
-- Lesson: 9
-- Theme: Views, temporary tables, transactions
-- Name: Tulush Ertine
-- Group: 912

use vk;

-- ������� 1
-- �������� ������������ ������, ������� ����� �������� ���, email, ����� � ��� ����� ������������ � ����������� �� ���������� id

prepare userinfo
from 'select
		u.id, u.firstname, u.lastname,
		u.email, p.hometown, m.filename
	  from users u
		join profiles p on u.id = p.user_id
		join media m on u.id = m.user_id
	  where u.id = ?';
set @id_user = 1;
execute userinfo using @id_user;


-- ������� 2
-- �������� ��������� ������� ��� ���������� ���������� ������ �������� ���������� ( ������, �����, ����)



-- ������� 3
-- �������� �������������, � ������� ����� ���������� ��������������� �� ������� ���������������� �������� ( name = firstname+lastname, age(�������))



-- ������� 4
-- �������� �������������, � ������� ����� ���������� ��������������� �� ������� ����� �������������



-- ������� 5
-- �������� ����������, ������� ����� ������� ������ ������������: 
--  Jack Nicholson 22-04-1937 Neptune JackNIk@gmail.com +123456789
	
	
	
-- ������� 6
-- �������� ����������, ������� �������� ����� ������������ �� ����� Frederik Upton �� NewYork