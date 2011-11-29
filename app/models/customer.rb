class Customer < ActiveRecord::Base
  belongs_to :gender
  belongs_to :city
  before_create :generate_code
  
  def generate_code
    self.code = "CUS"+Time.now.to_i.to_s
  end
  
  def display_method
      "#{self.code}-#{self.name}"
  end

 validates_uniqueness_of :code
end
