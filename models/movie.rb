require_relative('../db/sql_runner')

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO movies (title, genre)
    VALUES ($1, $2)
    RETURNING id
    "
    values = [@title, @genre]
    @id = SqlRunner.run(sql, values).first["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def all_stars
    sql = "SELECT stars.* FROM stars
    INNER JOIN castings
    ON castings.star_id = stars.id
    WHERE movie_id = $1
    "
    values = [@id]
    stars_data = SqlRunner.run(sql, values)
    return stars_data.map { |star_data| Star.new(star_data)  }
  end

end
