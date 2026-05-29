with source as (

    select * from {{ source('instacart_raw', 'products') }}

),

renamed as (

    select
        product_id,
        product_name,
        aisle_id,
        department_id

    from source

)

select * from renamed