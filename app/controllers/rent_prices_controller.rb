class RentPricesController < ApplicationController
  
  # GET /rent_prices
  # GET /rent_prices.json
  def index
    @rent_prices = RentPrice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rent_prices }
    end
  end

  # GET /rent_prices/1
  # GET /rent_prices/1.json
  def show
    @rent_price = RentPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rent_price }
    end
  end

  # GET /rent_prices/new
  # GET /rent_prices/new.json
  def new
    @rent_price = RentPrice.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rent_price }
    end
  end

  # GET /rent_prices/1/edit
  def edit
    @rent_price = RentPrice.find(params[:id])
  end

  # POST /rent_prices
  # POST /rent_prices.json
  def create
    @rent_price = RentPrice.new(params[:rent_price])

    respond_to do |format|
      if @rent_price.save
        format.html { redirect_to @rent_price, notice: 'Rent price was successfully created.' }
        format.json { render json: @rent_price, status: :created, location: @rent_price }
      else
        format.html { render action: "new" }
        format.json { render json: @rent_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rent_prices/1
  # PUT /rent_prices/1.json
  def update
    @rent_price = RentPrice.find(params[:id])

    respond_to do |format|
      if @rent_price.update_attributes(params[:rent_price])
        format.html { redirect_to @rent_price, notice: 'Rent price was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @rent_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rent_prices/1
  # DELETE /rent_prices/1.json
  def destroy
    @rent_price = RentPrice.find(params[:id])
    @rent_price.destroy

    respond_to do |format|
      format.html { redirect_to rent_prices_url }
      format.json { head :ok }
    end
  end
end
