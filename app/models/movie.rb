class Movie < ActiveRecord::Base      
  attr_accessor :movie_kind, :rent_price
  belongs_to :movie_format
  after_create :generate_code
  before_create :uppercase_name
  #validates_uniqueness_of :code
  #validates_presence_of :movie_format, :message => "Falta el formato de pelicula!"
      
  def uppercase_name
    self.name.upcase! if self.name
  end
  
  def generate_code
    #self.code = "MOV"+Time.now.to_i.to_s
    self.code = self.id.to_s.rjust(6, '0')    
    self.save(:validate => false)
  end
  
  def rented
    @rents = RentDetail.find(:all, :conditions => ["movie_id = #{self.id} AND delivered = 0"])
    if !@rents.nil? && @rents.length > 0
      #puts "true"
      return true
    else
      #puts "false"
      return false
    end
  end
  
  def display_method                   
      "#{self.code}-#{self.name}"      
  end

  def set_kind_of_movie
    @kinds = MovieKind.find(:all, :order => "expiration_days DESC")            
         
    @kinds.each do |k|      
      
      #puts "1" + k.name      

      if (DateTime.now - self.movie_date_type).to_i < k.expiration_days
        self.movie_kind = k        
        break
      end                        
      
      if self.movie_kind.nil? && k.expiration_days == 0
        self.movie_kind = k      
      end
      
    end        
        
    if self.movie_kind.nil? && @kinds.length == 1 && @kinds[0].expiration_days == 0
       self.movie_kind = @kinds[0]
    end
         
   end
  
  def set_price_and_kind_of_movie
    
     set_kind_of_movie()
      
      if !self.movie_kind.nil?
        @prices = RentPrice.find(:all, :joins => :weekday, :conditions => ["movie_kind_id = #{self.movie_kind.id} OR weekdays.daynumber = #{Time.new.wday}"])
        
      end
      
      if !@prices.nil? && @prices.length > 0
        
        self.rent_price = @prices.detect { |p| p.weekday.daynumber == Time.new.wday  }      
        #puts "0" + self.rent_price.to_s
        if self.rent_price.nil?
          self.rent_price = @prices.detect { |p| p.weekday.daynumber == nil }
          #puts "1" + self.rent_price.id.to_s
        end        
      end
          
      if self.rent_price.nil?
        @prices = RentPrice.find(:all)        
        self.rent_price = @prices.detect { |p| p.movie_kind.nil? && p.weekday.daynumber == Time.new.wday  }   
        if self.rent_price.nil?
          self.rent_price = @prices.detect { |p| p.movie_kind.nil? }
          #puts "1" + self.rent_price.id.to_s
        end
      end        
  end
  
  
  
end

