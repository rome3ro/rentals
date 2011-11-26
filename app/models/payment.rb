class Payment < ActiveRecord::Base
  belongs_to :rent_detail
end
