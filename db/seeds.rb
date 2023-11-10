# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Sheet.create(column: 1, row: 'a')
Sheet.create(column: 2, row: 'a')
Sheet.create(column: 3, row: 'a')
Sheet.create(column: 4, row: 'a')
Sheet.create(column: 5, row: 'a')
Sheet.create(column: 1, row: 'b')
Sheet.create(column: 2, row: 'b')
Sheet.create(column: 3, row: 'b')
Sheet.create(column: 4, row: 'b')
Sheet.create(column: 5, row: 'b')
Sheet.create(column: 1, row: 'c')
Sheet.create(column: 2, row: 'c')
Sheet.create(column: 3, row: 'c')
Sheet.create(column: 4, row: 'c')
Sheet.create(column: 5, row: 'c')

Theater.create(name: '1th theater')
Theater.create(name: '2th theater')
Theater.create(name: '3th theater')

Screen.create(screen_number: 1, theater_id: 1)
Screen.create(screen_number: 2, theater_id: 1)
Screen.create(screen_number: 3, theater_id: 1)
Screen.create(screen_number: 1, theater_id: 2)
Screen.create(screen_number: 2, theater_id: 2)
Screen.create(screen_number: 3, theater_id: 2)
Screen.create(screen_number: 1, theater_id: 3)
Screen.create(screen_number: 2, theater_id: 3)
Screen.create(screen_number: 3, theater_id: 3)