with source as ( 
    select * from {{ source ('instacart_raw', 'order_products_prior') }}
), 

renamed as (
    select 
        order_id,
        product_id,
        add_to_cart_order as cart_position,

    case 
        when reordered = 1 then true 
        else false 
    end as is_reordered 

    from source

)

select * from renamed