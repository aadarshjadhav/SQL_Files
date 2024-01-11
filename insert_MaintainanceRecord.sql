CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_MaintainanceRecord`(
	in p_flatno varchar(255),
    in p_maintenance_amount int,
    in p_amount_paid int,
    in p_payment_date date
)
BEGIN

declare t_balance int;

set t_balance= p_maintenance_amount-p_amount_paid;

insert into Maintenance(Flatno, maintenance_amount, amount_paid, Paymentdate, balance) values(p_flatno,p_maintenance_amount,p_amount_paid,p_payment_date, t_balance);


END