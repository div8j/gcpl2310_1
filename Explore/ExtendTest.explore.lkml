include: "/views/OrderItems_extended.view.lkml"
include: "/views/OrderItems_extended_extended.view.lkml"

explore: theExtendTest {
  view_name: theExtendTest
  from: OrderItems_extended
  always_join: [OrderItems_extended_extended]
  join: OrderItems_extended_extended {
    type: inner
    relationship: one_to_one
    sql_on: ${theExtendTest.id} = ${OrderItems_extended_extended.id} and ${OrderItems_extended_extended.id}<>0 ;;
  }
}
