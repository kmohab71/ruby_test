class MovieLocation < ApplicationRecord
  belongs_to :movie
  belongs_to :filming_location
end
