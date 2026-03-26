WITH CTE as (
select 


TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
DATE(TO_TIMESTAMP(STARTED_AT)) as DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(STARTED_AT)) as HOUR_STARTED_AT,
case 

when dayname(TO_TIMESTAMP(STARTED_AT)) in ('Sat', 'Sun')
then 'Weekend'
else 'Business Day'
end as DAY_TYPE,

case
 when MONTH(TO_TIMESTAMP(STARTED_AT)) in (12,1,2)
 then 'WINTER'
 when MONTH(TO_TIMESTAMP(STARTED_AT)) in (3,4,5)
 then 'SPRING'
 when MONTH(TO_TIMESTAMP(STARTED_AT)) in (6,7,8)
 then 'SUMMER'
 else 'AUTUMN'
 end as STATION_OF_YEAR


from {{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'
)

select * from CTE