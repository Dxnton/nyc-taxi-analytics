with source as (
    select * from {{ source('instacart_raw', 'aisles') }}
),

renamed as ( 
    SELECT 
        aisle_id,
        aisle,

    from source
)

SELECT * from renamed