create database if not exists WalkIn;
show databases;
use WalkIn;

create table if not exists Qualification (
id int auto_increment,
Name varchar(45) not null,
primary key (id)
);
show tables;
desc Qualification;
insert into Qualification (name)
values ("Bachelor in Technology (B. Tech)"), ("Bachelor in Engineering (B.E.)"), ("Master in Engineering (M.E.)"), ("Master in Technology (M. Tech)"), ("Master in Science (B.Sc)"), ("Bachelor in Science (B.Sc)");
select * from Qualification;

create table if not exists Stream (
id int auto_increment,
Name varchar(45) not null,
primary key (id)
);
insert into stream (name)
values ("Information Technology"), ("Computer Science"), ("Electrical"), ("Electronic and Telecommunications");
select * from Stream;

create table if not exists ApplicantType (
id int auto_increment,
Type varchar(45) not null,
primary key (id)
);
insert into ApplicantType (Type)
values ("Fresher"), ("Experienced");
select * from ApplicantType;

create table if not exists EducationalQualifications (
id int auto_increment,
Percentage int not null,
YearOfPassing year not null,
CollegeLocation varchar(45) not null,
primary key (id)
);
select * from EducationalQualifications;

create table if not exists ProfessionalQualifications (
id int auto_increment,
YearOfExperience int not null, 
CurrentCTC int not null,
ExpectedCTC int not null,
NoticePeriod tinyint not null,
NoticePeriodEnd date,
NoticePeriodInMonths int,
Appeared tinyint not null,
AppliedJobRoles varchar(45),
primary key (id)
);
select * from ProfessionalQualifications;

create table if not exists College (
id int auto_increment,
Name varchar(45) not null,
primary key (id)
);
insert into College (Name)
values ("Pune Institute of Technology (PIT)"), ("Atharva College of Engineering (ACE)"), ("Other");
select * from College;

create table if not exists UserCollege (
id int auto_increment,
College_id int not null,
Other varchar(45),
primary key (id),
foreign key (College_id) references College(id)
);
select * from UserCollege;

create table if not exists JobRoles (
id int auto_increment,
Name varchar(45) not null,
Description varchar(45) not null,
Requirements varchar(45) not null,
primary key (id)
);
insert into JobRoles (Name, Description, Requirements)
values ("Instructional Designer", "Instructional Designer Description", "Instructional Designer Requirements"),
 ("Software Engineer", "Software Engineer Description", "Software Engineer Requirements"),
 ("Software Quality Engineer", "Software Quality Engineer Description", "Software Quality Engineer Requirements");
select * from JobRoles;
 
create table if not exists Technologies (
id int auto_increment,
Name varchar(45) not null,
primary key (id)
);
insert into Technologies (Name)
values ("Javascript"), ("Angular JS"), ("React"), ("Node JS"), ("Others");
select * from Technologies;

create table if not exists Location (
id int auto_increment,
Name varchar(45),
primary key (id)
);
insert into Location (Name)
values ("Mumbai"), ("Maharashtra"), ("India");
select * from Location;

create table if not exists TimeSlot (
id int auto_increment,
TimeSlot varchar(45) not null,
primary key (id)
);
insert into TimeSlot (TimeSlot)
values ("9:00 AM to 11:00 AM"), ("1:00 AM to 3:00 AM");
select * from TimeSlot;

create table if not exists WalkIn (
id int auto_increment,
Title varchar(45) not null,
StartDate date not null,
EndDate date not null,
InternshipOpportunity tinyint not null,
Location_id int not null,
GeneralInstructions varchar(45) not null,
ExamInstructions varchar(45) not null,
SystemRequirement varchar(45),
Process varchar(45),
primary key (id),
foreign key (Location_id) References Location (id)
);
select * from WalkIn;

create table if not exists WalkIn_has_JobRoles (
id int auto_increment,
WalkIn_id int not null,
JobRoles_id int not null,
Package int not null,
primary key (id),
foreign key (WalkIn_id) References WalkIn (id),
foreign key (JobRoles_id) References JobRoles (id)
);
select * from WalkIn_has_JobRoles;

create table if not exists WalkIn_has_TimeSlot (
id int auto_increment,
WalkIn_id int not null,
TimeSlot_id int not null,
primary key (id),
foreign key (WalkIn_id) References WalkIn (id),
foreign key (TimeSlot_id) References TimeSlot (id)
);
select * from WalkIn_has_TimeSlot;

create table if not exists User (
id int auto_increment,
Email varchar(45) not null unique,
Password varchar(45) not null,
FirstName varchar(45) not null,
LastName varchar(45) not null,
Number BigInt not null unique,
Photo Blob,
Resume Text,
Portfolio varchar(45),
Referral varchar(45),
MailUpdatesSubscribed tinyint not null,
Qualification_id int not null,
Stream_id int not null,
EducationalQualifications_id int not null,
ApplicantType_id int not null,
ProfessionalQualifications_id int not null,
UserCollege_id int not null,
WalkIn_has_TimeSlot_id int not null,
WalkIn_has_JobRoles_id int not null,
primary key (id),
foreign key (Qualification_id) References Qualification (id),
foreign key (Stream_id) References Stream (id),
foreign key (ApplicantType_id) References ApplicantType (id),
foreign key (EducationalQualifications_id) References EducationalQualifications (id),
foreign key (ProfessionalQualifications_id) References ProfessionalQualifications (id),
foreign key (UserCollege_id) References UserCollege (id),
foreign key (WalkIn_has_TimeSlot_id) references WalkIn_has_TimeSlot (id),
foreign key (WalkIn_has_JobRoles_id) references WalkIn_has_JobRoles (id)
);
select * from User;

create table if not exists PreferredJobRoles (
User_id int not null,
JobRoles_id int not null,
foreign key (User_id) References User (id),
foreign key (JobRoles_id) References JobRoles (id)
);
select * from PreferredJobRoles;

create table if not exists ExpertiseTechnologies (
User_id int not null,
Technologies_id int not null,
Other varchar(45) not null,
foreign key (User_id) References User (id),
foreign key (Technologies_id) References Technologies (id)
);
select * from ExpertiseTechnologies;

create table if not exists FamiliarTechnologies (
User_id int not null,
Technologies_id int not null,
Other varchar(45) not null,
foreign key (User_id) References User (id),
foreign key (Technologies_id) References Technologies (id)
);
select * from FamiliarTechnologies;