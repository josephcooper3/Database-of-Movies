require_relative('./models/casting')
require_relative('./models/movie')
require_relative('./models/star')

require('pry')

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

movie1 = Movie.new({
  "title" => "Brassed Off",
  "genre" => "Comedy-Drama"
})
movie1.save()

movie2 = Movie.new({
  "title" => "Trainspotting",
  "genre" => "Black-Comedy"
  })
movie2.save()

star1 = Star.new({
  "first_name" => "Ewan",
  "last_name" => "McGregor"
})
star1.save()

star2 = Star.new({
  "first_name" => "Tara",
  "last_name" => "Fitzgerald"
})
star2.save()

casting1 = Casting.new({
  "fee" => "100000",
  "movie_id" => movie1.id,
  "star_id" => star1.id
})
casting1.save()

casting2 = Casting.new({
  "fee" => "200000",
  "movie_id" => movie2.id,
  "star_id" => star1.id
})
casting2.save()

casting3 = Casting.new({
  "fee" => "200000",
  "movie_id" => movie1.id,
  "star_id" => star2.id
})
casting3.save()

binding.pry
nil
