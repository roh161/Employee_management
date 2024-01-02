# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Check if the AdminUser table is empty
if AdminUser.count.zero?
    # Create an AdminUser only if the table is empty
    AdminUser.create!(email: 'rohit.salitra07@yopmail.com', password: 'password', password_confirmation: 'password')
    puts 'AdminUser created!'
  else
    puts 'AdminUser already exists.'
end