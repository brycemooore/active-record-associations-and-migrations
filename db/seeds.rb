Customer.destroy_all
Review.destroy_all
Restaurant.destroy_all

chipotle =Restaurant.find_or_create_by(name: "Chipotle")
wendys = Restaurant.find_or_create_by(name: "Wendy's")
bk = Restaurant.find_or_create_by(name: "Burger King")

gw = Customer.find_or_create_by(given_name: "George", family_name: "Washington")
ah = Customer.find_or_create_by(given_name: "Alexander", family_name: "Hamilton")
tj = Customer.find_or_create_by(given_name: "Thomas", family_name: "Jefferson")

gw.add_review(chipotle, 5)
gw.add_review(wendys, 4)
gw.add_review(bk, 1)

tj.add_review(chipotle, 1)
tj.add_review(bk, 4)

ah.add_review(wendys, 3)
