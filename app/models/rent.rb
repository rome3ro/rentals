include ActionView::Helpers::NumberHelper
class Rent < ActiveRecord::Base
  acts_as_xlsx :columns => [:created_at, :customer_code_name, :total]
  belongs_to :user
  has_many :rent_details, :dependent => :destroy
  belongs_to :customer
  belongs_to :deal
  accepts_nested_attributes_for :rent_details, allow_destroy: true
  
  validates_presence_of :customer
  validates_presence_of :rent_details
  
  
  
end
