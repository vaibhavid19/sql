USE SchoolSchedulingExample;
show tables;
# STORED PROCEDURES

select *
from categories;

select *
from staff;

#DESCRIBE STAFF;
 

DELIMITER //
CREATE PROCEDURE get_staff_details
(IN name CHAR(20))
BEGIN
  SELECT StfFirstName, StfPhoneNumber 
  FROM Staff
  WHERE StfFirstName = name;
END //
DELIMITER ;

CALL get_staff_details('Jim');

