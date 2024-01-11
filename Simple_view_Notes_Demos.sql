
select * from order_view;

select * from products_view_avg_buy;

select * from customerOrderStats;

update simple_view_example
set first_name= 'Micheal'
where employee_id=134;


select * from employees;

	select 
		table_name,
		is_updatable
	from 
		information_schema.views
	where
		table_schema= 'classicmodels';
