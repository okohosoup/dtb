with orders as (
        select * from {{ ref("stg_orders")}}
    ),

    payments as (
        select * from {{ ref("stg_payments")}}
    ),

    final as (
        select  orders.order_id,
                customer_id,
                amount,
                order_date,
                payments.status as payment_status,
                orders.status as order_status
        from orders
        join payments 
            on orders.order_id = payments.order_id
    )

select * from final