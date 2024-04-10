select department_name,  get_subordinados_departamento(department_id)
from departments
order by department_name;
