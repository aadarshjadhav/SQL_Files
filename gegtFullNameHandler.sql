CREATE DEFINER=`root`@`localhost` PROCEDURE `getFullName`(inout fullNameList varchar(4000))
BEGIN
declare finished integer default 0;
declare fullName varchar (100) default "";
    
    #Cusor declaration
    
    declare curName
		cursor for
			select concat(firstname, ',', lastname) from employees limit 10;
            
            #declare nott found  handler
            declare continue handler for not found set finished=1;
            
	#Open cursor
		Open curName;
        
	#fetch records
    getName: Loop
		fetch curName into fullname;
        if finshed =1 
        then leave getName;
        end if;
        
        set fullName= concat(fullname,';', fullnamelist);
        end loop getName;
        
        close curname;
	END