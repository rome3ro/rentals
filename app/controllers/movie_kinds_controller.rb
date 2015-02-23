class MovieKindsController < ApplicationController
  # GET /movie_kinds
  # GET /movie_kinds.json
  def index
    @movie_kinds = MovieKind.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movie_kinds }
    end
  end

  # GET /movie_kinds/1
  # GET /movie_kinds/1.json
  def show
    @movie_kind = MovieKind.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie_kind }
    end
  end

  # GET /movie_kinds/new
  # GET /movie_kinds/new.json
  def new
    @movie_kind = MovieKind.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie_kind }
    end
  end

  # GET /movie_kinds/1/edit
  def edit
    @movie_kind = MovieKind.find(params[:id])
    
  end

  # POST /movie_kinds
  # POST /movie_kinds.json
  def create
    @movie_kind = MovieKind.new(params[:movie_kind])
    if @movie_kind.expiration_days.nil?
      @movie_kind.expiration_days = 0
    end
    respond_to do |format|
      if @movie_kind.save
        format.html { redirect_to @movie_kind, notice: 'Movie kind was successfully created.' }
        format.json { render json: @movie_kind, status: :created, location: @movie_kind }
      else
        format.html { render action: "new" }
        format.json { render json: @movie_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movie_kinds/1
  # PUT /movie_kinds/1.json
  def update
    @movie_kind = MovieKind.find(params[:id])
    if @movie_kind.expiration_days.nil?
      @movie_kind.expiration_days = 0
    end
    respond_to do |format|
      if @movie_kind.update_attributes(params[:movie_kind])
        format.html { redirect_to @movie_kind, notice: 'Movie kind was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_kinds/1
  # DELETE /movie_kinds/1.json
  def destroy
    @movie_kind = MovieKind.find(params[:id])
    @movie_kind.destroy

    respond_to do |format|
      format.html { redirect_to movie_kinds_url }
      format.json { head :ok }
    end
  end
end
