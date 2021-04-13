# Default users and Orders
users = [["order.system@mailinator.com", "Sahu M"], ["s@mailinator.com", "Murali"], ["test@mailinator.com", "Vinayi"], ["test1@mailinator.com", "Sunil"], ["test2@mailinator.com", "Saleem"], ["test3@mailinator.com", "Yogiii"], ["test4@mailinator.com", "Anil"], ["test5@mailinator.com", "Gundu"], ["test6@mailinator.com", "Sairam"], ["test7@mailinator.com", "Harish"]]

orders = [["+448897067074", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-17", "p12344", "Prepay (Half)", 215, "Confirmed", 4],
          ["+448897067056", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-12", "p12344", "Prepay (Half)", 213, "Delivered", 2],
          ["+44889907074", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-11", "p12344", "Prepay (Half)", 213, "Confirmed", 2],
          ["+44889559074", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-11", "p12344", "Prepay (Half)", 787, "Cancelled", 3],
          ["+447339767023", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-12", "p1234677", "Prepay (Half)", 457, "Confirmed", 3],
          ["+448897067056", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-14", "p12344", "Prepay (Half)", 213, "Cancelled", 4],
          ["+448897067074", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-12", "p12344", "Prepay (Half)", 342, "Send", 5],
          ["+44889559074", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-11", "p12344", "Prepay (Half)", 787, "Cancelled", 5],
          ["+447339767023", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-10", "p1234677", "Prepay (Half)", 457, "Confirmed", 2],
          ["+448897067056", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-01", "p12344", "Prepay (Half)", 213, "Confirmed", 4],
          ["+44889907074", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-15", "p12344", "Prepay (Half)", 213, "Ready", 3],
          ["+44889559074", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-15", "p12344", "Prepay (Half)", 787, "Cancelled", 2],
          ["+447339767023", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-15", "p1234677", "Prepay (Half)", 457, "Confirmed", 6],
          ["+448897067056", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-01", "p12344", "Prepay (Half)", 213, "Confirmed", 3],
          ["+44889907074", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-01", "p12344", "Prepay (Half)", 213, "Confirmed", 2],
          ["+44889559074", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-11", "p12344", "Prepay (Half)", 787, "Cancelled", 4],
          ["+447339767023", "Survey No- 44P, 4th floor,  phase 2 building,", "2021-04-13", "p1234677", "Prepay (Half)", 457, "Confirmed", 3]]

# creating users
users.each do |u|
  User.create(email: u[0], username: u[1], password: "p@ssw0rd")
end

User.first.update(role: "Admin")

# creating orders
orders.each do |o|
  Order.create({ "phone" => o[0], "address" => o[1], "delivery_date" => o[2], "item_id" => o[3], "payment_option" => o[4], "amount" => o[5], "order_status" => o[6], "user_id" => o[7] })
end
