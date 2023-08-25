view: user_derivedTable {
  derived_table: {
    datagroup_trigger: user_pdt_datagroup
    create_process: {
      sql_step: CREATE TABLE ${SQL_TABLE_NAME} (
                         user_id int(11),
                         lifetime_orders int(11)
                       ) ;;
      sql_step: INSERT INTO ${SQL_TABLE_NAME}(user_id, lifetime_orders)
                        SELECT user_id, COUNT(*) AS lifetime_orders
                         FROM demo_db.orders
                         GROUP BY user_id ;;
    }
  }

  dimension: id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  measure: total_order {
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }


}
