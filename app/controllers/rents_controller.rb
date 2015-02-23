require 'csv'
class RentsController < ApplicationController
  load_and_authorize_resource
  #autocomplete :customer, :code, :extra_data => [:name, :id], :display_value => :display_method
  autocomplete :customer, :name, :extra_data => [:code, :id], :display_value => :display_method

  # GET /rents
  # GET /rents.json
  def index
    #@rents = Rent.all
    
    if params[:commit] == "Diario" 
       rents_filter = Rent.order('created_at DESC').joins(:customer).where("rents.created_at BETWEEN ? AND ?", DateTime.now.strftime("%y-%m-%d 00:00:00"),
       DateTime.now.strftime("%y-%m-%d 23:59:59"))
       
       @suma = rents_filter.map(&:total).inject(:+).to_s if !rents_filter.nil?
     else
       customer = params[:rent][:customer] if !params[:rent].nil? && !params[:rent][:customer].blank?
       created_start = DateTime.parse(params[:rent][:created_at]).strftime("%y-%m-%d 00:00:00") if !params[:rent].nil? && !params[:rent][:created_at].blank?
       created_end = DateTime.parse(params[:rent][:created_at]).strftime("%y-%m-%d 23:59:59") if !params[:rent].nil? && !params[:rent][:created_at].blank?

       if params[:rent].nil?
         rents_filter = Rent.order('created_at DESC').all
         
       else
         if !customer.nil? && params[:rent][:created_at].blank?
          rents_filter = Rent.order('created_at DESC').joins(:customer).where("customers.name like ?", "%" + customer +"%")
          @suma = rents_filter.map(&:total).inject(:+).to_s if !rents_filter.nil?
        else
          if customer.nil? && !params[:rent][:created_at].blank?
            rents_filter = Rent.order('created_at DESC').joins(:customer).where("rents.created_at BETWEEN ? AND ?", created_start, created_end)
            @suma = rents_filter.map(&:total).inject(:+).to_s if !rents_filter.nil?
          else
            if !customer.nil? && !params[:rent][:created_at].blank?
              rents_filter = Rent.order('created_at DESC').joins(:customer).where("customers.name like ? AND rents.created_at BETWEEN ? AND ?", 
              "%" + customer +"%", created_start, created_end)
              @suma = rents_filter.map(&:total).inject(:+).to_s if !rents_filter.nil?              
            end
          end
        end
       end
       
       
    end
        
    @rents = Kaminari.paginate_array(rents_filter).page(params[:page])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rents }
      
      format.csv { 
        
        csv_string = CSV.generate do |csv|
                csv << ["Rentada", "Cliente", "Total"] 
                rents_filter.each do |r|            
                  csv << [r.created_at, r.customer_code_name, number_to_currency(r.total)]
                end
                csv << ["", "", number_to_currency(@suma)] 
            end
        
        send_data csv_string, 
            :type => 'text/csv; charset=iso-8859-1; header=present', 
            :disposition => "attachment; filename=rents.csv" 
        
        }
     
    end
  end

  # GET /rents/1
  # GET /rents/1.json
  def show
    @rent = Rent.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rent }
    end
  end

  # GET /rents/new
  # GET /rents/new.json
  def new
    @rent = Rent.new       
    #3.times {@rent.rent_details.build}        
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rent }
    end
  end

  # GET /rents/1/edit
  def edit
    @rent = Rent.find(params[:id])
   
  end

  # POST /rents
  # POST /rents.json
  def create
    @rent = Rent.new(params[:rent])    
    @movie_kinds = MovieKind.find(:all, :conditions => {:id => nil})
    #@rent.rent_details = @details
    respond_to do |format|
      if @rent.save
        format.html { redirect_to @rent, notice: 'Rent was successfully created.' }
        format.json { render json: @rent, status: :created, location: @rent }
      else
        format.html { render action: "new" }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def generate_rent_details

    customer = params[:customer]
    deal = params[:deal]            
    deal = Deal.find_by_id(deal)        
    count = params[:count].to_i
    total = deal.deal_details.to_a.sum(&:price)
    html=""
    puts total.to_s
    if !customer.nil? && !customer.empty?        

      html+="<div id=\"deal\">"

      for n in 0..deal.deal_details.length-1
        for i in 0..deal.deal_details[n].movies_quantity-1
          html+=generate_detail_fields(count, deal, n, total)          
          count=count+1
        end
      end

      html+="<br/><a href=\"#\" class=\"remove_deal\">quitar</a></div>"

    end

    respond_to do |format|       
  	  format.json { render json: html }        
    end
  end  

  def generate_detail_fields(count, deal, n, total)
    deliver = Time.now + deal.deal_details[n].days.days
    html="<input class=\"extralarge ui-autocomplete-input\" data-autocomplete=\"/rent_details/autocomplete_movie_name\" 
    data-id-element=\"#rent_rent_details_attributes_#{count}_movie_id\" 
    id=\"rent_rent_details_attributes_#{count}_movie_code_name\" name=\"rent[rent_details_attributes][#{count}][movie_code_name]\"
    size=\"30\" type=\"text\" autocomplete=\"off\" role=\"textbox\" aria-autocomplete=\"list\" aria-haspopup=\"true\">"
    html+="<input id=\"rent_rent_details_attributes_#{count}_movie_id\" name=\"rent[rent_details_attributes][#{count}][movie_id]\" type=\"hidden\">"
    html+= "<span class='tag'>#{deal.deal_details[n].movie_kind.name}</span>"
    html+="<input id=\"rent_rent_details_attributes_#{count}_movie_kind_id\" name=\"rent[rent_details_attributes][#{count}][movie_kind_id]\" type=\"hidden\" value=\"#{deal.deal_details[n].movie_kind.id}\">"
    html+= "<span class='tag'>#{number_to_currency(deal.deal_details[n].price).to_s}</span>"        
    html+="<input id=\"rent_rent_details_attributes_#{count}_price\" name=\"rent[rent_details_attributes][#{count}][price]\" type=\"hidden\" value=\"#{deal.deal_details[n].price}\">"
    html+= "<span class='tag'>Entregar el #{t((deliver).strftime("%A"))}  #{(deliver).strftime("%d/%m/%y")}</span>" 
    html+="<input id=\"rent_rent_details_attributes_#{count}_deliver_date\" name=\"rent[rent_details_attributes][#{count}][deliver_date]\" type=\"hidden\" value=\"#{(deliver).strftime("%y-%m-%d 00:00:00")}\">"        
    html+="<input id=\"rent_rent_details_attributes_#{count}_deal_surcharge\" name=\"rent[rent_details_attributes][#{count}][deal_surcharge]\" type=\"hidden\" value=\"#{deal.deal_details[n].surcharge}\">"        
    html+="<script>"+
      "$(\"#rent_rent_details_attributes_#{count}_movie_code_name\").bind('railsAutocomplete.select', function(event, data){
      /* Do something here */
      //alert(data.item.id);
      $.ajax({
          complete:function(request){},
          data:'movie='+ data.item.id 
          + '&movie_kind=#{deal.deal_details[n].movie_kind.name}'
          + '&control_id=rent_rent_details_attributes_#{count}_movie_code_name',
          dataType:'script',
          type:'post',
          url: 'validate_movie_kind',
      	  success: function(data) {

      	  }
        });
    });</script>"
  end

  def update
    @rent = Rent.find(params[:id])

    respond_to do |format|
      if @rent.update_attributes(params[:rent])
        format.html { redirect_to @rent, notice: 'Rent was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents/1
  # DELETE /rents/1.json
  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy

    respond_to do |format|
      format.html { redirect_to rents_url }
      format.json { head :ok }
    end
  end
    
  def validate_movie_kind
    
    @movie = Movie.find_by_id(params[:movie])  
    @movie.set_kind_of_movie
    @script =""
    if @movie.movie_kind.name != params[:movie_kind]
      @script += "alert('Favor de seleccionar una pelicula de tipo #{params[:movie_kind]}!');"
      @script += "$(\"##{params[:control_id]}\").val('');"
    end
   
    respond_to do |format|       
  	  format.json { render json: @script }        
    end
  end
  
  def validate_customer
    @split = params[:customer_id].split("-")
    @customer = Customer.find_by_code(@split[0])   
    @rents = Rent.find(:all, :joins => :rent_details, :conditions => ["customer_id = #{@customer.id} AND rent_details.delivered = 0"])

    if @rents.length > 0
      @script = "alert('El cliente #{params[:customer_id]} tiene pel&iacute;culas pendientes de entregar!');"
      @script += "$(\"#rent_customer_code_name\").val('');"
      @script += "$(\"#rent_customer_id\").val('');"
    end
   
    respond_to do |format|       
  	  format.json { render json: @script }        
    end
  end
   
   def item_to_collection(obj)
     arr = [ obj ]
     return arr
   end
   
   def movie_kinds_to_options(objs)
     
      opts = ""
      objs.map { |m| opts += "<option value='#{m.id}'>#{m.name}</option>" }
      
      return opts
    end
    
    def rent_price_to_options(objs)

        opts = ""
        objs.map { |m| opts += "<option value='#{m.id}'>#{m.price}</option>" }

        return opts
      end
   
end
