class Deal < ActiveRecord::Base
  has_many :deal_details, :dependent => :destroy
  belongs_to :weekday
  accepts_nested_attributes_for :deal_details, allow_destroy: true
  validates_presence_of :deal_details
end
