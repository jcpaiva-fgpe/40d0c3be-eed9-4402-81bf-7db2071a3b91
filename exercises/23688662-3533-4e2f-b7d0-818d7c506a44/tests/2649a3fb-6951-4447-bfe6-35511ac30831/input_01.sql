select department_id, department_name,  sustituto_por_antiguedad(department_id)
from departments
where department_id < 120
order by department_name;
