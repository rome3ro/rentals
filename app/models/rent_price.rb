class RentPrice < ActiveRecord::Base
  belongs_to :movie_kind
  belongs_to :weekday
end
