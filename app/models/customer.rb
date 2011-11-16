class Customer < ActiveRecord::Base
  belongs_to :gender
  belongs_to :city
  
  def display_method
      "#{self.code}-#{self.name}"
  end

 validates_uniqueness_of :code
end
