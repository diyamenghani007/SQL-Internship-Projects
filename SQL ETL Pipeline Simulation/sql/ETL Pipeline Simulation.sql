create database project2;
use project2;

create table staging_courses (
    CourseID int,
    Title varchar(255),
    Category varchar(100),
    Sub_Category varchar(100),
    Language varchar(50),
    Skills text,
    Instructor varchar(100),
    Rating varchar(20),
    Enrollments int,
    Duration varchar(50),
    Platform varchar(50),
    PriceUSD varchar(20),
    Certification varchar(10),
    Level varchar(50),
    ReleaseYear int
);

create table courses (
    CourseID int primary key,
    Title varchar(255),
    Category varchar(100),
    Sub_Category varchar(100),
    Language varchar(50),
    Skills text,
    Instructor varchar(100),
    Rating decimal(2,1),
    Enrollments int,
    Duration int,
    Platform varchar(50),
    PriceUSD decimal(10,2),
    Certification boolean,
    Level varchar(50),
    ReleaseYear int,
    Created_At timestamp default current_timestamp
);


-- Inserting cleaned and validated data from staging_courses into production courses table
insert into courses (
    CourseID, Title, Category, Sub_Category, Language, Skills, Instructor, Rating, Enrollments, Duration, Platform, 
    PriceUSD, Certification, Level, ReleaseYear)
select
    CourseID,
    trim(Title),
    trim(Category),
    trim(Sub_Category),
    trim(Language),
    trim(Skills),
    trim(Instructor),
	cast(replace(Rating, ' stars', '') as decimal(2,1)), -- Removing ' stars' suffix and casting rating to decimal
    Enrollments,
    cast(substring_index(Duration, ' ', 1) as unsigned), -- Extracting numeric part of duration(e.g. '10 hours' to 10)
    trim(Platform),
    cast(replace(PriceUSD, '$', '') as decimal(10,2)), -- Removing dollar sign and cast price to numeric
    case 
        when lower(Certification) = 'yes' then true -- Converting 'yes'/'no' string to boolean values
        else false
    end,
	trim(Level),
    ReleaseYear
from staging_courses
where Title is not null and trim(Title) != ''
    and Instructor is not null and trim(Instructor) != ''
    and CourseID not in (select CourseID from courses);
    

-- Audit table to log every insert into the courses table    
create table audit_log (                   
    AuditID int auto_increment primary key,
    CourseID int,
    Title varchar(255),
    Instructor varchar(100),
    Action varchar(50),
    Timestamp timestamp default current_timestamp
);

-- Triggers

delimiter $$
create trigger after_insert
after insert on courses
for each row
begin
    insert into audit_log (CourseID, Title, Instructor, Action)
    values (new.CourseID, new.Title, new.Instructor, 'insert');
end$$
delilmeter ;

delimiter $$
create trigger after_update
after update on courses
for each row
begin
    insert into audit_log (CourseID, Title, Instructor, Action)
    values (new.CourseID, new.Title, new.Instructor, 'update');
end$$
delimiter ;


-- Testing Triggers

insert into courses (    					-- Simulating inserting a course
    CourseID, Title, Category, Sub_Category, Language, Skills, Instructor, Rating, Enrollments, Duration, Platform, 
    PriceUSD, Certification, Level, ReleaseYear)
values (
    1001, 'SQL Mastery', 'Programming', 'SQL', 'English', 'SQL, Joins, Indexes',
    'Alex Jordan', 4.9, 25000, 18, 'Coursera', 0.00, FALSE, 'Intermediate', 2023);

update courses set Rating = 4.4	   -- Simulating updating a rating and reflecting in audit_log
where CourseID = 101;
select * from audit_log where Action = 'update';      

select * from audit_log;

-- Analytical Queries for Insights
select Title, Enrollments 				-- query 1
from courses order by Enrollments desc limit 5;

select Category, round(avg(Rating), 2) as AvgRating       -- query 2
from courses group by Category order by AvgRating desc;

select 									-- query 3
  case when PriceUSD > 0 then 'Paid' else 'Free' end as PriceType,   
  count(*) as CourseCount from courses group by PriceType;

select Instructor, round(avg(Rating), 2) as AvgRating, count(*) AS TotalCourses  -- query 4
from courses group by Instructor having COUNT(*) >= 2
order by AvgRating desc limit 5;

select Platform, count(*) as HighQualityCourses, round(avg(Rating), 2) as AvgRating, sum(Enrollments) as TotalEnrollments      -- query 5
from courses where Rating >= 4.0 and Enrollments >= 5000
group by Platform order by HighQualityCourses desc, TotalEnrollments desc;


-- Exporting courses
select * from courses;

-- Exporting audit_log
select * from audit_log;


