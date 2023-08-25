view: pagination_orders{
  derived_table: {
    sql: select id,created_at, status from demo_db.orders
      LIMIT {{number_per_page._parameter_value}}
      OFFSET {{ number_per_page._parameter_value | times: page._parameter_value | minus: number_per_page._parameter_value }}
      ;;
  }
  parameter: page {
    type: number
    default_value: "1"
  }

  parameter: number_per_page {
    type: number
    default_value: "50"
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    drill_fields: [detail*]
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status_html {
    type: string
    drill_fields: [detail*]
    sql: ${TABLE}.status ;;
    html:
    {% if value == 'complete' %}
    <p style="color: black; background-color: lightgreen; border: solid 2px lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == 'pending' %}
    <p style="color: black; background-color: yellow; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; background-color: red; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %}
    ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      created_date
    ]
  }

}
