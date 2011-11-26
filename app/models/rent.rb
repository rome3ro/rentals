include ActionView::Helpers::NumberHelper
class Rent < ActiveRecord::Base
  belongs_to :user
  has_many :rent_details, :dependent => :destroy
  belongs_to :customer
  accepts_nested_attributes_for :rent_details, allow_destroy: true
    
  validates_presence_of :customer
  validates_presence_of :rent_details
  
end
