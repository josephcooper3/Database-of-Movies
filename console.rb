require_relative('./models/movie')
require('pry')

Movie.delete_all()

movie1 = Movie.new({
  "title" => "Brassed Off",
  "genre" => "Black Comedy",
})

movie1.save()

binding.pry
nil
