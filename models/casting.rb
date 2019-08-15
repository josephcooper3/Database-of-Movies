require_relative('../db/sql_runner')

class Casting

  def initialize(options)
    @fee = options['fee']
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id']
    @star_id = options['star_id']
  end

  def save()
    sql = "INSERT INTO castings (fee, movie_id, star_id)
    VALUES ($1, $2, $3)
    RETURNING id
    "
    values = [@fee, @movie_id, @star_id]
    @id = SqlRunner.run(sql, values).first["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE from castings"
    SqlRunner.run(sql)
  end

end
