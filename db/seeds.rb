# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin = AdminUser.create(
#     name: "Admin",
#     last_name: "0",
#     profile_picture: "",
#     user_type: "administrador",
#     email: "admin0@dccoursera.cl",
#     password: "adminzer0",
#     password_confirmation: "adminzer0"
# )

admin = AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?