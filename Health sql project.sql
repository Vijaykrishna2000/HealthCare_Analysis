-- 	HEALTHCARE_DATA_ANALYSIS


create database healthcare;
use healthcare;
describe healthcare_dataset;
select * from healthcare_dataset;
rename table healthcare_dataset to health;
alter table health add column Patient_Id int primary key auto_increment first; 
select * from health;

-- calculating no of patients by gender
select gender,count(*) as 'Total_Patients' from health group by gender;

-- calculating no of patients by gender
select Blood,count(*) as 'Total_Patients' from health group by Blood;

-- calculating no of patients by Disease
select distinct Disease,count(*) as 'Total_Patients' from health group by disease;

-- Finding top 10 persons who is having max bill amount
select Name, floor(Amount) as 'Amount' from health order by amount desc limit 10;

-- Getting patients details with particular blood and disease
select distinct Name, Blood, Disease from health where blood= 'B-'and Disease ='Diabetes';

-- Getting no of patients with respoect to results
select Results, count(*) as ' Total_Patients' from  health group by Results;

-- calculating top patients who stayed in hospital for long days
select Name,Discharge-Admission as 'Days' from health order by Days desc limit 5;

-- Finding persons who are in critical situation
Select Name, Admission_Type ,Results from health where Admission_Type='Emergency' and Results ='Abnormal';

-- finding patients who have cancer admitted in Emergency
select name ,disease ,Admission_Type from health where disease='Cancer' and Admission_Type='Emergency';

-- finding aged persons above 80
select name ,age from health where age >80 order by age desc;

-- Calculating total amount spend on each disease
select disease ,concat(format(round(sum(Amount)/1000000,2),2),"M") as 'Total_Amount' from health group by disease;

