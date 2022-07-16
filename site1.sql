clear screen;
--set line 200;
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


-----insert data into List table--------	
insert into List values(22,12);
insert into List values(21,15);
insert into List values(42,6);
insert into List values(26,8);
insert into List values(19,11);


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
	for R in (Select Name from Chef where Chef_id in (Select Chef_id from List where C_id = a2)) loop
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