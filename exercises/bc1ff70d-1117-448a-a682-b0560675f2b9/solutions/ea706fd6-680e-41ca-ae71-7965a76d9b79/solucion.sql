CREATE or replace FUNCTION nuevo_historico()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
   if (new.end_date is not null) then
	insert into job_history(employee_id, start_date, end_date, job_id, department_id)
	values(new.employee_id, new.end_date, new.end_date + interval '90 days', new.job_id, new.department_id);
   end if;
  
   return new;
END;
$$;

CREATE TRIGGER insertar_nuevo_historico
after UPDATE
ON job_history
FOR EACH ROW
EXECUTE PROCEDURE nuevo_historico();