class DealDetailsController < ApplicationController
  # GET /deal_details
  # GET /deal_details.json
  def index
    @deal_details = DealDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deal_details }
    end
  end

  # GET /deal_details/1
  # GET /deal_details/1.json
  def show
    @deal_detail = DealDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deal_detail }
    end
  end

  # GET /deal_details/new
  # GET /deal_details/new.json
  def new
    @deal_detail = DealDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deal_detail }
    end
  end

  # GET /deal_details/1/edit
  def edit
    @deal_detail = DealDetail.find(params[:id])
  end

  # POST /deal_details
  # POST /deal_details.json
  def create
    @deal_detail = DealDetail.new(params[:deal_detail])

    respond_to do |format|
      if @deal_detail.save
        format.html { redirect_to @deal_detail, notice: 'Deal detail was successfully created.' }
        format.json { render json: @deal_detail, status: :created, location: @deal_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @deal_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deal_details/1
  # PUT /deal_details/1.json
  def update
    @deal_detail = DealDetail.find(params[:id])

    respond_to do |format|
      if @deal_detail.update_attributes(params[:deal_detail])
        format.html { redirect_to @deal_detail, notice: 'Deal detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deal_details/1
  # DELETE /deal_details/1.json
  def destroy
    @deal_detail = DealDetail.find(params[:id])
    @deal_detail.destroy

    respond_to do |format|
      format.html { redirect_to deal_details_url }
      format.json { head :no_content }
    end
  end
end
