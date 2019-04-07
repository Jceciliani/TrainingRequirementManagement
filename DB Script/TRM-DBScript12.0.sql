--DB Script 12.0 -- Create 3/31/2019 at 1:05 PM updated by Josh Ceciliani
--  Added ON DELETE CASCADE to all foreign keys to fix switching from Internal, Develop and Vendor training requests 
--  Adjusted Employee, Training Request, Training Request Log and Training Management Status inserts
--  Commented out all unneccesary inserts -> Using application to do all inserts into those tables
--  Added all vendor queries for DAO functionality
--  Added all queries for ChartJs functionality 

--DB Script 11.5 -- Created 3/27/2019 at 3:47 PM updated by Quinn Pepper
--  Added 'training type' field to internal_training_request to keep track of whether it is web based or classroom training.
--
--DB Script 11.4 -- Created 3/19/2019 at 9:30 AM updated by Quinn Pepper
--  Changed the status values of the training_management_status test data to conform with our numbering system.
--
--DB Script 11.3 -- Created 3/18/2019 at 3:10 PM updated by Josh Ceciliani
--  Added VENDOR_SHORT_LIST_SPOC and VENDOR_SHORT_LIST_PT tables 
--    Both have same foreign keys -> used to store short list of vendors for a particular vendor training request
--      Primary key
--      Foreign key to VENDOR_TRAINING_REQUEST
--      Foreign key to VENDOR_DETAILS
--  Added sequences(start at 10000), drop sequence and delete of new tables
--  Added outline of needed queries required for Vendor

--DB Script 11.2 -- Created 3/15/2019 at 2:46 PM updated by Quinn Pepper
--  changed status of first training_management_status_id test entry to 100 for query testing.
--  Removed a few comments I made for myself on the first day to avoid confusing others.
--  created new Queries for testing, starting at line 304
--  renamed training_audio in training_schedule to training_phone
--  training_phone is now a number(10) instead of a varchar.

--DB Script 11.1 -- Created 3/15/2019 at 10:10 AM updated by Josh Ceciliani
--  Updated vendor_confirmation_email -> vendor_confirmation_email_path in VENDOR_TRAINING_REQUEST
--    Changed for clarity purposes -> one path, whole email chain from multiple managers

--DB Script 11.0 -- Created 3/14/2019 at 4:00 PM updated by Josh Ceciliani
--  Added SPOC_MASTER table
--    Foreign key to employee_id
--    Field: spoc_vertical varchar(10)
--  Created drop table for SPOC_MASTER
--  Created sequence -> spoc_master_id_seq -> Starts at 100, increments by 1
--  Updated TRAINING_REQUEST table
--    Added vertical varchar(10)
--  Updated all insert statements for TRAINING_REQUEST
--  Updated status to differentiate requests:
--    100 -> New Request
--    101 -> Start Processing
--    102 -> SPOC decides type
--    103 -> IT | 104-109 -> Process steps | 110 -> Sent to PM | 120 -> Response from PM | 121 -> Rejected | 122 -> Approved | 130 -> Sent to exec
--    203 -> DTT| 204-209 -> Process steps | 210 -> Sent to PM | 220 -> Response from PM | 221 -> Rejected | 222 -> Approved | 230 -> Sent to exec
--    303 -> VT | 304-309 -> Process steps | 310 -> Sent to PM | 320 -> Response from PM | 321 -> Rejected | 322 -> Approved | 330 -> Sent to exec

--DB Script 10.3.2 -- Created 3/14/2019 at 2:40 PM updated by Josh Ceciliani
--  More general cleaning and deletion of queries
--  Added steps for compiling and using the database - line 128

--DB Script 10.3.1 -- Created 3/14/2019 at 1:40 PM updated by Josh Ceciliani
--  Fixed EXECUTIVE_WORKFLOW_STAUTS insert statements
--  Fixed VENDOR_TRAINING_REQUEST insert statments -> not all unique fields unique
--  Edited sequences:
--    develop_team_trainer_request_id_seq -> dtt_trainer_request_id_seq
--    dev_team_training_request_seq -> dtt_training_request_id_seq
--    training_management_status_id_seq -> trng_management_status_id_seq

--DB Script 10.3 --Created 3/14/2019 at 11:30 AM updated by Josh Ceciliani
--  Removed line 384 -> duplicate table drop

--DB Script 10.2 --Created 3/14/2019 at 11:17 AM updated by Quinn Pepper
--Removed -- from line 518 to allow Vendor_Details to allow it to compile.
--changed Foreign key called by Vendor_details_id in Vendor_Trainer from vendor_details(vendor_details_id) to vendor_details(vendor_id) to allow it to compile.
--
--DB Script 10.1 --Created 3/14/2019 at 11:10 AM updated by Josh Ceciliani
--Changes from 10.0
--  Updated all insert statements that had their tables affected
--  Added dummy data to new TRAINING_MANAGEMENT_STATUS table
--  Created sequence for TRAINING_MANAGEMENT_STATUS
--  Edited all drops, including sequences and tables
--  Added foreign key in VENDOR_TRAINER to VENDOR_DETAILS
--    Deleted the "unique" field from phone and email -> same vendor, different company
--    Edited inserts for VENDOR_TRAINER
--  Deleted sample queries that had old table information
--  General clean up of the script

--DB Script 10.0 --Created 3/13/19 at 2:35 PM updated by Josh Ceciliani
--Changes from 9.1
--  Added TRAINING_MANAGEMENT_STATUS table:
--    Inserted foreign key for TRAINING_MANAGEMENT_STATUS to training_request_id
--    Status used to differentiate requests
--      IT - 100
--      DTT - 1000
--      VT - 10000
--  Deleted status() number from TRAINING_REQUEST, INTERNAL_TRAINING_REQUEST, 
--  DEVELOP_TEAM_TRAINING_REQUEST, VENDOR_TRAINING_REQUEST, TRAINING_REQUEST_LOG
--    Now all tied to TRAINING_MANAGEMENT_STATUS table
--  Created a training_management_status_id_seq
--    Starts at 100, Increments by 1
--  Renamed TRAINER_REQUEST TABLE to DEVELOP_TEAM_TRAINER_REQUEST TABLE
--    ID changed to dtt_trainer_request_id from trainer_request_id
--    Table was only used by Develop Team
--    Cleaned up field locations
--  Updated TRAINING_SCHEDULE with an additional field
--    Added training_break_down varchar(200) -> Used for days and time specifications
--  Cleaned up EXECUTIVE_WORKFLOW_STATUS
--    Placed the foreign keys at the top


--DB Script 9.1 ---Created 3/12/19 at 10:05 AM
--Changes from 9.0
--  Added semicolons and spaces at the end of queries to make it easier to see
--  where they start and end.
--  Fixed issues with several queries in order to make them run properly.
--      Queries at lines 198, 206, 211, 233, 237, 247, 252, 255, 264, 275, and 283 
--       still do not work because they call for rows that do not exist in their tables.
--  Altered the numbers being input into training_request_id (starting at 10000 instead of
--    10090) in develop_team_training_request so that they match the generated parents in 
--    training_request and can compile.
--  Altered the numbers being input into training_request_id (starting at 10000 instead of
--    10090) in develop_team_training_request so that they match the generated parents in 
--    training_request and can compile.
--
--DB Script 9.0 ---Created 2/10/19 at 1:02 AM
--Changes from 8.0    
--  Added new table Trainer_Request:
--    New table, new data, DAO (generic class, mapper, CRUD)
--    Inserted foreign key for trainer_request into DTT request table,
--    which replaced the trainer_id. Updated DTT DAO due 
--    to this change.
--
--DB Script 8.0 ---Created 2/8/19 at 12:26 AM
--Changes from 7.2:
--  Added more data for new tables
--  Added comments clarrifying where to stop inserting if you wish to use less data.
--    This is primarily for limiting database connections when you call functions in BL
--    such as getAllItr or getAllTrainingRequest. So if you've had issues in the 
--    past with database connectivity, only insert statements before the comments that say to stop.

--DBScript 7.2--- Created 2/6/19 at 12:50 AM
--Changes from 6.0:
--    Added insert statements for new tables, executive_workflow_status, 
--                                          training_particioants
-- Will hold off on insert statements for DTT and vendor relates tables until needed.
-- Rewrote insert statements for internal_training_request, training_request, and
--  `training_schedule due to column changes (order, and redundancy. Also changed the
--   DAO classes for these tables due to these changes.
-- Changed the schedule_id type in training_schedule table to number(5) instead of varchar for consistency.
-- (2/7/19) Changed type of status in training request to number(4,2) to accept double values


--DBScript 6.0--- Created 2/5/19 at 2:52 PM
--Changes from 5.0:
--        New Tables: Vendor_Details, Vendor_Trainer, Vendor_Training_Request
--                    Development_Team_Training_Request
--                    Executive_Workflow_Status
--                    Training_Participants
--
--        Old Table Modifications:
--          Deleted executive_id from training_request
--          Added justification_for_request in training_request
--          Added training_url and training_audio in training_schedule
--          Deleted training_spoc_id and training_mode from internal_training_request


--STEPS FOR DATABASE COMPILATION***************************************
--1) CREATE TABLES
--2) COMPILE FUNCTIONS
--3) INSERT DATA

create or replace function getRandSPOC
return
    number
is
    countSPOC number;
    spocID number;
begin
    Select count(*)
    into countSPOC 
    from employee
    where upper(job_title)='SPOC';
    countSPOC := round(DBMS_RANDOM.VALUE (1, COUNTSPOC));  
 
    select employee_id
    into spocID
    from ( select employee_id, rownum rnum
           from (select employee_id
                from employee
                where upper(job_title)='SPOC'
                order by employee_id)
          where rownum <= countSPOC )
    where rnum >= countSPOC;
 
    return spocID;
end;
 
create or replace function getRandExec
return
    number
is
    countExec number;
    execID number;
begin
    Select count(*)
    into countExec 
    from employee
    where upper(job_title)='EXEC' OR upper(job_title)='EXECUTIVE';
    countExec := round(DBMS_RANDOM.VALUE (1, countExec));  
 
    select employee_id
    into execID
    from ( select employee_id, rownum rnum
           from (select employee_id
                from employee
                where upper(job_title)='EXEC' OR upper(job_title)='EXECUTIVE'
                order by employee_id)
          where rownum <= countExec )
    where rnum >= countExec;
 
    return execID;
end;
 
create or replace function getRandRequester

return
    number
is
    countReq number;
    reqID number;
begin
    Select count(*)
    into countReq 
    from employee
    where upper(job_title)!='EXEC' AND upper(job_title)!='EXECUTIVE' AND upper(job_title)!='SPOC' AND upper(job_title) != 'TRAINER' AND upper(job_title)!= 'TRAINEE';
    countReq := round(DBMS_RANDOM.VALUE (1, countReq));  
 
    select employee_id
    into reqID
    from ( select employee_id, rownum rnum
           from (select employee_id
                from employee
                where upper(job_title)!='EXEC' AND upper(job_title)!='EXECUTIVE' AND upper(job_title)!='SPOC' AND upper(job_title) != 'TRAINER' AND upper(job_title)!= 'TRAINEE'
                order by employee_id)
          where rownum <= countReq )
    where rnum >= countReq;
 
    return reqID;
end;
 
 -----Queries-----

--Select Executive name for a specific training request
Select e.first_name, e.last_name
from employee e
inner join INTERNAL_TRAINING_REQUEST tr--THIS DIDN'T WORK AS TEST  training_request tr
--No EXECUTIVE_ID in training????
on e.EMPLOYEE_ID = tr.executive_id AND tr.training_request_id = 10005;

--Select SPOC information for a specific training request
Select e.LAST_NAME, e.FIRST_NAME, e.PHONE_NUMBER, e.EMAIL, e.STREET, e.CITY, e.STATE, e.COUNTRY
from employee e
join training_request tr
on e.employee_id = tr.request_project_spoc AND tr.training_request_id = 10005;

--Select Executive information for a specific training request
Select e.LAST_NAME, e.FIRST_NAME, e.PHONE_NUMBER, e.EMAIL, e.STREET, e.CITY, e.STATE, e.COUNTRY
from employee e
join INTERNAL_TRAINING_REQUEST tr--THIS DIDN'T WORK AS TEST  training_request tr
--No EXECUTIVE_ID in training????
on e.employee_id = tr.executive_id AND tr.training_request_id = 10005;

--Select all training requests for a specific project manager
Select *
from training_request
where requester_id = 1000040;

--Select all internal training requests for a specific project manager
Select it.internal_training_id
from internal_training_request it
join 
(
  Select tr.training_request_id, e.employee_id
  from training_request tr
  join employee e
  on e.employee_id = tr.requester_id AND e.employee_id = 1000041
) t
on t.training_request_id = it.training_request_id;

--Select all internal training requests that are class room based
Select internal_training_id
from internal_training_request
where internal_training_mode = 'class room'; --internal_training_ mode does not exist.

--Select all internal training requests that are web based
Select internal_training_id
from internal_training_request
where internal_training_mode = 'web based'; --internal_training_ mode does not exist.

--Select all new requests for a specific project manager
Select training_request_id
from training_request
where requester_id = 1000044 AND status = 1; 

--Select all internal training requests that are waiting for approval by a specific PM
Select it.internal_training_id
from internal_training_request it
join
(
  Select tr.training_request_id, e.employee_id
  from training_request tr
  join employee e
  on e.employee_id = tr.requester_id AND e.employee_id = 1000044
) tra
on tra.training_request_id = it.training_request_id AND it.status = 9;
    

Select round((to_date('2009-07-07 22:00', 'YYYY-MM-DD hh24:mi') - to_date('2009-07-08 19:30', 'YYYY-MM-DD hh24:mi'))) diff_days
(Select it.TRAINING_REQUEST_ID,ts.TRAINING_START_DATE
from internal_training_request it
join training_schedule ts
on it.schedule_id = ts.training_schedule_id) t --from expected

Select round(tr.request_start_time - t.training_start_date)--from expected

select round((to_date('2009-07-07 22:00', 'YYYY-MM-DD hh24:mi') 
             - to_date('2009-07-08 19:30', 'YYYY-MM-DD hh24:mi'))) diff_days
from dual;

Select * 
from develop_team_training_request dt
join training_request tr
on dt.training_request_id = tr.training_request_id AND tr.requester_id = 1000057;

--===========================================IT Queries==========================================================
--Gather Training Request Info to display.
--For new: 
SELECT tr.training_request_id, e.LAST_NAME, e.first_name, tr.request_training_module, tr.request_start_date, 
    tr.request_location FROM training_request tr INNER JOIN employee e
    ON tr.requester_id = e.employee_id WHERE requester_id=1000065 and training_request_id = 10005; 
--for in process:
SELECT tr.training_request_id, e.LAST_NAME, e.first_name, tr.request_training_type, 
    tr.request_training_module, tr.request_start_date, tr.request_location FROM training_request tr INNER JOIN employee e
    ON tr.requester_id = e.employee_id WHERE requester_id=1000065 and training_request_id = 10005; 

--Gather data for expanded info
SELECT e.last_name, e.first_name, t.*  FROM training_request t join employee e on e.employee_id = t.requester_id WHERE training_request_id = 10005;

--Show Executive Workflow Status info
SELECT * FROM executive_workflow_status WHERE training_request_id = 10001;

--Create an Internal_training_request entry using Training_Request
INSERT INTO Internal_Training_Request values(11001, 
    (SELECT training_request_id FROM training_request WHERE training_request_id = 10011), 
    null, null, getRandExec, '');
SELECT * FROM Internal_Training_Request WHERE internal_training_id = 11000;

--insert information from SPOC into IT table.
UPDATE internal_training_request SET schedule_id = 10000, confirmed_trainer_id = 1000003, 
    description_of_status = 'Will this work?' WHERE internal_training_id = 11000;
SELECT * FROM Internal_Training_Request WHERE internal_training_id = 11000;
DELETE FROM Internal_training_request WHERE internal_training_id = 11000;

--Show all Training Requests of one Vector for the appropriate SPOC.
--Should show all RET requests.
SELECT * FROM training_request tr INNER JOIN spoc_master sm 
    ON sm.spoc_vertical = tr.vertical
    WHERE sm.spoc_vertical = 
        (SELECT spoc_vertical FROM spoc_master WHERE spoc_master_id = 102); 
        
--create new Training_request_log entry and change status table.
SELECT * FROM training_request_log;    
SELECT * FROM training_management_status;
UPDATE training_management_status_id set status = 102 --Should we use business logic to determine the next step?
    WHERE training_management_status_id = 100;
INSERT INTO training_request_log VALUES(training_request_log_id_seq.nextval, 
    (SELECT training_request_id FROM training_management_status WHERE training_management_status_id = 100), --Have program take user input for training_management_status_id.
    (SELECT status FROM training_management_status WHERE training_management_status_id = 100), --Have program take user input for training_management_status_id
    (SELECT TO_DATE(sysdate, 'yyyy/mm/dd hh:mi:ss') "NOW" FROM DUAL),
    'Process Started'); 
SELECT * FROM training_request_log;

SELECT * FROM employee;
SELECT * FROM training_request_log trl JOIN (select e.vertical from training_request tr JOIN employee e ON e.employee_id = tr.requester_id) t ON  trl.training_request_id = t.training_request_id;

SELECT s.spoc_vertical, tm.status, tm.training_request_id, tr.training_request_id, tr.vertical 
    FROM spoc_master s, training_management_status tm, training_request tr WHERE (tr.vertical = s.spoc_vertical AND tm.training_request_id = tr.training_request_id) AND ((tm.status > 100 AND tm.status <= 112) OR (tm.status > 200 AND tm.status <= 212) OR (tm.status > 300 AND tm.status <= 312)); --tm.status < 200; 
SELECT s.spoc_vertical, tm.status, tm.training_request_id, tr.training_request_id, tr.vertical 
    FROM spoc_master s, training_management_status tm, training_request tr WHERE (tr.vertical = s.spoc_vertical AND tm.training_request_id = tr.training_request_id) AND (tm.status > 100 AND tm.status <= 112);

SELECT s.spoc_vertical, tm.status, tm.training_request_id, tr.training_request_id, tr.vertical 
    FROM spoc_master s, training_management_status tm, training_request tr WHERE tr.vertical = s.spoc_vertical AND tm.training_request_id = tr.training_request_id AND tm.status = 100;

--=========================================Vendor Queries====================================================================
--Spoc who is signed in
select e.employee_id, e.first_name, e.last_name, e.vertical from employee e
inner join spoc_master sm
on e.employee_id = sm.spoc_emp_id
where sm.spoc_vertical = e.vertical and e.user_name = ?;

--Select id from training request
select * from training_request where training_request_id = ?;
--Vertical for that specific training request
select vertical from training_request where training_request_id = ?;
--Who sumbitted a training request
select requester_id from training_request where training_request_id = ?;
--Location of that training request
select request_location from training_request where training_request_id = ?;
--How many participants for that training request
select request_approx_participant from training_request where training_request_id = ?;
--Start date for the training request
select vtr.po_status from VENDOR_TRAINING_REQUEST vtr
inner join training_request tr
on vtr.training_request_id = tr.training_request_id
where vtr.CONFIRMED_VENDOR_ID = ?;
--Insert into the Vendor 
insert into vendor_details values(vendor_id_seq.nextval,?,?,?,?,?,?,?,?);
--given the username, get first and last name(etc).
select first_name, last_name from employee where user_name = ?;
--given the username, get their vertical
select vertical from employee where username = ?;
--given training request id, get project manager (spoc)
select e.* from employee e
inner join training_request tr
on e.employee_id = tr.requester_id
where tr.training_request_id = ?;
--given training request id, get location of training
select request_location from training_request where training_request_id = ?;
--given training request id, get list of participants of the training
select e.* from employee e
inner join training_participants tp
on e.EMPLOYEE_ID= tp.PARTICIPANT_EMPLOYEE_ID
where tp.TRAINING_SESSION_ATTENDED = ?;
--given training request id, get start date of training
select request_start_date from training_request where training_request_id = ?;
-------Modal Queries
--1) Insert approval email for a certain training request.
update vendor_training_request set vendor_confirmation_email_path = ? where vendor_training_request_id = ?;
--// For displaying details in the header of the Modal
--2) Select Training request ID, Project manager, and Training type for a certain training request.
select tr.training_request_id, e.first_name, e.last_name, tr.request_training_type from training_request tr
inner join employee e
on tr.REQUESTER_ID_id = e.EMPLOYEE_ID
where tr.training_request_id = ?;
--2.5) Select Vendor Training request ID, Project manager, and Training type for a certain vendor training request.
select vtr.vendor_training_request_id, e.first_name, e.last_name, tr.request_training_type from vendor_training_request vtr
inner join training_request tr
on vtr.TRAINING_REQUEST_ID = tr.TRAINING_REQUEST_ID
inner join employee e
on tr.REQUESTER_ID = e.EMPLOYEE_ID
where vtr.VENDOR_TRAINING_REQUEST_ID = ?;
--// SPOC Vendor Shortlist
--3) Insert Vendor shortlist into SPOC Vendor table for a certain vendor training request.
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, ?, ?);
--4) Select Vendor list shortlisted by SPOC, for a certrain training request.
select vd.VENDOR_NAME, vd.VENDOR_PHONE,vd.VENDOR_EMAIL,vd.VENDOR_CITY,vd.VENDOR_STATE from vendor_short_list_spoc vsls
inner join vendor_details vd
on vsls.VENDOR_ID = vd.VENDOR_ID
inner join vendor_training_request vtr
on vsls.VENDOR_TRAINING_REQUEST_ID = vtr.VENDOR_TRAINING_REQUEST_ID
inner join training_request tr
on vtr.TRAINING_REQUEST_ID = tr.TRAINING_REQUEST_ID
inner join employee e 
on tr.REQUESTER_ID = e.EMPLOYEE_ID
inner join spoc_master sm
on e.VERTICAL = sm.SPOC_VERTICAL
where vsls.VENDOR_TRAINING_REQUEST_ID = 10002;
----
select vd.* from vendor_short_list_spoc vsls
inner join vendor_details vd
on vsls.VENDOR_ID = vd.VENDOR_ID
where vsls.VENDOR_TRAINING_REQUEST_ID = 10001;

select vd.* from vendor_short_list_pt vslp
inner join vendor_details vd
on vslp.VENDOR_ID = vd.VENDOR_ID
where vslp.VENDOR_TRAINING_REQUEST_ID = 10001;

--5) Insert Vendor shortlist for SPOC, for a certain training request.
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval,?,?);
--// PT Vendor Shortlist
--6) Insert Vendor shorlist into PT Vendor table for a certain training request.
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, ?, ?);
--7) Select Vendor list shortlisted by PT, for a certrain training request.
select vslp.*, vd.* from vendor_short_list_pt vslp
inner join vendor_details vd
on vslp.VENDOR_ID = vd.VENDOR_ID
where vslp.VENDOR_TRAINING_REQUEST_ID = 10001;
--8) Update Vendor shortlist for PT, for a certain training request.
delete from vendor_short_list_pt where VENDOR_SHORT_LIST_PT_ID = ?;
--9) Insert into training schedule.
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?);
--10) Select the saved training schedule data for a certain training request.
select * from training_schedule ts
inner join vendor_training_request vtr
on ts.TRAINING_SCHEDULE_ID = vtr.SCHEDULE_ID
where vtr.VENDOR_TRAINER_REQUEST_ID = ?;
--11) Update training schedule data for a certain training request.
update training_schedule set training_city = ?, training_state = ?, training_country = ?, training_zipcode = ?, training_time_zone = ?, training_location = ?,
training_room_number = ?, training_start_date = ?, training_end_date = ?, training_break_down = ?, training_url = ?, training_phone = ? where training_schedule_id = ?;

------Vendor Management
--1) Select vendor_name, vendor_phone, vendor_email from vendor_details
select vendor_name, vendor_phone, vendor_email from vendor_details; 
--2) Select * from vendor_details
select * from vendor_details;
--3) Update vendor_details set (all) where vendor_name = name
update vendor_details set vendor_name=?, vendor_phone=?, vendor_email=?, vendor_city=?, vendor_state=?, vendor_country=?, vendor_zipcode=?, vendor_time_zone=? where vendor_name = ?;
--4) Insert into vendor_details values(all except id, assuming autoincrements)
insert into vendor_details values(vendor_id_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?);
--5) Delete * from vendor_details
delete from vendor_details where VENDOR_ID = ?;
--For vendor trainers
--6) Select * from vendor_trainer
select * from vendor_trainer;
--6.5) Select all trainers for a specific vendor
select * from vendor_trainer vt 
inner join vendor_details vd
on vt.VENDOR_DETAILS_ID = vd.VENDOR_ID
where vd.vendor_id = 10000;
--7) Update vendor_trainer set (all) where vendor_trainer_name = name
update vendor_trainer set vendor_details_id=?, vendor_trainer_name=?, phone=?, email=?, profile=?, evaulation_status=?, vendor_trainer_log=? where vendor_trainer_name = ?;
--8) Insert into vendor_trainer values(all except id, assuming autoincrements)
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, ?, ?, ?, ?, ?, ?, ?);
--9) Delete * from vendor_trainer
delete from vendor_trainer where vendor_trainer_id = ?;

--==========================================ChartJs Queries=================================================================
--For a given month, total number of IT/DT/VT trainings
select itr.INTERNAL_TRAINING_ID, itr.TRAINING_REQUEST_ID,dttr.DTT_TRAINING_ID,dttr.TRAINING_REQUEST_ID,vtr.VENDOR_TRAINING_REQUEST_ID,vtr.TRAINING_REQUEST_ID, EXTRACT(month from request_start_date) "Months", count(itr.INTERNAL_TRAINING_ID) "IT Requests", count(dttr.DTT_TRAINING_ID) "DTT Requests", count(vtr.VENDOR_TRAINING_REQUEST_ID) "VT Requests" from training_request tr
inner join INTERNAL_TRAINING_REQUEST itr
on tr.TRAINING_REQUEST_ID = itr.TRAINING_REQUEST_ID
left join DEVELOP_TEAM_TRAINING_REQUEST dttr
on tr.TRAINING_REQUEST_ID = dttr.TRAINING_REQUEST_ID
inner join VENDOR_TRAINING_REQUEST vtr
on tr.TRAINING_REQUEST_ID = vtr.TRAINING_REQUEST_ID
where EXTRACT(month from request_start_date) = 11
group by itr.INTERNAL_TRAINING_ID, itr.TRAINING_REQUEST_ID,dttr.DTT_TRAINING_ID,dttr.TRAINING_REQUEST_ID,vtr.VENDOR_TRAINING_REQUEST_ID,vtr.TRAINING_REQUEST_ID, EXTRACT(month from request_start_date)
order by "Months";

------------IT Only
select EXTRACT(month from request_start_date) "Months", count(itr.INTERNAL_TRAINING_ID) "IT Requests" from training_request tr
left join INTERNAL_TRAINING_REQUEST itr
on tr.TRAINING_REQUEST_ID = itr.TRAINING_REQUEST_ID
where tr.VERTICAL = 'BNFS'
group by EXTRACT(month from request_start_date)
order by "Months";
----------DTT Only
select EXTRACT(month from request_start_date) "Months", count(dttr.DTT_TRAINING_ID) "DTT Requests" from training_request tr
left join DEVELOP_TEAM_TRAINING_REQUEST dttr
on tr.TRAINING_REQUEST_ID = dttr.TRAINING_REQUEST_ID
where tr.VERTICAL = 'BNFS'
group by EXTRACT(month from request_start_date)
order by "Months";
------VT Only
select EXTRACT(month from request_start_date) "Months", count(vtr.VENDOR_TRAINING_REQUEST_ID) "VT Requests" from training_request tr
left join VENDOR_TRAINING_REQUEST vtr
on tr.TRAINING_REQUEST_ID = vtr.TRAINING_REQUEST_ID
where tr.VERTICAL = 'BNFS'
group by EXTRACT(month from request_start_date)
order by "Months";

---------------------------------------------------------------------------------------------------------------------------------------------
---For a specific date range, for a specific Spoc, get how many IT, DTT and VT requests they did
select itr.INTERNAL_TRAINING_ID, itr.TRAINING_REQUEST_ID,dttr.DTT_TRAINING_ID,dttr.TRAINING_REQUEST_ID,vtr.VENDOR_TRAINING_REQUEST_ID,vtr.TRAINING_REQUEST_ID,  count(itr.INTERNAL_TRAINING_ID) "IT Requests", count(dttr.DTT_TRAINING_ID) "DTT Requests", count(vtr.VENDOR_TRAINING_REQUEST_ID) "VT Requests" from training_request tr
inner join INTERNAL_TRAINING_REQUEST itr
on tr.TRAINING_REQUEST_ID = itr.TRAINING_REQUEST_ID
left join DEVELOP_TEAM_TRAINING_REQUEST dttr
on tr.TRAINING_REQUEST_ID = dttr.TRAINING_REQUEST_ID
inner join VENDOR_TRAINING_REQUEST vtr
on tr.TRAINING_REQUEST_ID = vtr.TRAINING_REQUEST_ID
where EXTRACT(month from request_start_date) = 1 and EXTRACT(year from request_start_date) = 2019 and EXTRACT(month from request_end_date) = 3 and EXTRACT(year from request_end_date) = 2019
group by itr.INTERNAL_TRAINING_ID, itr.TRAINING_REQUEST_ID,dttr.DTT_TRAINING_ID,dttr.TRAINING_REQUEST_ID,vtr.VENDOR_TRAINING_REQUEST_ID,vtr.TRAINING_REQUEST_ID;
-------------IT Only
select * from (select itr.INTERNAL_TRAINING_ID,count(itr.INTERNAL_TRAINING_ID) "IT Requests" from training_request tr
inner join INTERNAL_TRAINING_REQUEST itr
on tr.TRAINING_REQUEST_ID = itr.TRAINING_REQUEST_ID
where EXTRACT(month from request_start_date) = 1 and EXTRACT(year from request_start_date) = 2019 and EXTRACT(month from request_end_date) = 3 and EXTRACT(year from request_end_date) = 2019 and tr.VERTICAL = ?
group by cube(itr.INTERNAL_TRAINING_ID))
where INTERNAL_TRAINING_ID is null;
-------DTT Only
select * from (select dttr.DTT_TRAINING_ID,count(dttr.DTT_TRAINING_ID) "DTT Requests" from training_request tr
inner join Develop_team_training_request dttr
on tr.TRAINING_REQUEST_ID = dttr.TRAINING_REQUEST_ID
where EXTRACT(month from request_start_date) = 1 and EXTRACT(year from request_start_date) = 2019 and EXTRACT(month from request_end_date) = 3 and EXTRACT(year from request_end_date) = 2019 and tr.VERTICAL = ?
group by cube(dttr.DTT_TRAINING_ID))
where DTT_TRAINING_ID is null;
------VT Only
select * from (select vtr.vendor_training_request_id, count(vtr.vendor_training_request_id) "VT Requests" from training_request tr
inner join vendor_training_request vtr
on tr.TRAINING_REQUEST_ID = vtr.TRAINING_REQUEST_ID
where EXTRACT(month from request_start_date) = 1 and EXTRACT(year from request_start_date) = 2019 and EXTRACT(month from request_end_date) = 3 and EXTRACT(year from request_end_date) = 2019 and tr.VERTICAL = ?
group by cube(vtr.VENDOR_TRAINING_REQUEST_ID))
where vendor_training_request_id is null;

---------------------------------------------------------------------------------------------------------------------------------------
--For a given spoc, total # of participants for a specific training request(IT/DT/VT)
select tr.REQUEST_TRAINING_TYPE,SUM(tr.REQUEST_APPROX_PARTICIPANT)
from SPOC_MASTER sm
inner join EMPLOYEE e
on sm.SPOC_EMP_ID = e.EMPLOYEE_ID
right join TRAINING_REQUEST tr
on sm.SPOC_VERTICAL = tr.VERTICAL
where sm.SPOC_VERTICAL = 'BNFS'
GROUP BY tr.REQUEST_TRAINING_TYPE;

-----For a given spoc, total # of request based on status -> Left---
select tms.STATUS, count(tms.status) "To Be Processed" from training_management_status tms
inner join TRAINING_REQUEST tr
on tms.TRAINING_REQUEST_ID = tr.TRAINING_REQUEST_ID
inner join spoc_master sm
on tr.VERTICAL = sm.SPOC_VERTICAL
inner join employee e
on e.EMPLOYEE_ID = sm.SPOC_EMP_ID
where tms.status = 100 and tr.VERTICAL = ?
group by tms.status;

-----For a given spoc, total # of request based on status ->Middle ---
select * from (select status, count(tms.status) "In_Process" from training_management_status tms
inner join TRAINING_REQUEST tr
on tms.TRAINING_REQUEST_ID = tr.TRAINING_REQUEST_ID
inner join spoc_master sm
on tr.VERTICAL = sm.SPOC_VERTICAL
inner join employee e
on e.EMPLOYEE_ID = sm.SPOC_EMP_ID
where tms.status in (103,104,105,106,110,120,121,122,203,204,205,206,210,220,221,222,303,304,305,310,320,321,322) and tr.VERTICAL = ?
group by cube(tms.status))
where status is null;

-----For a given spoc, total # of request based on status ->Right ---
select * from (select  tms.status, count(tms.status) "Post Process" from training_management_status tms
inner join TRAINING_REQUEST tr
on tms.TRAINING_REQUEST_ID = tr.TRAINING_REQUEST_ID
inner join spoc_master sm
on tr.VERTICAL = sm.SPOC_VERTICAL
inner join employee e
on e.EMPLOYEE_ID = sm.SPOC_EMP_ID
where tms.status in (130,131,132,133,134,135,140,230,231,232,233,234,235,240,330,331,332,333,334,335,340) and tr.VERTICAL = ?
group by cube(tms.status)) 
where status is null;

--==========================================Basic Select Statements==========================================================
select * from employee;
select * from training_request;
select * from internal_trainer;
select * from training_schedule;
select * from internal_training_request;
select * from executive_workflow_status;
select * from training_request_log;
select * from training_participants;
select * from develop_team_training_request;
select * from vendor_details;
select * from vendor trainer;
select * from vendor_training_request;
select * from develop_team_trainer_request;
select * from training_management_status;
select * from spoc_master;
select * from vendor_short_list_spoc;
select * from vendor_short_list_pt;

drop table vendor_short_list_spoc;
drop table vendor_short_list_pt;
drop table spoc_master;
drop table develop_team_training_request;
drop table develop_team_trainer_request;
drop table vendor_training_request;
drop table internal_training_request;
drop table executive_workflow_status;
drop table internal_trainer;
drop table training_schedule;
drop table vendor_trainer;
drop table training_participants;
drop table vendor_details;
drop table training_request_log;
drop table training_management_status;
drop table training_request;
drop table employee;

drop sequence trainer_request_id_seq;
drop sequence emp_id_seq;
drop sequence spoc_master_id_seq;
drop sequence training_id_request_seq;
drop sequence training_schedule_id_seq;
drop sequence internal_training_id_seq;
drop sequence training_request_log_id_seq;
drop sequence training_participant_seq;
drop sequence dtt_training_req_id_seq;
drop sequence dtt_trainer_request_id_seq;
drop sequence executive_workflow_status_seq;
drop sequence vendor_id_seq;
drop sequence vendor_trainer_id_seq;
drop sequence vendor_training_request_id_seq;
drop sequence trng_management_status_id_seq;
drop sequence vendor_short_list_spoc_id_seq;
drop sequence vendor_short_list_pt_id_seq;
 
CREATE TABLE EMPLOYEE
(
  employee_id number(7) primary key,
  last_name varchar(20) not null,
  first_name varchar(20) not null,
  user_name varchar(20) unique not null,
  password varchar(20) not null,
  phone_number varchar(20) unique not null,
  email varchar(40) unique not null,
  street varchar(40) not null,
  city varchar(40) not null,
  state varchar(40) not null,
  country varchar(40) not null,
  job_title varchar(20) not null,
  vertical varchar(10),
  project varchar(30),
  pid number(5)
);
 
CREATE TABLE SPOC_MASTER
(
  spoc_master_id number(5) primary key,
  spoc_emp_id number(7) CONSTRAINT spoc_emp_fk references employee(employee_id) not null,
  spoc_vertical varchar(10)
);
 
CREATE TABLE TRAINING_REQUEST
(
  training_request_id number(5) primary key,
  requester_id number(7) CONSTRAINT tr_requester_fk references employee(employee_id) not null,
  vertical varchar(10),
  request_training_type varchar(20),
  request_training_module varchar(20) not null,
  request_training_module_scope varchar(300) not null,
  request_training_mode varchar(20),
  request_start_date TIMESTAMP(0),
  request_end_date TIMESTAMP(0),
  request_location varchar(20) not null,
  request_time_zone varchar(6),
  request_approx_participant number(2),
  request_project_spoc number(7)CONSTRAINT tr_spoc_fk references employee(employee_id),
  time_requested TIMESTAMP(0),
  justification_of_request varchar(200) not null
);

CREATE TABLE INTERNAL_TRAINER 
(
  it_trainer_id number(7) CONSTRAINT it_trainer_fk references employee(employee_id) ON DELETE CASCADE unique not null,
  profile_file_path varchar(100),
  trainer_location varchar(20)
);
 
CREATE TABLE TRAINING_SCHEDULE
(
  training_schedule_id number(5) primary key,
  training_city varchar(30),
  training_state varchar(20),
  training_country varchar(20),
  training_zipcode varchar(20),
  training_time_zone varchar(6),
  training_location varchar(20),
  training_room_number varchar(20),
  training_start_date TIMESTAMP(0),
  training_end_date TIMESTAMP(0),
  training_break_down varchar(200),
  training_url varchar(300),
  training_phone number(10)
);

CREATE TABLE INTERNAL_TRAINING_REQUEST
(
  internal_training_id number(5) primary key,
  training_request_id number(5) CONSTRAINT itr_tr_fk references training_request(training_request_id) ON DELETE CASCADE unique not null,
  training_type varchar(20),
  schedule_id number(5) CONSTRAINT itr_sched_fk references training_schedule(training_schedule_id) ON DELETE CASCADE unique,
  confirmed_trainer_id number(7) CONSTRAINT itr_train_fk references internal_trainer(it_trainer_id) ON DELETE CASCADE,
  executive_id number(7) CONSTRAINT tr_exec_fk references employee(employee_id) ON DELETE CASCADE,
  description_of_status varchar(200)
);

CREATE TABLE EXECUTIVE_WORKFLOW_STATUS
(
  executive_workflow_status_id number(5) primary key,
  training_request_id number(5) CONSTRAINT ews_tr_fk references training_request(training_request_id) ON DELETE CASCADE unique not null,
  executive_id number(7) CONSTRAINT ews_exec_fk references employee(employee_id) ON DELETE CASCADE,
  sent_invitations number(2),
  completed_skillport_enrollment number(2),
  assessments_recorded number(2),
  vendor_training_clearance number(2),
  completed_feedback number(2),
  training_completed number(2)
);

CREATE TABLE TRAINING_PARTICIPANTS
(
  training_participant_id number(5) primary key,
  participant_employee_id number(7) CONSTRAINT tp_participant_fk references employee(employee_id) ON DELETE CASCADE not null,
  training_session_attended number(5) CONSTRAINT tp_tr_fk references training_request(training_request_id) ON DELETE CASCADE not null
);

CREATE TABLE DEVELOP_TEAM_TRAINER_REQUEST
(
  dtt_trainer_request_id number(5) primary key,
  request_sent_date TIMESTAMP(0) not null,
  trainer_id number(7) CONSTRAINT trainer_req_emp_id_fk references employee(employee_id) ON DELETE CASCADE,
  schedule_id number(5) CONSTRAINT trainer_req_sched_id_fk references training_schedule(training_schedule_id) ON DELETE CASCADE unique,
  topic varchar(20),
  comments varchar(200),
  response varchar(1),
  active_status number(1)
);

CREATE TABLE DEVELOP_TEAM_TRAINING_REQUEST
(
  dtt_training_id number(5) primary key,
  training_request_id number(5) CONSTRAINT dtt_tr_fk references training_request(training_request_id) ON DELETE CASCADE unique not null,
  trainer_request_id number(5) CONSTRAINT dtt_trainer_req_fk references develop_team_trainer_request(dtt_trainer_request_id) ON DELETE CASCADE,
  schedule_id number(5) CONSTRAINT dtt_sched_fk references training_schedule(training_schedule_id) ON DELETE CASCADE unique,
  executive_id number(7) CONSTRAINT dtt_tr_exec_fk references employee(employee_id) ON DELETE CASCADE,
  trainer_approval_mail varchar(200),
  trainer_manager_approval_mail varchar(200),
  description_of_status varchar(200)
);

CREATE TABLE VENDOR_DETAILS 
(
  vendor_id number(5) primary key,
  vendor_name varchar(20) unique not null,
  vendor_phone varchar(20) unique not null,
  vendor_email varchar(40) unique not null,
  vendor_city varchar(20) not null,
  vendor_state varchar(10) not null,
  vendor_country varchar(10) not null,
  vendor_zipcode varchar(10) not null,
  vendor_time_zone varchar(10) not null
);

CREATE TABLE VENDOR_TRAINER
(
  vendor_trainer_id number(7) primary key,
  vendor_details_id number(7) CONSTRAINT vt_details_fk references vendor_details(vendor_id) ON DELETE CASCADE not null,
  vendor_trainer_name varchar(20) not null,
  phone varchar(20) not null,
  email varchar(30) not null,
  profile varchar(200),
  evaulation_status varchar(200),
  vendor_trainer_log varchar(200)
);

CREATE TABLE VENDOR_TRAINING_REQUEST 
(
  vendor_training_request_id number(5) primary key,
  training_request_id number(5) CONSTRAINT vt_trainreq_fk references training_request(training_request_id) ON DELETE CASCADE unique not null,
  confirmed_vendor_id number(5) CONSTRAINT vt_vendor_fk references vendor_details(vendor_id) ON DELETE CASCADE,
  vendor_trainer_id number(7) CONSTRAINT vt_vendtrain_fk references vendor_trainer(vendor_trainer_id) ON DELETE CASCADE,
  schedule_id number(5) CONSTRAINT vt_sched_fk references training_schedule(training_schedule_id) ON DELETE CASCADE unique,
  executive_id number(7) CONSTRAINT vt_exec_fk references employee(employee_id) ON DELETE CASCADE,
  po_status varchar(30),
  vendor_confirmation_email_path varchar(200),
  description_of_status varchar(200)
);
-- Insert
CREATE TABLE TRAINING_REQUEST_LOG
(
  request_log_id varchar(10) primary key,
  training_request_id number(5) CONSTRAINT tlg_tr_fk references training_request(training_request_id) ON DELETE CASCADE not null,
  status_changed_to number(5),
  status_change_time TIMESTAMP(0) not null,
  description varchar(200)
);
-- Update
CREATE TABLE TRAINING_MANAGEMENT_STATUS
(
  training_management_status_id number(5) primary key,
  training_request_id number(5) CONSTRAINT tms_tr_fk references training_request(training_request_id) ON DELETE CASCADE not null,
  status number(5) not null
);

--New tables to store the short listed vendors for SPOC and PT
CREATE TABLE VENDOR_SHORT_LIST_SPOC
(
  vendor_short_list_spoc_id number(5) primary key,
  vendor_training_request_id number(5) CONSTRAINT vt_trngreq_fk references vendor_training_request(vendor_training_request_id) ON DELETE CASCADE not null,
  vendor_id number(5) CONSTRAINT vt_vend_fk references vendor_details(vendor_id) ON DELETE CASCADE
);


CREATE TABLE VENDOR_SHORT_LIST_PT
(
  vendor_short_list_pt_id number(5) primary key,
  vendor_training_request_id number(5) CONSTRAINT vt_trng_req_fk references vendor_training_request(vendor_training_request_id) ON DELETE CASCADE not null,
  vendor_id number(5) CONSTRAINT vt_ven_fk references vendor_details(vendor_id) ON DELETE CASCADE
);

--===================================================================================================================================================================
--#32 trainers, 5 spocs, 9 executives, 5 PM's -> One per Vertical
 
create sequence emp_id_seq
start with 1000000
increment by 1;
 
insert into employee values(emp_id_seq.nextval, 'Person', 'Jonah', 'JP3333333', '123', '7779294431','Jonah_Person@syntelinc.com','1 St','Phoenix', 'AZ', 'US','Trainer','TRM','training', 12345);      
insert into employee values(emp_id_seq.nextval, 'Hanson', 'Maryam', 'HM3333333', '123', '7779294432','Maryam_Hanson@syntelinc.com','142 St','Boston', 'MA', 'US','Trainer', 'TRM','training', 12345); 
insert into employee values(emp_id_seq.nextval, 'Davis', 'David', 'David1234', 'syntel2020', '3101010101', 'david_davis@syntelinc.com', '10 Main St', 'New York City', 'New York', 'US', 'Trainer', 'BNFS', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Nelson', 'Tina', 'Tina1234', 'syntel1010', '5092492929', 'tina_nelson@syntelinc.com', '123 Water St', 'Phoenix', 'AZ', 'US', 'Trainer', 'BNFS', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Nielsen', 'Neal', 'Neal1234', 'syntel9010', '4503902020', 'neal_nielsen@syntelinc.com', '129 Elm St', 'Phoenix', 'AZ', 'US', 'Trainer', 'BNFS', 'Project2', 90291);  
insert into employee values(emp_id_seq.nextval, 'Wayne', 'John', 'JW5526234', 'password456', '23284429', 'jw@hotmail.com', '88 Court', 'Oklahoma City', 'OK','US', 'Trainer', 'HR', 'SYNTEL', 91201);
insert into employee values(emp_id_seq.nextval, 'Brown', 'Lisa', 'Lisa1234', 'synte39393', '2901013892', 'lisa_brown@syntelinc.com', '23 Water St', 'New York City', 'New York', 'US', 'Trainer', 'LAT', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Blue', 'Connor', 'Connor1234', 'synte29010', '1239021010', 'connor_blue@syntelinc.com', '210 1st St', 'New York City', 'New York', 'US', 'Trainer', 'MAN', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Long', 'Cameron', 'Cam1234', 'syntel90102', '7892301010', 'cam_long@syntelinc.com', '12 3rd St', 'Phoenix', 'AZ', 'US', 'Trainer', 'BNFS', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Geller', 'Dan', 'Dan1234', 'syntel23493', '2376583838', 'dan_geller@syntelinc.com', '9 1st St', 'Boston', 'MA', 'US', 'Trainer', 'RET', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Giles', 'Tom', 'Tom1234', 'syntel67383', '4902863728', 'tom_giles@syntelinc.com', '200 31st St', 'Dallas', 'TX', 'US', 'Trainer', 'INS', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Newton', 'Jenna', 'Jenna5555', 'syntel68789', '2082134892', 'jenna_newton@syntelinc.com', '45 Central St', 'Troy', 'MI', 'US', 'Trainer', 'BNFS', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Marion', 'Paul', 'Paul4321', 'syntel9090', '4502673939', 'paul_marion@syntelinc.com', '290 Main St', 'New York City', 'New York', 'US', 'Trainer', 'MAN', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Meehan', 'Mark', 'Mark3092', 'syntel39020', '4591013490', 'mark_meehan@syntelinc.com', '99 Water St', 'Troy', 'MI', 'US', 'Trainer', 'INS', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Junge', 'Alexa', 'Alexa2572', 'syntel29999', '8885673939', 'alexa_junge@syntelinc.com', '291 91 St', 'New York City', 'New York', 'US', 'Trainer', 'LAT', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Chase', 'Greg', 'Greg1902', 'synte45892', '9028912891', 'greg_chase@syntelinc.com', '100 Tremont St', 'Boston', 'MA', 'US', 'Trainer', 'RET', 'Project1', 90291);
insert into employee values(emp_id_seq.nextval, 'Gallagher','Galena','1692122094199','4328 PJ','6344374917','pharetra@Nullainterdum.net','Ap #633-2681 Sagittis Av.','Gold Coast','Queensland','Mozambique','Trainer','MAN','Project3', 12347);      
insert into employee values(emp_id_seq.nextval, 'Kaufman','Whilemina','1621051576799','84-939','876-398-3806','lectus.quis@actellus.co.uk','846-7751 Eu Rd.','Veere','Zeeland','Cuba','Trainer', 'RET','Project2', 12346); 
insert into employee values(emp_id_seq.nextval, 'Lowe','Jemima','1634022282599','54364','973-392-2297','cursus.et@Donecluctus.com','Ap #413-2500 Sit Av.','Aserrí','SJ','Chrish Isl', 'Trainer', 'BNFS', 'Project4', 12290);
insert into employee values(emp_id_seq.nextval, 'Douglas','Allegra','1613111967199','259656','113-658-9672','neque@augue.net','1164 Quisque St.','Rea','LOM','Cuba', 'Trainer', 'LAT', 'Project7', 98876);
insert into employee values(emp_id_seq.nextval, 'Hatfield','Amal','1632110493599','68266','862-227-8145','nisi.tum@ut.ca','3209 Eu St.','Dublin','Leinster','Gambia', 'Trainer', 'INS', 'Project5', 90310);  
insert into employee values(emp_id_seq.nextval, 'Fitzpatrick','Fletcher','1691021140499','7871','730-457-1142','ridiculus.mus.Aenean@risusodioauctor.net','12 Nec Street','Polatli','Ankara','Haiti', 'Trainer', 'HR', 'Project10', 96578);
insert into employee values(emp_id_seq.nextval, 'Joyce','Tamekah','1643040341099','646045','323-304-9732','placerat.augue.Sed@enim.co.uk','9611 Sem Road','Quesada','A','Senegal', 'Trainer', 'BNFS', 'Project2', 90201);
insert into employee values(emp_id_seq.nextval, 'Farmer','Bo','1629051972899','5015','293-446-4988','at.velit@variusorciin.org','5315 Cursus Ave','Cork','Munster','Kenya', 'Trainer', 'MAN', 'Project1', 12345);
insert into employee values(emp_id_seq.nextval, 'Conley','Raven','1615012431399','19104','724-648-5354','enim.Etiam.imperdiet@purusgravida.ca','34 Quis Road','Piotrków Trybunalski','LD','Russian Federation', 'Trainer', 'BNFS', 'Project8', 97777);
insert into employee values(emp_id_seq.nextval, 'Alford','Cora','1653082566599','803591','337-566-3247','tristique.neque@perconubianostra.edu','Ante. Avenue','Gbongan','Osun','Papua New', 'Trainer', 'RET', 'Project9', 93401);
insert into employee values(emp_id_seq.nextval, 'Shaffer','Penelope','1643053016499','18363','856-170-5178','magna.a@aliquetmolestie.net','Ap #220-4576 In St.','Dublin','Leinster','Panama', 'Trainer', 'INS', 'Project5', 90301);
insert into employee values(emp_id_seq.nextval, 'Anthony','Colt','1636080746799','981431','670-499-7188','nec.orci@mollisnon.org','142-5480 Lacus, Road','Jodhpur','Rajasthan','Yemen', 'Trainer', 'BNFS', 'Project2', 90201);
insert into employee values(emp_id_seq.nextval, 'Tillman','Damon','1677112033299','74252','858-712-5095','interdum@Seddiam.ca','545-2972 Ac, Road','San José','San José','Kazakhstan', 'Trainer', 'MAN', 'Project1', 12345);
insert into employee values(emp_id_seq.nextval, 'Charles','Chantale','1633092787099','6691','153-494-6957','ante.dictum@velit.net','Ap #655-413 Ad St.','Cañas','Guanacaste','Portugal', 'Trainer', 'INS', 'Project10', 96578);
insert into employee values(emp_id_seq.nextval, 'Duran','Bevis','1695061141399','9656','423-864-3046','at@natoquepenatibuset.co.uk','1414 Ut Ave','Saint-Pierre','LX','Saint Vin', 'Trainer', 'LAT', 'Project7', 98876);
insert into employee values(emp_id_seq.nextval, 'Cameron','Tanek','1629011561299','868409','677-561-6740','ut@Vivamusnibhdolor.co.uk','759 Turpis. Av.','Gore','SI','Slovakia', 'Trainer', 'RET', 'Project3', 12347);


-- 5 SPOCs
insert into employee values(emp_id_seq.nextval, 'Moran', 'Inaaya', 'IM1111111', '123', '7759294432','Inaaya_Moran@syntelinc.com','122 St','Boston', 'MA', 'US','SPOC', 'LAT','training', 12345);  
insert into employee values(emp_id_seq.nextval, 'Jones', 'Adam', 'Adam4333', 'syntel2019', '3335556666', 'adam_jones@syntelinc.com', '45 Park St', 'Troy', 'MI', 'US', 'SPOC', 'MAN', 'Training', 90292);
insert into employee values(emp_id_seq.nextval, 'Green', 'Lucy', 'Lucy1234', 'syntel2390', '1239039202', 'lucy_green@syntelinc.com', '18 Loring Dr', 'Memphis', 'TN', 'US', 'SPOC', 'RET', 'Training', 90292);
insert into employee values(emp_id_seq.nextval, 'Long', 'Jane', 'Jane2901', 'syntel2078', '6892092090', 'jane_long@syntelinc.com', '70 First St', 'Boston', 'MA', 'US', 'SPOC', 'INS', 'Training', 90292);
insert into employee values(emp_id_seq.nextval, 'Gwynn', 'Tony', 'TG2983950', 'pw2019', '9822944098', 'saflk@gmail.com', '55 Street', 'San Francisco', 'CA', 'US', 'SPOC', 'BNFS', 'Training', 90345);


insert into employee values(emp_id_seq.nextval, 'Johnson', 'Rachel', 'Rachel4321', 'syntel9876', '9902203330', 'rachel_johnson@syntelinc.com', '124 Pleasant St', 'Phoenix', 'AZ', 'US', 'Executive', 'LAT', 'Training', 90292);
insert into employee values(emp_id_seq.nextval, 'OBrien', 'Larry', 'Larry4321', 'syntel2222', '7763938282', 'larry_obrien@syntelinc.com', '34 Bradford Rd', 'Troy', 'MI', 'US', 'Executive', 'MAN', 'Training', 90292);
insert into employee values(emp_id_seq.nextval, 'Meyers', 'Kathy', 'Kathy9991', 'syntel8818', '8887171717', 'Kathy_Meyers@syntelinc.com', '11 King St', 'Phoenix', 'AZ', 'US', 'Executive', 'RET', 'Training', 90292);
insert into employee values(emp_id_seq.nextval, 'Jones', 'Tim', 'Tim1234', 'syntel3409', '3902022092', 'tim_jones@syntelinc.com', '120 Central St', 'Phoenix', 'AZ', 'US', 'Executive', 'INS', 'Training', 90292);
insert into employee values(emp_id_seq.nextval, 'Meadows', 'Rita', 'MR2222222', 'syntel1523', '7769294432','Rita_Meadows@syntelinc.com','132 St','Boston', 'MA', 'US','Executive', 'BNFS','Training', 12345); 
insert into employee values(emp_id_seq.nextval, 'Lewis', 'Janice', 'JL5589390', 'syntel3333', '2490303030', 'janice_lewis@syntelinc.com', '88 Boulevard', 'Syracuse', 'NY', 'US', 'Executive', 'HR', 'SYNTEL', 90310);
insert into employee values(emp_id_seq.nextval, 'Tremont', 'Michael', 'MF5589234', 'syntel7767', '3992891203', 'michael_tremont@syntelinc.com', '45 23nd St', 'Miami', 'FL', 'US', 'Executive', 'HR', 'SYNTEL', 90310);
insert into employee values(emp_id_seq.nextval, 'Filipelli', 'Michael', 'MF5589236', 'syntel0123', '2328392988', 'michael_filipelli', '19 39th St', 'Phoenix', 'AZ', 'US', 'Executive', 'HR', 'SYNTEL', 90310);
insert into employee values(emp_id_seq.nextval, 'Fisher', 'Monica', 'MF5589237', 'syntel25918', '8939132222', 'monica_fisher@syntelinc.com', '88 4th St', 'Dallas', 'TX', 'US', 'Executive', 'HR', 'SYNTEL', 90310);


-- #10 Trainees

insert into employee values(emp_id_seq.nextval, 'Brock','Sybil','1671112940399','74-280','111-102-1823','quam@odioPhasellusat.edu','P.O. Box 337, 9832 Auctor St.','Palmerston','NT','Nigeria', 'Trainee', 'INS', 'project5', 90310);
insert into employee values(emp_id_seq.nextval, 'Woods','Mari','1664121015299','M5C 3UL','762-351-4889','odio.vel@faucibusorciluctus.edu','5265 A Rd.','Troyes','CH','Solomon Islands', 'Trainee', 'RET','project3', 12347);
insert into employee values(emp_id_seq.nextval, 'Hughes','Joshua','1647033038099','53585','493-896-4368','tellus@estconguea.co.uk','1291 Tellus Av.','Dublin','Leinster','Liberia', 'Trainee', 'INS', 'Project2', 90201);
insert into employee values(emp_id_seq.nextval, 'Norton','Sacha','1684010702199','780140','245-962-5735','blandit.enim@nullamagnamalesuada.org','680 Turpis Rd.','Lac-Serent','QC','Estonia', 'Trainee', 'RET','project3', 12347);
insert into employee values(emp_id_seq.nextval, 'Riley','Allen','1664082898599','86-950','486-356-1204','erat.vel@magnis.net','100-3634 Pretium Street','Vienna','Vienna','Saint Barthélemy', 'Trainee', 'LAT','project7', 98876);
insert into employee values(emp_id_seq.nextval, 'Olsen','Rhona','1692061043599','4393','604-350-7220','lacus@Donecnibhenim.com','Ap #197-9929 Ut Avenue','Levin','NI','Honduras','Trainee', 'LAT','project7', 98876); 
insert into employee values(emp_id_seq.nextval, 'Mooney','Berk','1617031228099','01413','468-869-3550','diam.Pellentesque.habitant@sedest.com','P.O. Box 176, 1841 Proin Av.','Dordrecht','Z.','Switzerland', 'Trainee', 'BNFS','project8', 97777);
insert into employee values(emp_id_seq.nextval, 'Richmond','Sharon','1695020824799','DH87 9PT','295-276-0648','nisi@tristiquealiquetPhasellus.org','582-941 Ipsum Avenue','Santa Cruz de Tenerife','CN','Papua New Guinea', 'Trainee', 'BNFS','project8', 97777);
insert into employee values(emp_id_seq.nextval, 'Wilkinson','Trevor','1600033030399','11015','876-873-5521','at.arcu@Maecenasiaculis.org','P.O. Box 572, 9145 Nec Road','Bremen','Bremen','Qatar', 'Trainee', 'INS','project2', 12346);
insert into employee values(emp_id_seq.nextval, 'Cardenas','Valentine','1687040945499','04856','516-790-8827','Mauris.eu@mus.co.uk','3561 Eget Av.','P?ock','MA','Ethiopia', 'Trainee', 'BNFS', 'Project2', 90201);


--#5 REQUESTERS

insert into employee values(emp_id_seq.nextval, 'Johnson', 'Joe', 'JJ2347343', 'hunter2', '2328392990', 'jkjhkjhj@yahoo.com', '23 Street', 'Atlanta', 'GA', 'US', 'Project Manager', 'LAT', 'FEDEX', 12345);
insert into employee values(emp_id_seq.nextval, 'Washington', 'Jeff', 'JW2345543', 'password', '2348922870', 'jwash@yahoo.com', '67 Avenue', 'Tampa Bay', 'FL', 'US', 'Project Manager', 'MAN', 'AMEX', 91234);
insert into employee values(emp_id_seq.nextval, 'Read', 'Emma', 'Emma1234', 'synte1920', '3490103902', 'e_read@syntelinc.com', '19 Pleasant St', 'Miami', 'FL', 'US', 'Project Manager', 'RET', 'Project2', 90201);
insert into employee values(emp_id_seq.nextval, 'Smith', 'John', 'John1234', 'syntel123', '4099012929', 'john_smith@syntelinc.com', '15 Main St', 'Boston', 'MA', 'US', 'Project Manager', 'INS', 'Project1', 90291);             
insert into employee values(emp_id_seq.nextval, 'Magana', 'Kinga', 'KM1234568', '123', '7749394432','Kinga_Magana@syntelinc.com','14 Avenue Ave','Boston', 'MA', 'US','Project Manager', 'BNFS','project2', 12346);                         

--==================================================================================================================================                           
 
--#115 requests
 
create sequence training_id_request_seq
start with 10000
increment by 1;
 
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','JavaFSD','Spring', 'class room', TO_DATE('2019/02/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/03/18 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','.NET','.NET Core', 'web based', TO_DATE('2018/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/10/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','.NET','.NET Core', 'class room', TO_DATE('2019/06/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/07/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 20,1000036  ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','Cisco CCNA','Routing and Switching', 'web based', TO_DATE('2018/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Dallas', 'CST', 22,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','Azure','Machine Learning', 'class room', TO_DATE('2019/08/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/09/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Troy', 'CST', 15,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','Python','NumPy TensorFlow', 'class room', TO_DATE('2018/04/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Denver', 'MST', 15,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','Azure','Machine Learning', 'class room', TO_DATE('2019/10/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/11/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','JavaFSD','SpringMVC', 'web based', TO_DATE('2018/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/10/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Los Angeles', 'PST', 15,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','.NET','MVC 5', 'class room', TO_DATE('2019/01/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/02/17 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','Mobile', 'Spring Mobile', 'web based', TO_DATE('2018/05/14 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/06/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Chicago', 'CST', 93, 1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','Front End', 'Bootstrap', 'web based', TO_DATE('2019/01/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/03/28 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'New York', 'EST', 10, 1000036 ,TO_DATE('2019/01/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','JavaFSD', 'Spring Boot', 'web based', TO_DATE('2018/07/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/08/29 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Los Angeles', 'PST', 6, 1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/09/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/10/08 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/04/08 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','.NET','.NET Core', 'web based', TO_DATE('2019/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/11/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','.NET','.NET Core', 'class room', TO_DATE('2018/06/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/08/06 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 20,1000036 , TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','Cisco CCNA','Routing and Switching', 'web based', TO_DATE('2019/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/06/26 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Dallas', 'CST', 22,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','Azure','Machine Learning', 'class room', TO_DATE('2018/08/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/09/26 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Troy', 'CST', 15,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','Python','NumPy TensorFlow', 'class room', TO_DATE('2019/04/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Denver', 'MST', 15,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','IT','Azure','Machine Learning', 'class room', TO_DATE('2018/10/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/11/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','VT','JavaFSD', 'Spring Boot', 'web based', TO_DATE('2019/11/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Los Angeles', 'PST', 6, 1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','VT','.NET','.NET Framework', 'class room', TO_DATE('2018/12/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/01/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','VT','JavaFST', 'SpringMVC', 'class room', TO_DATE('2019/07/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/09/04 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 10, 1000036 , TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','VT','.NET', '.NET Framework', 'web based', TO_DATE('2018/05/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/07/04 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 15, 1000036 , TO_DATE('2018/12/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','VT','Azure', 'Azure', 'class room', TO_DATE('2019/09/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/11/06 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 20, 1000036 , TO_DATE('2019/01/02 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','VT','.NET', '.NET Framework', 'class room', TO_DATE('2018/03/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 25, 1000036 , TO_DATE('2019/01/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','VT','Java FSD', 'SpringBoot', 'web based', TO_DATE('2019/08/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/10/14 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 15, 1000036 , TO_DATE('2018/12/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','VT','Python', 'numpy', 'class room', TO_DATE('2018/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/11/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 20, 1000036 , TO_DATE('2019/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','DTT','Azure','Machine Learning', 'class room', TO_DATE('2018/08/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Troy', 'CST', 15,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','DTT','Python','NumPy TensorFlow', 'class room', TO_DATE('2019/04/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/05/26 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Denver', 'MST', 15,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000060 ,'BNFS','DTT','Azure','Machine Learning', 'class room', TO_DATE('2018/10/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/11/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000036 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');



insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/03/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/05/18 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000033 ,TO_DATE('2018/03/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/04/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/06/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000033 ,TO_DATE('2019/05/02 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/05/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/07/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000033 ,TO_DATE('2019/11/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/06/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/08/17 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000033 ,TO_DATE('2018/12/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/07/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/09/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000033 ,TO_DATE('2019/02/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/08/08 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/10/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000033 ,TO_DATE('2018/11/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/09/17 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/11/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000033 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/10/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/12/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000033 ,TO_DATE('2018/03/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/11/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/28 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000033 ,TO_DATE('2019/05/02 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/12/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/02/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000033 ,TO_DATE('2019/11/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/01/06 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/03/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000033 ,TO_DATE('2018/12/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','VT','.NET','.NET Core', 'web based', TO_DATE('2019/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/11/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000033 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','VT','.NET','.NET Core', 'class room', TO_DATE('2018/06/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/08/06 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 20,1000033 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','DTT','Front End', 'Bootstrap', 'web based', TO_DATE('2018/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/11/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'New York', 'EST', 10, 1000033 , TO_DATE('2019/01/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000057 ,'MAN','DTT','JavaFSD', 'Spring Boot', 'web based', TO_DATE('2019/07/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/09/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Los Angeles', 'PST', 6, 1000033 , TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 



insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/02/09 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/02/16 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2019/02/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/03/25 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/05/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2018/11/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/04/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/06/08 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/05/16 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/07/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2018/03/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/06/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/08/17 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2019/05/02 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/07/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/09/28 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2019/11/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/08/05 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/10/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2018/12/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/09/14 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/09/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2019/02/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/10/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/12/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2018/11/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/11/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/12/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/02/26 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2018/03/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/01/28 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/03/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2019/05/02 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/02/09 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/04/16 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000034 ,TO_DATE('2019/11/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','JavaFSD','SpringMVC', 'web based', TO_DATE('2019/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/11/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Los Angeles', 'PST', 15,1000034 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','.NET','MVC 5', 'class room', TO_DATE('2018/01/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/03/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000034 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','Mobile', 'Spring Mobile', 'web based', TO_DATE('2019/05/14 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/07/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Chicago', 'CST', 93, 1000034 , TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','IT','Front End', 'Bootstrap', 'web based', TO_DATE('2018/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/11/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'New York', 'EST', 10, 1000034 , TO_DATE('2019/01/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','VT','.NET', '.NET Framework', 'web based', TO_DATE('2019/04/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/06/04 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 25, 1000034 , TO_DATE('2018/12/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','VT','JavaFSD','Spring', 'class room', TO_DATE('2018/05/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/07/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000034 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','DTT','JavaFSD','SpringMVC', 'web based', TO_DATE('2019/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/11/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Los Angeles', 'PST', 15,1000034 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','DTT','.NET','MVC 5', 'class room', TO_DATE('2018/01/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/03/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000034 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000058 ,'RET','DTT','Mobile', 'Spring Mobile', 'web based', TO_DATE('2019/05/14 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/07/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Chicago', 'CST', 93, 1000034 , TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 



insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/03/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/05/08 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000032 ,TO_DATE('2018/12/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','.NET','.NET Framework', 'class room', TO_DATE('2018/04/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/06/04 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50, 1000032 ,TO_DATE('2019/02/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','.NET','.NET Framework', 'class room', TO_DATE('2019/05/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/07/06 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 50,1000032 ,TO_DATE('2018/11/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','JavaFST', 'SpringMVC', 'class room', TO_DATE('2018/10/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/11/28 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 10, 1000032 , TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','.NET', '.NET Framework', 'web based', TO_DATE('2019/02/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/04/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 15, 1000032 , TO_DATE('2018/12/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','Azure', 'Azure', 'class room', TO_DATE('2018/01/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/03/18 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 20, 1000032 , TO_DATE('2019/01/02 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','.NET', '.NET Framework', 'class room', TO_DATE('2019/03/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 25, 1000032 , TO_DATE('2019/01/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','.NET','MVC 5', 'class room', TO_DATE('2018/01/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/03/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000032 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','Mobile', 'Spring Mobile', 'web based', TO_DATE('2019/05/14 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/07/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Chicago', 'CST', 93, 1000032 , TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','Front End', 'Bootstrap', 'web based', TO_DATE('2018/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/11/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'New York', 'EST', 10, 1000032 , TO_DATE('2019/01/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','JavaFSD', 'Spring Boot', 'web based', TO_DATE('2019/07/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/08/29 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Los Angeles', 'PST', 6, 1000032 , TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','IT','JavaFSD','Spring', 'class room', TO_DATE('2018/02/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/04/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000032 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','VT','Azure','Machine Learning', 'class room', TO_DATE('2018/02/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/03/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000032 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','VT','JavaFSD','SpringMVC', 'web based', TO_DATE('2019/03/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/05/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Los Angeles', 'PST', 15,1000032 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','VT','.NET','MVC 5', 'class room', TO_DATE('2018/06/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/08/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000032 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','VT','Mobile', 'Spring Mobile', 'web based', TO_DATE('2019/05/14 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/07/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Chicago', 'CST', 93, 1000032 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','VT','Front End', 'Bootstrap', 'web based', TO_DATE('2018/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/11/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'New York', 'EST', 10, 1000032 ,TO_DATE('2019/01/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','DTT','JavaFSD','Spring', 'class room', TO_DATE('2018/02/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/04/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000032 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','DTT','.NET','.NET Core', 'web based', TO_DATE('2019/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/11/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000032 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','DTT','.NET','.NET Core', 'class room', TO_DATE('2018/06/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/08/06 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 20,1000032 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000056 ,'LAT','DTT','Cisco CCNA','Routing and Switching', 'web based', TO_DATE('2019/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/06/25 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Dallas', 'CST', 22,1000032 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');


insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','IT','Java FSD', 'SpringBoot', 'web based', TO_DATE('2018/01/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/03/18 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 15, 1000035 , TO_DATE('2018/12/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','IT','Python', 'numpy', 'class room', TO_DATE('2019/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/11/08 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Nashville', 'CST', 20, 1000035 , TO_DATE('2019/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','IT','JavaFSD','Spring', 'class room', TO_DATE('2018/05/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/07/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','IT','.NET','.NET Core', 'web based', TO_DATE('2019/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/11/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','IT','.NET','.NET Core', 'class room', TO_DATE('2018/06/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/08/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 20,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','IT','Cisco CCNA','Routing and Switching', 'web based', TO_DATE('2019/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/06/26 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Dallas', 'CST', 22,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','IT','Azure','Machine Learning', 'class room', TO_DATE('2018/08/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/09/26 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Troy', 'CST', 15,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','IT','Python','NumPy TensorFlow', 'class room', TO_DATE('2019/04/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Denver', 'MST', 15,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','IT','Azure','Machine Learning', 'class room', TO_DATE('2018/10/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/11/27 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','IT','JavaFSD','SpringMVC', 'web based', TO_DATE('2019/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/10/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Los Angeles', 'PST', 15,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','VT','JavaFSD','Spring', 'class room', TO_DATE('2018/02/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/04/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','VT','.NET','.NET Core', 'web based', TO_DATE('2019/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/11/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Boston', 'EST', 10,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','VT','.NET','.NET Core', 'class room', TO_DATE('2018/06/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/08/06 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 20,1000035  ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','VT','Cisco CCNA','Routing and Switching', 'web based', TO_DATE('2019/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/06/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Dallas', 'CST', 22,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','VT','Azure','Machine Learning', 'class room', TO_DATE('2018/08/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/09/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Troy', 'CST', 15,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','VT','Python','NumPy TensorFlow', 'class room', TO_DATE('2019/01/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/02/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Denver', 'MST', 15,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','DTT','Cisco CCNA','Routing and Switching', 'web based', TO_DATE('2019/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/06/25 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Dallas', 'CST', 22, 1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','DTT','Azure','Machine Learning', 'class room', TO_DATE('2018/08/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/09/26 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Troy', 'CST', 15,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','DTT','Python','NumPy TensorFlow', 'class room', TO_DATE('2019/04/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/05/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Denver', 'MST', 15,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','DTT','Azure','Machine Learning', 'class room', TO_DATE('2018/10/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/11/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','DTT','JavaFSD','SpringMVC', 'web based', TO_DATE('2019/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/11/14 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Los Angeles', 'PST', 15,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','DTT','.NET','MVC 5', 'class room', TO_DATE('2018/01/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/03/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Phoenix', 'MST', 15,1000035 ,TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed');
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','DTT','Mobile', 'Spring Mobile', 'web based', TO_DATE('2019/05/14 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/07/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Chicago', 'CST', 93, 1000035 , TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','DTT','Front End', 'Bootstrap', 'web based', TO_DATE('2018/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/11/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'New York', 'EST', 10, 1000035 , TO_DATE('2019/01/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 
insert into training_request values(training_id_request_seq.nextval,1000059 ,'INS','DTT','JavaFSD', 'Spring Boot', 'web based', TO_DATE('2019/07/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/09/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Los Angeles', 'PST', 6, 1000035 , TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Needed'); 

--================================================================================================================================== 
 
insert into INTERNAL_TRAINER values(1000000, 'Profile/Path', 'Phoenix');
insert into INTERNAL_TRAINER values(1000001, 'Profile/Path', 'Boston');
insert into INTERNAL_TRAINER values(1000002, 'Profile/Path', 'New York City');
insert into INTERNAL_TRAINER values(1000003, 'Profile/Path', 'Phoenix');
insert into INTERNAL_TRAINER values(1000004, 'Profile/Path', 'Phoenix');
insert into INTERNAL_TRAINER values(1000005, 'Profile/Path', 'Oklahoma City');
insert into INTERNAL_TRAINER values(1000006, 'Profile/Path', 'New York');
insert into INTERNAL_TRAINER values(1000007, 'Profile/Path', 'New York');
insert into INTERNAL_TRAINER values(1000008, 'Profile/Path', 'Phoenix');
insert into INTERNAL_TRAINER values(1000009, 'Profile/Path', 'Boston');
insert into INTERNAL_TRAINER values(1000010, 'Profile/Path', 'Dallas');
insert into INTERNAL_TRAINER values(1000011, 'Profile/Path', 'Troy');
insert into INTERNAL_TRAINER values(1000012, 'Profile/Path', 'New York City');
insert into INTERNAL_TRAINER values(1000013, 'Profile/Path', 'Troy');
insert into INTERNAL_TRAINER values(1000014, 'Profile/Path', 'New York City');
insert into INTERNAL_TRAINER values(1000015, 'Profile/Path', 'Boston');

--================================================================================================================================== 
 
create sequence training_schedule_id_seq
start with 10000
increment by 1;
/*
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '542 Main St', 'R210', TO_DATE('2019/02/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/03/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'New York City', 'NY', 'US', '10001', 'EST', '30 34th St', 'R330', TO_DATE('2018/09/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/11/14 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', '54 Elm Ave', 'R440', TO_DATE('2019/06/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/08/06 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', null, null, TO_DATE('2018/05/04 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/25 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'San Francisco', 'CA', 'US', '94016', 'PST', null, null, TO_DATE('2019/08/05 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/09/26 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '234 Boylston St', null, TO_DATE('2018/04/02 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/05/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', '230 Water St', 'R590', TO_DATE('2019/10/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Atlanta', 'GA', 'US', '30301', 'EST', '74 Main St', 'R291', null , TO_DATE('2018/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Los Angeles', 'CA', 'US', '90001', 'PST', null, null, TO_DATE('2019/01/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Dallas', 'TX', 'US', '75001', 'CST', '19 2nd St', null, TO_DATE('2018/05/14 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/07/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '94 Tremont St', 'R101', TO_DATE('2019/01/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', null, null, TO_DATE('2018/07/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/09/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '542 Main St', 'R210', TO_DATE('2019/09/02 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/10/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'New York City', 'NY', 'US', '10001', 'EST', '30 34th St', 'R330', TO_DATE('2018/02/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/03/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', '54 Elm Ave', 'R440', TO_DATE('2019/03/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', null, null, TO_DATE('2018/04/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/05 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'San Francisco', 'CA', 'US', '94016', 'PST', null, null, TO_DATE('2019/05/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/07/08 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '234 Boylston St', null, TO_DATE('2018/06/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/08/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Atlanta', 'GA', 'US', '30301', 'EST', '74 Main St', 'R291',  TO_DATE('2019/07/25 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/09/18 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Los Angeles', 'CA', 'US', '90001', 'PST', null, null, TO_DATE('2018/08/08 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/10/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Dallas', 'TX', 'US', '75001', 'CST', '19 2nd St', null, TO_DATE('2019/09/17 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/11/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '94 Tremont St', 'R101', TO_DATE('2018/10/02 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', null, null, TO_DATE('2019/11/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '542 Main St', 'R210', TO_DATE('2019/12/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/06/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'New York City', 'NY', 'US', '10001', 'EST', '30 34th St', 'R330', TO_DATE('2019/01/06 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/07/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', '54 Elm Ave', 'R440', TO_DATE('2018/02/08 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', null, null, TO_DATE('2019/03/25 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'San Francisco', 'CA', 'US', '94016', 'PST', null, null, TO_DATE('2018/04/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '89034', 'MST', null, null, TO_DATE('2019/05/17 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '234 Boylston St', null, TO_DATE('2018/06/09 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/02/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', '230 Water St', 'R590', TO_DATE('2019/07/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Atlanta', 'GA', 'US', '30301', 'EST', '74 Main St', 'R291', TO_DATE('2018/08/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Los Angeles', 'CA', 'US', '90001', 'PST', null, null, TO_DATE('2019/09/17 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Dallas', 'TX', 'US', '75001', 'CST', '19 2nd St', null, TO_DATE('2018/10/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '94 Tremont St', 'R101', TO_DATE('2019/11/04 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', null, null, TO_DATE('2018/12/17 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '57 Main St', null, TO_DATE('2019/01/28 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/05/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'New York City', 'NY', 'US', '10001', 'EST', null, null, TO_DATE('2018/02/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/07/16 12:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', ' 8 N 27th St', 'R101', TO_DATE('2019/03/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/10/06 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', null, null, TO_DATE('2018/04/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'San Francisco', 'CA', 'US', '94016', 'PST', null, null, TO_DATE('2019/05/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/06 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '89034', 'MST', null, null,  TO_DATE('2018/10/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '234 Boylston St', null, TO_DATE('2019/02/09 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/04/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', '230 Water St', 'R590', TO_DATE('2018/01/15 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Atlanta', 'GA', 'US', '30301', 'EST', '74 Main St', 'R291', TO_DATE('2019/03/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/08 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Los Angeles', 'CA', 'US', '90001', 'PST', null, null, TO_DATE('2018/01/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2020/02/16 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Dallas', 'TX', 'US', '75001', 'CST', '19 2nd St', null, TO_DATE('2019/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/07/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown','URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', null, null, TO_DATE('2018/05/18 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/04/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown','URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '542 Main St', 'R210', TO_DATE('2019/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/07/08 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'New York City', 'NY', 'US', '10001', 'EST', '30 34th St', 'R330', TO_DATE('2018/06/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2020/01/05 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');




--============================================
--STOP HERE IF YOU WANT LESS DATA TO WORK WITH
--============================================




insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', '54 Elm Ave', 'R440', TO_DATE('2019/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/08/23 11:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown','URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', null, null, TO_DATE('2018/08/02 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/07 12:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown','URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'San Francisco', 'CA', 'US', '94016', 'PST', null, null, TO_DATE('2019/04/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/11/26 14:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '89034', 'MST', null, null, TO_DATE('2018/10/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '234 Boylston St', null, TO_DATE('2019/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/05/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', '230 Water St', 'R590', TO_DATE('2018/01/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Atlanta', 'GA', 'US', '30301', 'EST', '74 Main St', 'R291', TO_DATE('2019/05/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/06/18 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Los Angeles', 'CA', 'US', '90001', 'PST', null, null, TO_DATE('2018/09/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/08/24 10:30:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Dallas', 'TX', 'US', '75001', 'CST', '19 2nd St', null, TO_DATE('2019/07/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/04/05 08:30:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '94 Tremont St', 'R101', TO_DATE('2018/02/05 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', null, null, TO_DATE('2019/09/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/30 09:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '542 Main St', 'R210', TO_DATE('2018/06/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/10/03 15:30:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'New York City', 'NY', 'US', '10001', 'EST', '30 34th St', 'R330', TO_DATE('2019/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/08/26 10:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', '54 Elm Ave', 'R440', TO_DATE('2018/08/05 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/23 15:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', null, null, TO_DATE('2019/04/05 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/06/13 14:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'San Francisco', 'CA', 'US', '94016', 'PST', null, null, TO_DATE('2018/10/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/24 16:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL','1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '89034', 'MST', null, null, TO_DATE('2019/09/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '234 Boylston St', null, TO_DATE('2018/01/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/09/13 12:30:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '94 Tremont St', 'R101', TO_DATE('2019/05/16 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', null, null, TO_DATE('2018/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/30 09:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '542 Main St', 'R210', TO_DATE('2019/07/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/10/03 15:30:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'New York City', 'NY', 'US', '10001', 'EST', '30 34th St', 'R330', TO_DATE('2018/02/05 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/08/26 10:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', '54 Elm Ave', 'R440', TO_DATE('2019/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/23 15:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', null, null, TO_DATE('2018/06/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/06/13 14:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'San Francisco', 'CA', 'US', '94016', 'PST', null, null, TO_DATE('2019/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/24 16:00:00', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '89034', 'MST', null, null, TO_DATE('2018/08/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '542 Main St', 'R210', TO_DATE('2019/01/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/06/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'New York City', 'NY', 'US', '10001', 'EST', '30 34th St', 'R330', TO_DATE('2018/02/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/07/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', '54 Elm Ave', 'R440', TO_DATE('2019/03/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', null, null, TO_DATE('2018/06/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'San Francisco', 'CA', 'US', '94016', 'PST', null, null, TO_DATE('2019/05/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '234 Boylston St', null, TO_DATE('2018/09/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/02/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', '230 Water St', 'R590', TO_DATE('2019/11/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Atlanta', 'GA', 'US', '30301', 'EST', '74 Main St', 'R291', null , TO_DATE('2018/12/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Los Angeles', 'CA', 'US', '90001', 'PST', null, null, TO_DATE('2019/07/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '542 Main St', 'R210', TO_DATE('2018/05/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/06/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'New York City', 'NY', 'US', '10001', 'EST', '30 34th St', 'R330', TO_DATE('2019/09/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/07/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', '54 Elm Ave', 'R440', TO_DATE('2018/03/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', null, null, TO_DATE('2019/08/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'San Francisco', 'CA', 'US', '94016', 'PST', null, null, TO_DATE('2018/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '234 Boylston St', null, TO_DATE('2019/04/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/02/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', '230 Water St', 'R590', TO_DATE('2018/05/17 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Atlanta', 'GA', 'US', '30301', 'EST', '74 Main St', 'R291', TO_DATE('2019/09/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/01/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Los Angeles', 'CA', 'US', '90001', 'PST', null, null, TO_DATE('2018/06/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss')  , TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '542 Main St', 'R210', TO_DATE('2019/05/05 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/06/01 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'New York City', 'NY', 'US', '10001', 'EST', '30 34th St', 'R330', TO_DATE('2018/08/02 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/07/10 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '85001', 'MST', '54 Elm Ave', 'R440', TO_DATE('2019/04/04 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', null, null, TO_DATE('2018/10/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'San Francisco', 'CA', 'US', '94016', 'PST', null, null, TO_DATE('2019/09/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/03/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '234 Boylston St', null, TO_DATE('2018/01/09 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/02/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', '230 Water St', 'R590', TO_DATE('2019/05/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Atlanta', 'GA', 'US', '30301', 'EST', '74 Main St', 'R291', null , TO_DATE('2018/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Los Angeles', 'CA', 'US', '90001', 'PST', null, null, TO_DATE('2019/07/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '234 Boylston St', null, TO_DATE('2018/02/09 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/02/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', '230 Water St', 'R590', TO_DATE('2019/09/18 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Atlanta', 'GA', 'US', '30301', 'EST', '74 Main St', 'R291', TO_DATE('2018/06/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2019/01/12 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Los Angeles', 'CA', 'US', '90001', 'PST', null, null, TO_DATE('2019/05/04 21:02:44', 'yyyy/mm/dd hh24:mi:ss') , TO_DATE('2018/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '89034', 'MST', null, null, TO_DATE('2018/08/05 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '89034', 'MST', null, null, TO_DATE('2019/04/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '89034', 'MST', null, null, TO_DATE('2018/10/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '89034', 'MST', null, null, TO_DATE('2019/09/21 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Boston', 'MA', 'US', '02101', 'EST', '94 Tremont St', 'R101', TO_DATE('2018/01/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Troy', 'MI', 'US', '48007', 'EST', '230 Water St', 'R590', TO_DATE('2019/05/11 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '89034', 'MST', null, null, TO_DATE('2018/09/22 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
insert into TRAINING_SCHEDULE values(training_schedule_id_seq.nextval, 'Phoenix', 'AZ', 'US', '89034', 'MST', null, null, TO_DATE('2019/07/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),null,'BreakDown', 'URL', '1234567890');
*/ 
 
 
 --==================================================================================================================================================================================================================================
 
 
create sequence internal_training_id_seq
start with 10000
increment by 1;
/*
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10000,'class room', 10000,1000000,1000041 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10001,'class room', 10001,1000001,1000041 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10002,'class room',10002,1000002,1000041 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10003,'class room',10003,1000003,1000041 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10004,'class room',10004,1000004,1000041 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10005,'class room',10005,1000005,1000041 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10006,'class room',10006,1000006,1000041 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10007,'class room',10007,1000007,1000041 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10008,'class room',10008,1000008,1000041 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10009,'class room',10009,1000009,1000041 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10010,'class room',10010,1000010,1000041 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10031,'class room',10011,1000011,1000038 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10032,'class room',10012,1000012,1000038 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10033,'class room',10013,1000013,1000038 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10034,'class room',10014,1000014,1000038 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10035,'class room',10015,1000015,1000038 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10046,'class room',10016,1000000,1000039 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10047,'class room',10017,1000001,1000039 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10048,'class room',10018,1000002,1000039 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10049,'class room',10019,1000003,1000039 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10050,'class room',10020,1000004,1000039 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10051,'class room',10021,1000005,1000039 , 'Started');


insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10052,'web based',10050,1000002, 1000039 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10053,'web based',10051,1000003, 1000039 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10054,'web based',10052,1000004, 1000039 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10055,'web based',10053,1000005, 1000039 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10068,'web based',10054,1000006, 1000037 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10069,'web based',10055,1000007, 1000037 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10070,'web based',10056,1000008,1000037 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10071,'web based',10057,1000009,1000037 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10072,'web based',10058,1000010,1000037 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10073,'web based',10059,1000011,1000037 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10074,'web based',10060,1000012,1000037 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10089,'web based',10061,1000013,1000040 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10090,'web based',10062,1000014,1000040 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10091,'web based',10063,1000015,1000040 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10092,'web based',10064,1000000,1000040 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10093,'web based',10065,1000001,1000040 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10094,'web based',10066,1000002,1000040 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10095,'web based',10067,1000003,1000040 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10096,'web based',10068,1000004,1000040 , 'Started');
insert into INTERNAL_TRAINING_REQUEST values(internal_training_id_seq.nextval,10097,'web based',10069,1000005,1000040 , 'Started');
*/

--================================================================================================================================== 
create sequence training_request_log_id_seq
start with 1000000
increment by 1;
 
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10000, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10001, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10002, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10003, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10004, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10005, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10006, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10007, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10008, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10009, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10010, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10011, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10012, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10013, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10014, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10015, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10016, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10017, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10018, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10019, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10020, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10021, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10022, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10023, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10024, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10025, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10026, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10027, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10028, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10029, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10030, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10031, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10032, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10033, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10034, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10035, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10036, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10037, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10038, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10039, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10040, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10041, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10042, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10043, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10044, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10045, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10046, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10047, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10048, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10049, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10050, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10051, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10052, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10053, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10054, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10055, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10056, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10057, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10058, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10059, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10060, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10061, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10062, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10063, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10064, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10065, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10066, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10067, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10068, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10069, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10070, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10071, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10072, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10073, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10074, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10075, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10076, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10077, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10078, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10079, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10080, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10081, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10082, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10083, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10084, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10085, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10086, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10087, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10088, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10089, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10090, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10091, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10092, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10093, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10094, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10095, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10096, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10097, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10098, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10099, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10100, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10101, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10102, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10103, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10104, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10105, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10106, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10107, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10108, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10109, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10110, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10111, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10112, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');
insert into TRAINING_REQUEST_LOG values(training_request_log_id_seq.nextval, 10113, 100, TO_DATE('2019/01/31 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Process Started');

--=================================================================================================================================================================
create sequence executive_workflow_status_seq
start with 10000
increment by 1;
/*
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10000, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10001, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10002, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10003, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10004, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10005, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10006, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10007, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10008, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10009, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10010, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10011, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10012, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10013, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10014, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10015, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10016, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10017, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10018, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10019, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10020, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10021, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10022, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10023, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10024, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10025, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10026, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10027, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10028, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10029, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10030, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10031, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10032, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10033, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10034, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10035, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10036, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10037, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10038, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10039, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10040, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10041, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10042, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10043, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10044, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10045, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10046, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10047, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10048, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10049, getRandExec,0,0,0,0,0,0);




--============================================
--STOP HERE IF YOU WANT LESS DATA TO WORK WITH
--============================================




insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10050, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10051, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10052, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10053, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10054, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10055, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10056, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10057, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10058, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10059, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10060, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10061, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10062, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10063, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10064, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10065, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10066, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10067, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10068, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10069, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10070, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10071, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10072, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10073, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10074, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10075, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10076, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10077, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10078, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10079, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10080, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10081, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10082, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10083, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10084, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10085, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10086, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10087, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10088, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10089, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10090, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10091, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10092, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10093, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10094, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10095, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10096, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10097, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10098, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10099, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10100, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10101, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10102, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10103, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10104, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10105, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10106, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10107, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10108, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10109, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10110, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10111, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10112, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10113, getRandExec,0,0,0,0,0,0);
insert into executive_workflow_status values(executive_workflow_status_seq.nextval,10114, getRandExec,0,0,0,0,0,0);
*/
--=====================================================================================================================
create sequence training_participant_seq
start with 10000
increment by 1;
/*
insert into training_participants values(training_participant_seq.nextval, 1000000, 10000);
insert into training_participants values(training_participant_seq.nextval, 1000001, 10000);
insert into training_participants values(training_participant_seq.nextval, 1000002, 10000);
insert into training_participants values(training_participant_seq.nextval, 1000003, 10000);
insert into training_participants values(training_participant_seq.nextval, 1000004, 10000);

insert into training_participants values(training_participant_seq.nextval, 1000005, 10001);
insert into training_participants values(training_participant_seq.nextval, 1000006, 10001);
insert into training_participants values(training_participant_seq.nextval, 1000007, 10001);
insert into training_participants values(training_participant_seq.nextval, 1000008, 10001);
insert into training_participants values(training_participant_seq.nextval, 1000009, 10001);

insert into training_participants values(training_participant_seq.nextval, 1000010, 10002);
insert into training_participants values(training_participant_seq.nextval, 1000011, 10002);
insert into training_participants values(training_participant_seq.nextval, 1000012, 10002);
insert into training_participants values(training_participant_seq.nextval, 1000013, 10002);
insert into training_participants values(training_participant_seq.nextval, 1000014, 10002);




--============================================
--STOP HERE IF YOU WANT LESS DATA TO WORK WITH
--============================================




insert into training_participants values(training_participant_seq.nextval, 1000015, 10003);
insert into training_participants values(training_participant_seq.nextval, 1000016, 10003);
insert into training_participants values(training_participant_seq.nextval, 1000017, 10003);
insert into training_participants values(training_participant_seq.nextval, 1000018, 10003);
insert into training_participants values(training_participant_seq.nextval, 1000019, 10003);

insert into training_participants values(training_participant_seq.nextval, 1000020, 10004);
insert into training_participants values(training_participant_seq.nextval, 1000021, 10004);
insert into training_participants values(training_participant_seq.nextval, 1000022, 10004);
insert into training_participants values(training_participant_seq.nextval, 1000023, 10004);
insert into training_participants values(training_participant_seq.nextval, 1000024, 10004);

insert into training_participants values(training_participant_seq.nextval, 1000025, 10005);
insert into training_participants values(training_participant_seq.nextval, 1000026, 10005);
insert into training_participants values(training_participant_seq.nextval, 1000027, 10005);
insert into training_participants values(training_participant_seq.nextval, 1000028, 10005);
insert into training_participants values(training_participant_seq.nextval, 1000029, 10005);

insert into training_participants values(training_participant_seq.nextval, 1000030, 10006);
insert into training_participants values(training_participant_seq.nextval, 1000031, 10006);
insert into training_participants values(training_participant_seq.nextval, 1000032, 10006);
insert into training_participants values(training_participant_seq.nextval, 1000033, 10006);
insert into training_participants values(training_participant_seq.nextval, 1000034, 10006);

insert into training_participants values(training_participant_seq.nextval, 1000035, 10007);
insert into training_participants values(training_participant_seq.nextval, 1000036, 10007);
insert into training_participants values(training_participant_seq.nextval, 1000037, 10007);
insert into training_participants values(training_participant_seq.nextval, 1000038, 10007);
insert into training_participants values(training_participant_seq.nextval, 1000039, 10007);

insert into training_participants values(training_participant_seq.nextval, 1000040, 10008);
insert into training_participants values(training_participant_seq.nextval, 1000041, 10008);
insert into training_participants values(training_participant_seq.nextval, 1000042, 10008);
insert into training_participants values(training_participant_seq.nextval, 1000043, 10008);
insert into training_participants values(training_participant_seq.nextval, 1000044, 10008);

insert into training_participants values(training_participant_seq.nextval, 1000045, 10009);
insert into training_participants values(training_participant_seq.nextval, 1000046, 10009);
insert into training_participants values(training_participant_seq.nextval, 1000047, 10009);
insert into training_participants values(training_participant_seq.nextval, 1000048, 10009);
insert into training_participants values(training_participant_seq.nextval, 1000049, 10009);

insert into training_participants values(training_participant_seq.nextval, 1000050, 10010);
insert into training_participants values(training_participant_seq.nextval, 1000051, 10010);
insert into training_participants values(training_participant_seq.nextval, 1000052, 10010);
insert into training_participants values(training_participant_seq.nextval, 1000053, 10010);
insert into training_participants values(training_participant_seq.nextval, 1000054, 10010);

insert into training_participants values(training_participant_seq.nextval, 1000055, 10011);
insert into training_participants values(training_participant_seq.nextval, 1000056, 10011);
insert into training_participants values(training_participant_seq.nextval, 1000057, 10011);
insert into training_participants values(training_participant_seq.nextval, 1000058, 10011);
insert into training_participants values(training_participant_seq.nextval, 1000059, 10011);

insert into training_participants values(training_participant_seq.nextval, 1000060, 10012);
insert into training_participants values(training_participant_seq.nextval, 1000061, 10012);
insert into training_participants values(training_participant_seq.nextval, 1000062, 10012);
insert into training_participants values(training_participant_seq.nextval, 1000063, 10012);
insert into training_participants values(training_participant_seq.nextval, 1000064, 10012);

insert into training_participants values(training_participant_seq.nextval, 1000065, 10013);
insert into training_participants values(training_participant_seq.nextval, 1000066, 10013);
insert into training_participants values(training_participant_seq.nextval, 1000067, 10013);
insert into training_participants values(training_participant_seq.nextval, 1000068, 10013);
insert into training_participants values(training_participant_seq.nextval, 1000069, 10013);

insert into training_participants values(training_participant_seq.nextval, 1000070, 10014);
insert into training_participants values(training_participant_seq.nextval, 1000071, 10014);
insert into training_participants values(training_participant_seq.nextval, 1000072, 10014);
insert into training_participants values(training_participant_seq.nextval, 1000073, 10014);
insert into training_participants values(training_participant_seq.nextval, 1000074, 10014);

insert into training_participants values(training_participant_seq.nextval, 1000075, 10015);
insert into training_participants values(training_participant_seq.nextval, 1000076, 10015);
insert into training_participants values(training_participant_seq.nextval, 1000000, 10015);
insert into training_participants values(training_participant_seq.nextval, 1000001, 10015);
insert into training_participants values(training_participant_seq.nextval, 1000002, 10015);

insert into training_participants values(training_participant_seq.nextval, 1000003, 10016);
insert into training_participants values(training_participant_seq.nextval, 1000004, 10016);
insert into training_participants values(training_participant_seq.nextval, 1000005, 10016);
insert into training_participants values(training_participant_seq.nextval, 1000006, 10016);
insert into training_participants values(training_participant_seq.nextval, 1000007, 10016);

insert into training_participants values(training_participant_seq.nextval, 1000008, 10017);
insert into training_participants values(training_participant_seq.nextval, 1000009, 10017);
insert into training_participants values(training_participant_seq.nextval, 1000010, 10017);
insert into training_participants values(training_participant_seq.nextval, 1000011, 10017);
insert into training_participants values(training_participant_seq.nextval, 1000012, 10017);

insert into training_participants values(training_participant_seq.nextval, 1000013, 10018);
insert into training_participants values(training_participant_seq.nextval, 1000014, 10018);
insert into training_participants values(training_participant_seq.nextval, 1000015, 10018);
insert into training_participants values(training_participant_seq.nextval, 1000016, 10018);
insert into training_participants values(training_participant_seq.nextval, 1000017, 10018);

insert into training_participants values(training_participant_seq.nextval, 1000018, 10019);
insert into training_participants values(training_participant_seq.nextval, 1000019, 10019);
insert into training_participants values(training_participant_seq.nextval, 1000020, 10019);
insert into training_participants values(training_participant_seq.nextval, 1000021, 10019);
insert into training_participants values(training_participant_seq.nextval, 1000022, 10019);
*/
--====================================================================================================================================================================

create sequence dtt_trainer_request_id_seq
start with 10000
increment by 1;
/*
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000000, 10094, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000001, 10095, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000002, 10096, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000003, 10097, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000004, 10098, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000005, 10099, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000006, 10100, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000007, 10101, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000008, 10102, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000009, 10103, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000010, 10104, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000011, 10105, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000012, 10106, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000013, 10107, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000014, 10108, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000015, 10109, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000016, 10110, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000017, 10111, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000018, 10112, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000019, 10113, 'Topic', 'Comments', 1, 1);
insert into develop_team_trainer_request values (dtt_trainer_request_id_seq.nextval, TO_DATE('2019/01/19 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 1000020, 10114, 'Topic', 'Comments', 1, 1);
*/
--=====================================================================================================================

create sequence dtt_training_req_id_seq
start with 10000
increment by 1;
/*
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10011, 10000, 10070, 1000038, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10012, 10001, 10071, 1000039, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10013, 10002, 10072, 1000040, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10014, 10003, 10073, 1000041, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10015, 10004, 10074, 1000042, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10016, 10005, 10075, 1000043, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10017, 10006, 10076, 1000044, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10018, 10007, 10077, 1000045, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10019, 10008, 10078, 1000046, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10020, 10009, 10079, 1000038, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10021, 10010, 10080, 1000039, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');

insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10036, 10011, 10081, 1000040, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10037, 10012, 10082, 1000041, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10038, 10013, 10083, 1000042, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10039, 10014, 10084, 1000043, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10040, 10015, 10085, 1000044, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');

insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10056, 10016, 10086, 1000045, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10057, 10017, 10087, 1000046, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10058, 10018, 10088, 1000038, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10059, 10019, 10089, 1000039, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10060, 10020, 10090, 1000040, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10061, 10010, 10091, 1000039, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');

insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10075, 10011, 10092, 1000040, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10076, 10012, 10093, 1000041, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10077, 10013, 10107, 1000042, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10078, 10014, 10108, 1000043, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10079, 10015, 10109, 1000044, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10080, 10016, 10110, 1000045, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10081, 10017, 10111, 1000046, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');

insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10098, 10018, 10112, 1000038, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10099, 10019, 10113, 1000039, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10100, 10020, 10114, 1000040, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10101, 10016, 10110, 1000045, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10102, 10017, 10111, 1000046, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10103, 10018, 10112, 1000038, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10104, 10019, 10113, 1000039, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
insert into develop_team_training_request values(dtt_training_req_id_seq.nextval, 10105, 10020, 10114, 1000040, 'Trainer Approval Mail', 'Trainer Manager Approval Mail', 'Description of Status');
*/
--==============================================================================================================================================
create sequence vendor_id_seq
start with 10000
increment by 1;

insert into vendor_details values(vendor_id_seq.nextval, 'Vendor1', '5088291933', 'vendor16@yahoo.com', 'Boston', 'MA', 'USA', '01701', 'EST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor2', '5085950123', 'vendor2@yahoo.com', 'Phoenix', 'AZ', 'USA', '39010', 'MST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor3', '5084449030', 'vendor3@yahoo.com', 'New York', 'NY', 'USA', '45940', 'EST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor4', '5083902929', 'vendor4@yahoo.com', 'Memphis', 'TN', 'USA', '34910', 'EST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor5', '5083334499', 'vendor5@yahoo.com', 'Miami', 'FL', 'USA', '32929', 'EST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor6', '5080023344', 'vendor6@yahoo.com', 'Los Angeles', 'CA', 'USA', '90292', 'PST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor7', '5081112299', 'vendor7@yahoo.com', 'Boston', 'MA', 'USA', '01701', 'EST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor8', '5083456789', 'vendor8@yahoo.com', 'Orlando', 'FL', 'USA', '34920', 'EST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor9', '5082345959', 'vendor9@yahoo.com', 'Phoenix', 'AZ', 'USA', '22901', 'MST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor10', '5083900022', 'vendor10@yahoo.com', 'Dallas', 'TX', 'USA', '48939', 'CST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor11', '5083456678', 'vendor11@yahoo.com', 'Troy', 'MI', 'USA', '88393', 'EST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor12', '5089904040', 'vendor12@yahoo.com', 'New York', 'NY', 'USA', '73929', 'EST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor13', '5083456101', 'vendor13@yahoo.com', 'Pheonix', 'AZ', 'USA', '39010', 'MST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor14', '5083330033', 'vendor14@yahoo.com', 'Memphis', 'TN', 'USA', '91919', 'EST');
insert into vendor_details values(vendor_id_seq.nextval, 'Vendor15', '5084049040', 'vendor15@yahoo.com', 'Dallas', 'TX', 'USA', '47818', 'CST');

--===================================================================================================================================================
create sequence vendor_trainer_id_seq
start with 10000
increment by 1;

insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10000, 'John Smith', '5089381289', 'john_smith@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10000, 'Mary Smith', '5089381284', 'mary_smith@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10001, 'Joey Johnson', '5084581289', 'joey_johnson@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10002, 'Paul McNamara', '5089449289', 'paul_mcnamara@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10003, 'Linda Iodice', '4839393939', 'linda_iodice@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10004, 'Richard Nielsen', '2910102393', 'richard_nielsen@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10005, 'Wendy Dodge', '2901014829', 'wendy_dodge@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10005, 'Patrice Reardon', '4892891919', 'patrice_reardon@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10006, 'Mark Meeehan', '8884567828', 'mark_meehan@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10006, 'Michael Smith', '4782389101', 'michael_smith@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10006, 'Billy Thompson', '3482239012', 'billy_thompson@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10006, 'Dave Troy', '3491023939', 'dave_troy@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10006, 'Bobby Hersey', '3100003984', 'bobby_hersey@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10007, 'Richie Reed', '8467567777', 'richie_reed@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10007, 'Kathy Mahone', '8949023490', 'kathy_mahone@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10007, 'Peter Shannon', '5672109034', 'peter_shannon@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10007, 'Tom Long', '4893201919', 'tom_long@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10007, 'Gail Meehan', '3901765555', 'gail_meehan@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10008, 'CJ Garropolo', '3467567837', 'cj_garropolo@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10008, 'John Lamber', '3902902929', 'john_lamber@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10008, 'Katelyn Neil', '4567391010', 'katelyn_neil@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10008, 'Dimitri Baskoms', '3964812222', 'dimitri_baskoms@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10009, 'Shannon Cantor', '4572891010', 'shannon_cantor@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10009, 'Jessie ONeil', '3337778888', 'jessie_oneil@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10009, 'Gemma Peterson', '4445556666', 'gemma_peterson@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10010, 'Michaela Leonard', '8887776666', 'michaela_leonard@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10010, 'Matthew Kay', '1112223333', 'matthew_kay@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10011, 'Joe Shmoe', '2459087654', 'joe_shmoe@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10012, 'Lisa OBrien', '9998882211', 'lisa_obrien@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10012, 'Tina Reynolds', '3334440001', 'tina_reynolds@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10012, 'Sam Gerber', '3876540003', 'sam_gerber@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');
insert into vendor_trainer values(vendor_trainer_id_seq.nextval, 10013, 'Ryan Jenkins', '2229993331', 'ryan_jenkins@yahoo.com', 'Profile/path', 'Evaluated', 'TrainingLog');

--===========================================================================================================================================================

create sequence vendor_training_request_id_seq
start with 10000
increment by 1;

/*
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10001, 10000, 10000, 10071, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10002, 10001, 10001, 10072, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10003, 10002, 10002, 10073, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10004, 10003, 10003, 10074, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10005, 10004, 10004, 10075, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10006, 10005, 10005, 10076, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10007, 10006, 10006, 10077, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10008, 10007, 10007, 10078, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10009, 10008, 10008, 10079, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10010, 10009, 10009, 10080, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10011, 10010, 10010, 10081, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10012, 10011, 10011, 10082, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10013, 10012, 10012, 10083, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10014, 10013, 10013, 10084, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10015, 10014, 10014, 10085, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10016, 10000, 10015, 10086, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10017, 10001, 10016, 10087, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10018, 10002, 10017, 10088, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10019, 10003, 10018, 10089, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10020, 10004, 10019, 10090, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10021, 10005, 10020, 10091, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10022, 10006, 10021, 10092, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');
insert into vendor_training_request values(vendor_training_request_id_seq.nextval, 10023, 10007, 10022, 10093, getRandExec, 'POStatus', 'Confirmation Email', 'Status Description');


*/
--===============================================================================================================================================================================================

create sequence trng_management_status_id_seq
start with 100
increment by 1;

insert into training_management_status values(trng_management_status_id_seq.nextval, 10000, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10001, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10002, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10003, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10004, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10005, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10006, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10007, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10008, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10009, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10010, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10011, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10012, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10013, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10014, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10015, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10016, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10017, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10018, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10019, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10020, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10021, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10022, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10023, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10024, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10025, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10026, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10027, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10028, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10029, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10030, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10031, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10032, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10033, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10034, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10035, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10036, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10037, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10038, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10039, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10040, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10041, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10042, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10043, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10044, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10045, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10046, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10047, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10048, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10049, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10050, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10051, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10052, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10053, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10054, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10055, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10056, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10057, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10058, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10059, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10060, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10061, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10062, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10063, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10064, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10065, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10066, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10067, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10068, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10069, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10070, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10071, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10072, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10073, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10074, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10075, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10076, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10077, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10078, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10079, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10080, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10081, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10082, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10083, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10084, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10085, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10086, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10087, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10088, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10089, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10090, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10091, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10092, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10093, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10094, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10095, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10096, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10097, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10098, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10099, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10100, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10101, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10102, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10103, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10104, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10105, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10106, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10107, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10108, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10109, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10110, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10111, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10112, 100);
insert into training_management_status values(trng_management_status_id_seq.nextval, 10113, 100);


--==================================================================================================================================================================================================

create sequence spoc_master_id_seq
start with 100
increment by 1;

insert into spoc_master values(spoc_master_id_seq.nextval, 1000032, 'LAT');
insert into spoc_master values(spoc_master_id_seq.nextval, 1000033, 'MAN');
insert into spoc_master values(spoc_master_id_seq.nextval, 1000034, 'RET');
insert into spoc_master values(spoc_master_id_seq.nextval, 1000035, 'INS');
insert into spoc_master values(spoc_master_id_seq.nextval, 1000036, 'BNFS');


--====================================================================================================================================================================================================

create sequence vendor_short_list_spoc_id_seq
start with 10000
increment by 1;
/*
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10000, 10000);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10000, 10001);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10000, 10002);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10001, 10002);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10001, 10003);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10001, 10004);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10002, 10001);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10002, 10002);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10002, 10003);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10002, 10004);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10003, 10005);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10003, 10006);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10003, 10007);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10004, 10007);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10004, 10008);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10004, 10009);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10005, 10009);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10005, 10010);
insert into vendor_short_list_spoc values(vendor_short_list_spoc_id_seq.nextval, 10005, 10011);
*/




--===================================================================================================================================================================================================

create sequence vendor_short_list_pt_id_seq
start with 10000
increment by 1;

/*
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10000, 10000);
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10000, 10002);
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10001, 10003);
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10001, 10004);
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10002, 10001);
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10002, 10003);
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10003, 10005);
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10003, 10007);
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10004, 10007);
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10004, 10008);
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10005, 10010);
insert into vendor_short_list_pt values(vendor_short_list_pt_id_seq.nextval, 10005, 10011);
*/

