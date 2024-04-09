SELECT department_id, get_empleados_count(department_id) as n_empleados FROM EMPLOYEES E
GROUP BY department_id
ORDER BY n_empleados DESC;
