class RentPrice < ActiveRecord::Base
  belongs_to :movie_kind
  belongs_to :weekday
  
  def to_collection
     arr = [ self ]
     return arr
   end
   
end
