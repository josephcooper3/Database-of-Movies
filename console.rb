require_relative('./models/movie')
require_relative('./models/star')

require('pry')

Movie.delete_all()
Star.delete_all()

movie1 = Movie.new({
  "title" => "Brassed Off",
  "genre" => "Comedy-Drama"
})
movie1.save()


star1 = Star.new({
  "first_name" => "Ewan",
  "last_name" => "McGregor"
})
star1.save()

binding.pry
nil
