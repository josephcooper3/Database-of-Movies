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

end
