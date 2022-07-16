clear screen;

-- dropping tables

DROP TABLE Chef CASCADE CONSTRAINTS;
DROP TABLE Contestents CASCADE CONSTRAINTS;
DROP TABLE List CASCADE CONSTRAINTS;
DROP TABLE Admin CASCADE CONSTRAINTS;

------Chef TABLE-------
CREATE TABLE Chef
(
	Chef_id number PRIMARY KEY,
	Name varchar2(30),
	Speciality varchar2(30),
	Experience number,
	C_phoneNumber varchar2(11)
);
	
------ Contestents TABLE-------
create table Contestents(
	C_id number PRIMARY KEY,
	C_Name varchar2(30),
	Address varchar2(50),
	PhoneNumber varchar2(11),
	Receipe_name varchar2(30),
	Ratings varchar2(10),
	Category varchar2(20)
);	

-------List TABLE--------
create table List(
	C_id number,
	Chef_id number,
		FOREIGN KEY(C_id) REFERENCES Contestents(C_id),
		FOREIGN KEY(Chef_id) REFERENCES Chef(Chef_id)
);

-------Admin TABLE--------
create table Admin(
	Admin_id number,
	A_Name varchar2(20),
	A_Email varchar2(50),
	A_PhoneNumber varchar2(11)
);
		
	
------insert data in Chef table-------	

insert into Chef values(1, 'Pangkaj', 'Thai', 5 , '01882554298');
insert into Chef values(6, 'Farin', 'Italian', 5 , '01855284298');
insert into Chef values(8, 'Ayesha', 'Chinese', 2 , '01482567094');
insert into Chef values(10, 'Arya', 'Italian', 5 , '01978663298');
insert into Chef values(11, 'Bolt', 'Thai', 4 , '01558239518');
insert into Chef values(12, 'Lin yi', 'Chinese', 5 , '01645874743');
insert into Chef values(13, 'Xiao Xue', 'Chinese', 3 , '01463463674');
insert into Chef values(15, 'Frin Guo', 'Italian', 4 , '01909864374');
insert into Chef values(2, 'Abdul', 'Bangladeshi', 4 , '01872554571');
insert into Chef values(3, 'saiful', 'Bangladeshi', 5, '01974554298');
insert into Chef values(4, 'Sarfaraj', 'Indian', 3 , '01342574298');
insert into Chef values(5, 'Sadman', 'Bangladeshi', 5, '01676789980');
insert into Chef values(7, 'Mehnaz', 'Indian', 5 , '01582554298');
insert into Chef values(9, 'Onnorupa', 'Indian', 5 , '01867093452');
insert into Chef values(14, 'Faizal', 'Bangladeshi', 5 , '01668845321');



--insert data into Contestents table	
insert into Contestents values(11,'Abrar', 'Sylhet', '01858765637', 'Gnocchi', '5 star', 'selected');
insert into Contestents values(13,'Safera', 'Bandorban', '01858727874', 'Century Egg', '2 star', 'selected');
insert into Contestents values(18,'Tahiyah', 'Savar', '01526253373', 'Soy Egg', '4 star', 'selected');
insert into Contestents values(19,'Abdul', 'Comilla', '01922636373', 'SeaFood Coconut Curry', '4 star', 'Not selected');
insert into Contestents values(21,'Manish', 'Safipur', '01455623373', 'Pasta', '5 star', 'selected');
insert into Contestents values(22,'Ahem', 'chapainobabgonj', '01686263337', 'Kung Pao chicken', '5 star', 'selected');
insert into Contestents values(24,'Saiyara', 'soyedpur', '01186463643', 'Stir-fried glass noodles', '5 star', 'selected');
insert into Contestents values(26,'JJ', 'Narayangonj', '01778337333', 'Peking roasted duck', '5 star', 'selected');
insert into Contestents values(40,'Meher', 'Feni', '01456789021', 'Risotto', '5 star', 'selected');
insert into Contestents values(44,'Sabit', 'Uttara', '01334579819', 'Pizza', '5 star', 'Not selected');
insert into Contestents values(42,'Naimun', 'Rumpura', '01661130650', 'Lasagne', '5 star', 'selected');
insert into Contestents values(9,'Shirpa', 'Shanti nogor', '01534627637', 'Haleem', '5 star', 'Not selected');
insert into Contestents values(8,'Bell', 'Rumpura', '01736476373', 'Kabab', '3 star', 'selected');
insert into Contestents values(3,'Aiyra', 'Old town', '01974754790', 'Kachchi Biryani', '5 star', 'selected');
insert into Contestents values(10,'Salman', 'Islampur', '01864434364', 'Elish Polao', '4 star', 'Not selected');
insert into Contestents values(15,'Sehresh', 'CoxsBazar', '01847464743', 'Fuchka', '5 star', 'selected');
insert into Contestents values(17,'Taheraa', 'Nabinagor', '01887276373', 'Rajkachuri', '5 star', 'selected');
insert into Contestents values(27,'Joe', 'Malibag', '01582327812', 'Borhani', '5 star', 'selected');
insert into Contestents values(29,'Zheng', 'Rangpur', '01362398265', 'Palak paneer', '2 star', 'Not selected');
insert into Contestents values(30,'Huan', 'Vola', '01799636255', 'Patla khichuri', '5 star', 'selected');
insert into Contestents values(39,'Taushin', 'Kolkata', '01990734223', 'Chana masala', '4 star', 'Not selected');
insert into Contestents values(41,'Li man', 'Kurigram', '01989020373', 'Achaar', '3 star', 'selected');

-----insert data into List table--------	
insert into List values(8,5);
insert into List values(26,9);
insert into List values(13,15);
insert into List values(15,3);
insert into List values(30,4);
insert into List values(42,1);
insert into List values(10,14);
insert into List values(17,9);
insert into List values(29,4);
insert into List values(22,12);
insert into List values(21,15);
insert into List values(42,6);
insert into List values(26,8);
insert into List values(19,11);


------insert data into Admin Table------
insert into Admin values(1,'Jannat', 'jannatul1234@gmail.com', '01661130650');


commit;

--UNION--
select * from Chef;
--select * from Chef@site1;
 
select * from Admin ;

SET SERVEROUTPUT ON;
SET VERIFY OFF;

-----TO CANCEL FROM THE LIST-----
ACCEPT X NUMBER PROMPT 'Enter Chef Id: '
ACCEPT Y CHAR PROMPT 'Enter Contestents Id: '


CREATE OR REPLACE PROCEDURE App_info(A in List.Chef_id%TYPE, B in List.C_id%TYPE)
IS
flag int;
BEGIN
	flag:= account_search(A,B);
	IF flag=1 THEN
		DBMS_OUTPUT.PUT_LINE('Listed!');
	
		delete from List@site1 where Chef_id=A and C_id=B;
		commit;
		DBMS_OUTPUT.PUT_LINE('Cancelled From List.');
		ELSIF flag=0 THEN
		DBMS_OUTPUT.PUT_LINE('Not Listed Yet');
		
	END IF;
END App_info;
/
show errors;

CREATE OR REPLACE FUNCTION account_search(A in List.Chef_id%TYPE, B in List.C_id%TYPE)
RETURN int
IS
foundId int:=0;

BEGIN

	for r in(select * from List@site1 where Chef_id=A and C_id=B  ) loop
		foundId := 1;
	end loop;


	return foundId;
END account_search;
/
show errors;


DECLARE
	Chef_id number;
	C_id number;
	
BEGIN
	Chef_id:= &X;
	C_id:= &Y;
		
	App_info(Chef_id,C_id);
END;
/
commit;

create or replace view view_List as
select * from List@site1;

select * from view_List;
commit;

-----TO CONTESTENTS IN-----
ACCEPT X1 NUMBER PROMPT 'ID: '
ACCEPT Y1 CHAR PROMPT 'ENTER NAME: '
ACCEPT Z1 CHAR PROMPT 'ADDRESS: '
ACCEPT P1 CHAR PROMPT 'PhoneNumber: '
ACCEPT Q1 CHAR PROMPT 'Receipe_name: '


CREATE OR REPLACE PROCEDURE contestent_info(A in Contestents.C_id%TYPE, B in Contestents.C_name%TYPE)
IS
flag int;
BEGIN
	flag:= find_Account(A,B);
	IF flag=1 THEN
		DBMS_OUTPUT.PUT_LINE('Account already exists!');
	ELSIF flag=0 THEN
		insert into Contestents@site1 values(A,B);
		DBMS_OUTPUT.PUT_LINE('Contestents info inserted.');
	END IF;
END contestents_info;
/
show errors;

CREATE OR REPLACE FUNCTION find_Account(A in Contestents.C_id%TYPE, B in Contestents.C_name%TYPE)
RETURN int
IS
id_Found int := 0;

BEGIN

	for r in(select * from Contestents@site1 where C_id=A and C_Name=B ) loop
		id_Found:=1;
	end loop;


	return id_Found;
END find_Account;
/
show errors;


DECLARE
	id number;
	name varchar2(30);
	address varchar2(50);
	phnNmbr varchar2(11);
	receipe varchar2(30);
	
BEGIN
	id:= &X1;
	name:= '&Y1';
	address:= '&Z1';
	phnNmbr:= '&P1';
	receipe:= '&Q1';
	
	contestents_info(id,name);
	

END;
/
commit;

--select * from Contestents@site1;

create or replace view view_contestents as
select * from Contestents@site1;

select * from view_contestents;
commit;

-----LISTED CONTESTENTS-----
ACCEPT X2 NUMBER PROMPT 'ENTER Chef ID: '
ACCEPT Y2 NUMBER PROMPT 'ENTER Contestents ID: '


CREATE OR REPLACE TRIGGER placement
AFTER INSERT
ON List
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('List IS PLACED....');
END;
/

-----package-----
CREATE OR REPLACE PACKAGE p AS
	FUNCTION info_verification(Q in List.Chef_id%TYPE)
	RETURN NUMBER;
	PROCEDURE info_insertion(Q in List.Chef_id%TYPE, W in List.C_id%TYPE);  
	
END p;
/

-----body-----
CREATE OR REPLACE PACKAGE BODY p AS
	
	FUNCTION info_verification(Q in List.Chef_id%TYPE)
	RETURN NUMBER
	IS
		Flag number:=0;
		BEGIN 
			IF Q>12 THEN
				Flag := 1;
			END IF;
			
		RETURN Flag;	
		END info_verification;
		

	PROCEDURE info_insertion(Q in List.Chef_id%TYPE, W in List.C_id%TYPE)
	IS

		BEGIN

			insert into List@site1 values(Q,W);
			commit;
		END info_insertion;
					
END p;
/ 

DECLARE
	A number:=&X2; --Chef id
	B number:=&Y2; --Contestents id
	flag number;
	found_e EXCEPTION;
BEGIN
	flag:= p.info_verification(A);
	
	IF flag=0 THEN
		p.info_insertion(A,B);
	else
		RAISE found_e;
	end if;
	
	EXCEPTION
		when found_e THEN	
			DBMS_OUTPUT.PUT_LINE('NO SUCH Chef ID found_e IN THE DATABASE!');
	
	
END;
/

select * from List@site1;