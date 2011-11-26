class RentDetail < ActiveRecord::Base
  attr_accessor :pay
  belongs_to :rent
  belongs_to :movie
  belongs_to :movie_kind
  belongs_to :rent_price
  belongs_to :user
  validates_presence_of :movie
  before_update :set_date_delivered, :set_pending_surcharge
  after_update :create_payment
  
  def set_date_delivered
    if self.delivered_changed? && self.delivered == true
      self.delivered_date = DateTime.now      
    end
  end
  
  def set_pending_surcharge
    if !self.pay.nil? && self.pay.to_d > 0
      self.pending_surcharge = self.pending_surcharge - self.pay.to_d
    end
  end
  
  def create_payment
    #if self.delivered_changed? && self.delivered == true  
    if self.delivered == true && !self.surcharge.nil? && self.surcharge > 0      
      pay = Payment.new(:rent_detail => self, :payment => self.pay, :user_id => self.user)
      pay.save
    end
  end
  
  def set_surcharges
  
    if self.delivered
      fecha_hasta = self.delivered_date.to_datetime
      fecha_desde = self.deliver_date.to_datetime+1.day
    else
      fecha_hasta = DateTime.now
      fecha_desde = self.deliver_date.to_datetime+1.day
    end
    
    difdays = (fecha_hasta - fecha_desde).to_i
    if difdays > 0
      self.surcharge_days = difdays
      self.surcharge = difdays*self.rent_price.surcharge
      self.pending_surcharge = self.surcharge if !self.delivered
    end
    #puts (DateTime.now - self.deliver_date.to_datetime).to_i
  end
  
  
  
end
