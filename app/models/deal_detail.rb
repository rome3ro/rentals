class DealDetail < ActiveRecord::Base
  belongs_to :deal
  belongs_to :movie_kind
  
end
