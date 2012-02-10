class Reference < ActiveRecord::Base
  belongs_to :customer
  validates_presence_of :name, :address, :phone
end
