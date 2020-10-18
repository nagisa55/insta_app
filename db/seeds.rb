# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



5.times do |n|
      User.create!(
       lastname: "田中#{n + 1}",
       firstname:  "太郎#{n + 1}",
        username: "taro#{n + 1}",
        email: "test#{n + 1}@test.com",
        tel: "11111#{n + 1}",
        introduction: "よろしくお願いします。",
        password: "aaaaaa#{n + 1}",
        password_confirmation: "aaaaaa#{n + 1}"
      )
    end

5.times do |n|
      Micropost.create!(
        user_id: "#{n+1}",
        content: "可愛い動物",
        picture:File.open("./app/assets/images/kawauso.png")
      )
    end

