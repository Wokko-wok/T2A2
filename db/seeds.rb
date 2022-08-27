# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
me = User.create(
    name: 'Nic Jensen',
    email: 'NicolasJensen9@gmail.com',
    password_hash: 'Password01!'
  )
  
  Pet.create(
    [
      {
        species: 'dog',
        age: 5,
        price: 100_00,
        user: me
      },
      {
        species: 'cat',
        age: 3,
        price: 200_00,
        user: me
      },
      {
        species: 'dog',
        age: 3,
        price: 50_00,
        user: me
      }
    ]
  )