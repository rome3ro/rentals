class Customer < ActiveRecord::Base
  has_many   :comprobantes,  :dependent => :destroy
  belongs_to :gender
  belongs_to :city
  after_create :generate_code
  has_many :references, :dependent => :destroy
  
  accepts_nested_attributes_for :references, allow_destroy: true
  accepts_nested_attributes_for :comprobantes, allow_destroy: true
    
  def generate_code
    #self.code = "CUS"+Time.now.to_i.to_s
    self.code = self.id.to_s.rjust(6, '0')
    self.save(:validate => false)
  end
  
  def display_method
      "#{self.code}-#{self.name}"
  end

 validates_uniqueness_of :code
 validates_presence_of :name, :address, :phone, :cellphone, :city, :birthday, :gender, :document_number, :references
end
