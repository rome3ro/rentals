class MovieFormatsController < ApplicationController
  # GET /movie_formats
  # GET /movie_formats.json
  def index
    @movie_formats = MovieFormat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movie_formats }
    end
  end

  # GET /movie_formats/1
  # GET /movie_formats/1.json
  def show
    @movie_format = MovieFormat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie_format }
    end
  end

  # GET /movie_formats/new
  # GET /movie_formats/new.json
  def new
    @movie_format = MovieFormat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie_format }
    end
  end

  # GET /movie_formats/1/edit
  def edit
    @movie_format = MovieFormat.find(params[:id])
  end

  # POST /movie_formats
  # POST /movie_formats.json
  def create
    @movie_format = MovieFormat.new(params[:movie_format])

    respond_to do |format|
      if @movie_format.save
        format.html { redirect_to @movie_format, notice: 'Movie format was successfully created.' }
        format.json { render json: @movie_format, status: :created, location: @movie_format }
      else
        format.html { render action: "new" }
        format.json { render json: @movie_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movie_formats/1
  # PUT /movie_formats/1.json
  def update
    @movie_format = MovieFormat.find(params[:id])

    respond_to do |format|
      if @movie_format.update_attributes(params[:movie_format])
        format.html { redirect_to @movie_format, notice: 'Movie format was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_formats/1
  # DELETE /movie_formats/1.json
  def destroy
    @movie_format = MovieFormat.find(params[:id])
    @movie_format.destroy

    respond_to do |format|
      format.html { redirect_to movie_formats_url }
      format.json { head :ok }
    end
  end
end
