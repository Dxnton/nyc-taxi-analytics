with source as ( 
    select * from {{ source('instacart_raw', 'orders') }}
), 

renamed as (

    select 
        order_id,
        user_id, 

        order_number,
        order_dow as order_day_of_week, 
        order_hour_of_day, 

        case order_dow 
            when 0 then 'Saturday'
            when 1 then 'Sunday'
            when 2 then 'Monday'
            when 3 then 'Tuesday'
            when 4 then 'Wednesday'
            when 5 then 'Thursday'
            when 6 then 'Friday'
        end as order_day_name,

        coalesce(days_since_prior_order, 0) as days_since_prior_order,

        case
            when days_since_prior_order is null then true
            else false
        end as is_first_order
    
    from source
)

select * from renamed