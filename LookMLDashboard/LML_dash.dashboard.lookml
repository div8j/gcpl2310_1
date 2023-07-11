- dashboard: LML_dash
  title: LML_dash
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: MDuPUIwZqh7mzLuTVf1Dgf
  elements:
  - title: UDD_0607
    name: UDD_0607
    model: ecommerce_divakar
    explore: order_items
    type: looker_column
    fields: [products.department, products.count, orders.created_year]
    pivots: [orders.created_year]
    fill_fields: [orders.created_year]
    filters: {}
    sorts: [products.count desc 0, orders.created_year]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Created Year: orders.created_year
      Department: products.department
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Department
    title: Department
    type: field_filter
    default_value: "-NULL"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ecommerce_divakar
    explore: order_items
    listens_to_filters: []
    field: products.department
  - name: Created Year
    title: Created Year
    type: field_filter
    default_value: NOT NULL
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ecommerce_divakar
    explore: order_items
    listens_to_filters: []
    field: orders.created_year
