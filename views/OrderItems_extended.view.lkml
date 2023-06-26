include: "/views/order_items.view.lkml"
view: OrderItems_extended {
  extends: [order_items]

  measure:  total_sale_price{
    type: sum
    sql: ${TABLE}.sale_price ;;
  }

}
