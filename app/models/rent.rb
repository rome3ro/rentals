include ActionView::Helpers::NumberHelper
class Rent < ActiveRecord::Base
  
  has_many :rent_details
  belongs_to :customer
  accepts_nested_attributes_for :rent_details, allow_destroy: true
  
  
  
end
