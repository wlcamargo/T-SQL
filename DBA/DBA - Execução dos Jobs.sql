--EXECUCAO DOS JOBS

select DISTINCT job_name, run_duration
from
(
  select job_name, run_datetime,
    SUBSTRING(run_duration, 1, 2) + ':' + SUBSTRING(run_duration, 3, 2) + ':' +
    SUBSTRING(run_duration, 5, 2) AS run_duration
  from
  (
    select DISTINCT
      j.name as job_name, 
      run_datetime = CONVERT(DATETIME, RTRIM(run_date)) +  
        (run_time * 9 + run_time % 10000 * 6 + run_time % 100 * 10) / 216e4,
      run_duration = RIGHT('000000' + CONVERT(varchar(6), run_duration), 6)
    from msdb..sysjobhistory h
    inner join msdb..sysjobs j
    on h.job_id = j.job_id
  ) t
) t
--order by job_name, run_datetime

-----------------------------------------------------------------------------------------------------
Segunda versão com a data de execução

--EXECUCAO DOS JOBS

select job_name, run_duration,run_date, message
from
(
  select job_name, run_datetime,run_date, message,
    SUBSTRING(run_duration, 1, 2) + ':' + SUBSTRING(run_duration, 3, 2) + ':' +
    SUBSTRING(run_duration, 5, 2) AS run_duration
  from
  (
    select
      j.name as job_name, run_date, message,
      run_datetime = CONVERT(DATETIME, RTRIM(run_date)) +  
        (run_time * 9 + run_time % 10000 * 6 + run_time % 100 * 10) / 216e4,
      run_duration = RIGHT('000000' + CONVERT(varchar(6), run_duration), 6)
    from msdb..sysjobhistory h
    inner join msdb..sysjobs j
    on h.job_id = j.job_id
  ) t
where job_name = 'ATUALIZAR_ORQUESTRADOR_DIARIO'
) t
