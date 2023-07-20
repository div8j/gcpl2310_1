view: pagination_users{
  derived_table: {
    sql: select * from demo_db.users
      LIMIT {{number_per_page._parameter_value}}
      OFFSET {{ number_per_page._parameter_value | times: page._parameter_value | minus: number_per_page._parameter_value }}
      ;;
  }
  parameter: page {
    type: number
    default_value: "1"
  }

  parameter: number_per_page {
    default_value: "5000"
    type: number
  }

  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: created1 {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CONVERT_TZ(${TABLE}.created_at,'UTC') ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_html {
    type: count
    drill_fields: [detail*]
    html:
    {% if state._value == 'Michigan' %}
    <p style="color: black; background-color: lightgreen; border: solid 2px lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif state._value == 'Texas' %}
    <p style="color: black; background-color: red; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; background-color: yellow; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %}
    ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      saralooker.count,
      sindhu.count,
      user_data.count
    ]
  }

}
