WITH TRIPS as (

    select 
    ride_id,
    rideable_type,
    DATE(to_timestamp(started_at)) as TRIP_DATE,
    START_STATIO_ID as START_STATION_ID,
    END_STATION_ID,
    MEMBER_CSUAL as MEMBER_CASUAL,
    TIMESTAMPDIFF(seconds, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATIONS_SECONDS

    from {{ source('demo', 'bike') }}
    where RIDE_ID != 'ride_id'
    
)

select * from TRIPS