class RentDetailsController < ApplicationController
  autocomplete :movie, :name, :extra_data => [:code, :checked], :display_value => :display_method
  # GET /rent_details
  # GET /rent_details.json
   
  def get_autocomplete_items(parameters)
      items = super(parameters)     
      puts items.inspect
      items = items.find_all{|item| item.rented == false && item.checked == false}
  end
    
  def index
    @rent_details = RentDetail.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rent_details }
    end
  end

  # GET /rent_details/1
  # GET /rent_details/1.json
  def show
    @rent_detail = RentDetail.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rent_detail }
    end
  end

  # GET /rent_details/new
  # GET /rent_details/new.json
  def new
    @rent_detail = RentDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rent_detail }
    end
  end

  # GET /rent_details/1/edit
  def edit
    @rent_detail = RentDetail.find(params[:id])
    @rent_detail.set_surcharges
  end

  # POST /rent_details
  # POST /rent_details.json
  def create
    @rent_detail = RentDetail.new(params[:rent_detail])

    respond_to do |format|
      if @rent_detail.save
        format.html { redirect_to @rent_detail, notice: 'Rent detail was successfully created.' }
        format.json { render json: @rent_detail, status: :created, location: @rent_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @rent_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rent_details/1
  # PUT /rent_details/1.json
  def update
    @rent_detail = RentDetail.find(params[:id])

    respond_to do |format|
      if @rent_detail.update_attributes(params[:rent_detail])
        format.html { redirect_to @rent_detail, notice: 'Rent detail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @rent_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rent_details/1
  # DELETE /rent_details/1.json
  def destroy
    @rent_detail = RentDetail.find(params[:id])
    @rent_detail.destroy

    respond_to do |format|
      format.html { redirect_to rent_details_url }
      format.json { head :ok }
    end
  end
end
