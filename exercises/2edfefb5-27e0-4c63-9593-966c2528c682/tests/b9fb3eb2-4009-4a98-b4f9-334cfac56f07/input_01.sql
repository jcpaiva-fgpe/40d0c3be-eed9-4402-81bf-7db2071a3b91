SELECT first_name, last_name, antiguedad(first_name, last_name)
from EMPLOYEES E
where DEPARTMENT_ID = 60
order by LAST_NAME;
