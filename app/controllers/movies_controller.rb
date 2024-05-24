class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    # @movies_review = Review.joins("INNER JOIN movies ON movies.id = reviews.movie_id")
    @movies_review = ActiveRecord::Base.connection.execute("SELECT movies.id, movies.name, reviews.movie_id, floor(AVG(reviews.star)) as star
    FROM movies
    INNER JOIN reviews ON movies.id = reviews.movie_id;
    GROUP by movies.id")
    # @reviews = Review.all
  end
end


# SELECT movies.id, movies.name, reviews.movie_id, reviews.star
# FROM movies
# INNER JOIN reviews ON movies.id = reviews.movie_id;