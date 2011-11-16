class RentDetail < ActiveRecord::Base
  belongs_to :rent
  belongs_to :movie
  belongs_to :movie_kind
  belongs_to :rent_price
end
