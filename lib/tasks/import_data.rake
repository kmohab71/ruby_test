require 'csv'
namespace :import do
    task :data => :environment do
      import_movies("job-application-backend-test/movies.csv")
      import_reviews("job-application-backend-test/reviews.csv")
      puts "Data imported successfully!"
    end
  
    def import_movies(file_path)
      CSV.foreach(file_path, headers: true) do |row|
        # Extract movie data from the row
        movie_data = {
          name: row["Movie"],
          description: row["Description"],
          release_year: row["Year"].to_i
        }
        # Create or update movie record
        movie = Movie.find_or_create_by(name: movie_data[:name], year: movie_data[:release_year])
        # Associate cast and filming location (assuming separate methods exist)
        import_cast(movie, row["Director"], "Director")
        import_cast(movie, row["Actor"], "Actor")
        import_filming_location(movie, row["Filming Location"], row["Country"])
        # Update remaining movie attributes
        movie.update(description: movie_data[:description])
      end
    end
  
    def import_cast(movie, name, role)
      # Find or create Cast record
      cast = Cast.find_or_create_by(name: name)
      # Associate cast member with movie and role in Cast_Movies table
      CastMovie.create(movie: movie, cast: cast, role: role)
    end
  
    def import_filming_location(movie, location_name, country_code)
      # Find or create Filming Location record
      location = FilmingLocation.find_or_create_by(name: location_name, country: country_code)
      # Associate movie with filming location in Movie_Locations table
      MovieLocation.create(movie: movie, filming_location: location)
    end
  
    def import_reviews(file_path)
      CSV.foreach(file_path, headers: true) do |row|
        # Extract review data from the row
        # Assuming movie can be found by name (adapt if needed)
        movie = Movie.find_by(name: row["Movie"])
        next unless movie  # Skip if movie not found
  
        # Extract user data (assuming User model exists, create user if needed)
        user = User.find_or_create_by(username: row["User"])  # Adapt based on user identification
  
        review_data = {
          user: user,
          movie: movie,
          star: row["Stars"].to_f,
          review: row["Review"]
        }
        # Create a new review record
        Review.create(review_data)
      end
    end
  end