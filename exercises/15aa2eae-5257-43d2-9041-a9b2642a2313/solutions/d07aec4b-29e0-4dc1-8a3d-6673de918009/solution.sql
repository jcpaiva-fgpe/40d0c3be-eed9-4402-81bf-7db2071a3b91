SELECT department_id, get_empleados_count(department_id) as n_empleados from EMPLOYEES E
group by DEPARTMENT_ID
order by n_empleados desc;
