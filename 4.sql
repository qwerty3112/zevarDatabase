insert into Category values (1, 'l');
insert all
    into Category values (2, '2')
    into Category values (3, '3')
    into Category values (4, '4')
    into Category values (5, '5')
select * from dual;

create or replace directory dir as 'D:\\Oracle\\lab4';
create table CategoryNew(
	id int,
	category varchar(50)
) 
organization external(
    type ORACLE_LOADER
    default directory dir
    access parameters(
        records delimited by newline
        fields terminated by ','
        missing field values are null
    )
    location ('load.txt')
); 
insert into Category select * from CategoryNew;
drop table CategoryNew;
	
update Category set category = 'new_name3' where id = 3;
update Category set category = 'category' where id <= 2;

delete from Category where id = 5;
delete from Category where id > 2;
truncate table Category;
