clear screen;
set line 200;
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
insert into Chef values(2, 'Abdul', 'Bangladeshi', 4 , '0187255457');
insert into Chef values(3, 'saiful', 'Bangladeshi', 5, '01974554298');
insert into Chef values(4, 'Sarfaraj', 'Indian', 3 , '01342574298');
insert into Chef values(5, 'Sadman', 'Bangladeshi', 5, '0167678998');
insert into Chef values(7, 'Mehnaz', 'Indian', 5 , '01582554298');
insert into Chef values(9, 'Onnorupa', 'Indian', 5 , '01867093452');
insert into Chef values(14, 'Faizal', 'Bangladeshi', 5 , '0166884532');


--insert data into Contestents table	

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
insert into List values(10,14);
insert into List values(15,3);
insert into List values(17,9);
insert into List values(29,4);



------insert data into Admin Table------
insert into Admin values(1,'Jannat', 'jannatul1234@gmail.com', '01661130650');

commit;

select * from Chef;   
--select * from Contestents;
--select * from List;

---- chef id will be given as input. Then the contestents list under him/her will be shown. ----
SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT X1 NUMBER PROMPT 'Enter Chef ID: '


declare	
	a1 number := &X1;

	K1 varchar2(20);
	L1 varchar2(20);
	
	
begin
	for R in (select C_Name from Contestents where C_id in (select C_id from List where Chef_id=a1)) loop
		K1:= R.C_Name;
		DBMS_OUTPUT.PUT_LINE('Contestents Name: '|| K1);
	end loop;
	
	for S in(select Name from Chef where Chef_id=a1) loop
		L1:= S.Name;
	    DBMS_OUTPUT.PUT_LINE('Chef Name: '|| L1);
	end loop;

	
end;
/
show errors;


-- If a Contestents id is given as input, it will show the chefs list to whom he/she is appointed to ---
SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT X2 NUMBER PROMPT 'ENTER Contestents ID: '


declare	
	a2 number := &X2;

	K2 varchar2(20);
	L2 varchar2(20);
	
	
begin
	for R in (Select Name from Chef where Chef_id in (Select Chef_id from List where C_id = a)) loop
		K2:= R.Name;
		DBMS_OUTPUT.PUT_LINE('Chef Name: '|| K2);
	end loop;
	
	for S in(Select C_Name from Contestents where C_id = a2) loop
		L2:= S.C_Name;
	    DBMS_OUTPUT.PUT_LINE('Contestents Name: '|| L2);
	end loop;
	
	
end;
/
show errors;
