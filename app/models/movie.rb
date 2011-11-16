class Movie < ActiveRecord::Base      
  attr_accessor :movie_kind, :rent_price
  belongs_to :movie_format

  
  validates_uniqueness_of :code
  #validates_presence_of :movie_kind, :message => "add movie kinds!"
    
  def display_method                   
      "#{self.code}-#{self.name}"      
  end

  def set_kind_of_movie
    @kinds = MovieKind.find(:all, :order => "expiration_days")            
         
    @kinds.each do |k|      
      if (DateTime.now - self.released).to_i <= k.expiration_days
        self.movie_kind = k
        break
      end
      #puts (DateTime.now - self.released).to_i.to_s
      #puts  k.expiration_days.to_s
    end        
    
    if self.movie_kind.nil? && @kinds.length == 1 && @kinds[0].expiration_days = 0
       self.movie_kind = @kinds[0]
    end
         
   end
  
  def set_price_and_kind_of_movie
    
     @kinds = MovieKind.find(:all, :order => "expiration_days")          
     #puts @kinds.to_s
      @kinds.each do |k|
        #puts (DateTime.now - self.released).to_i.to_s
        if (DateTime.now - self.released).to_i <= k.expiration_days
          self.movie_kind = k
          break
        end
      end
      
      if self.movie_kind.nil? && @kinds.length == 1 && @kinds[0].expiration_days = 0       
         self.movie_kind = @kinds[0]
         #puts "entro"
       end
      
      #puts self.movie_kind.to_s + " <-----"
      if !self.movie_kind.nil? 
        #puts self.movie_kind.id.to_s       
        @prices = RentPrice.find(:all, :conditions => { :movie_kind_id => self.movie_kind.id })
      end
      
      #puts @prices.length.to_s
      if !@prices.nil? && @prices.length > 0
        self.rent_price = @prices.detect { |p| p.weekday.daynumber == Time.new.wday  }      
        #puts "0" + self.rent_price.to_s
        if self.rent_price.nil?
          self.rent_price = @prices.detect { |p| p.weekday.daynumber == nil }
          #puts "1" + self.rent_price.id.to_s
        end        
      end
                  
  end
  
  
  
end

