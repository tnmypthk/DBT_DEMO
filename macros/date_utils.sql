{% macro get_season(x)%}

case
 when MONTH(TO_TIMESTAMP({{x}})) in (12,1,2)
 then 'WINTER'
 when MONTH(TO_TIMESTAMP({{x}})) in (3,4,5)
 then 'SPRING'
 when MONTH(TO_TIMESTAMP({{x}})) in (6,7,8)
 then 'SUMMER'
 else 'AUTUMN'
 end

{% endmacro %}

{% macro day_type(x)%}

when dayname(TO_TIMESTAMP({{x}})) in ('Sat', 'Sun')
then 'Weekend'
else 'Business Day'
end 

{% endmacro %}