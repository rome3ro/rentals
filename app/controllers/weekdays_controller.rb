class WeekdaysController < ApplicationController
  # GET /weekdays
  # GET /weekdays.json
  def index
    @weekdays = Weekday.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weekdays }
    end
  end

  # GET /weekdays/1
  # GET /weekdays/1.json
  def show
    @weekday = Weekday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weekday }
    end
  end

  # GET /weekdays/new
  # GET /weekdays/new.json
  def new
    @weekday = Weekday.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weekday }
    end
  end

  # GET /weekdays/1/edit
  def edit
    @weekday = Weekday.find(params[:id])
  end

  # POST /weekdays
  # POST /weekdays.json
  def create
    @weekday = Weekday.new(params[:weekday])

    respond_to do |format|
      if @weekday.save
        format.html { redirect_to @weekday, notice: 'Weekday was successfully created.' }
        format.json { render json: @weekday, status: :created, location: @weekday }
      else
        format.html { render action: "new" }
        format.json { render json: @weekday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weekdays/1
  # PUT /weekdays/1.json
  def update
    @weekday = Weekday.find(params[:id])

    respond_to do |format|
      if @weekday.update_attributes(params[:weekday])
        format.html { redirect_to @weekday, notice: 'Weekday was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @weekday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekdays/1
  # DELETE /weekdays/1.json
  def destroy
    @weekday = Weekday.find(params[:id])
    @weekday.destroy

    respond_to do |format|
      format.html { redirect_to weekdays_url }
      format.json { head :ok }
    end
  end
end
