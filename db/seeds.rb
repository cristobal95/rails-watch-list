# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
  title = Faker::Movie.title
  overview = Faker::Movie.quote
  poster_url = Faker::Internet.url
  rating = (6..10).to_a.sample

  movie = Movie.new(title: title, overview: overview, poster_url: poster_url, rating: rating)

  unless movie.valid?
    puts "Validation error: #{movie.errors.full_messages.join(', ')}"
    next
  end

  movie.save!
end
