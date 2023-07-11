view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  measure: created_date1 {
    type: min
    sql: ${TABLE}.created_at;;
  }

  measure: first_date1 {
    type: min
    sql: ${created_date};;
    convert_tz: no
  }
  measure: first_date2 {
    type: date
    sql:min(${created_date}) ;;
    convert_tz: no
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    html:
    {% if value == 'cancelled' %}
    <p style="font-size:60%;">{{ rendered_value }}</p>
    {% else %}
    <p style="font-size:100%;">{{ rendered_value }}</p>
    {% endif %}
    ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
    html:
    {% if status._value == 'cancelled' %}
    <p style="font-size:60%;">{{ rendered_value }}</p>
    {% else %}
    <p style="font-size:100%;">{{ rendered_value }}</p>
    {% endif %}
    ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
