class MoviesController < ApplicationController
  load_and_authorize_resource
  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find(params[:id])
    @movie.set_kind_of_movie
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])
    if params[:tomar_fecha_salida]
      @movie.movie_date_type = @movie.released
    else
      @movie.movie_date_type = @movie.created_at
    end
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :ok }
    end
  end
  
  def get_extra_data
        
    movie_extra = Movies.find_by_title(params[:movie_name], {
      tomatoes: "true"
    })
    
    #puts movie_extra.inspect
    
    @script = "$(\"#movie_imdb_id\").val('#{movie_extra.id}');"+
      "$(\"#movie_genres\").val('#{movie_extra.genres.to_s.tr("\"","").tr("[","").tr("]","")}');"+
      "$(\"#movie_actors\").val('#{movie_extra.actors.to_s.tr("\"","").tr("[","").tr("]","")}');"+
      "$(\"#movie_director\").val('#{movie_extra.director}');"+      
      "$(\"#movie_poster\").val('#{movie_extra.poster}');"+
      "$(\"img[alt='Poster']\").attr('src', '#{movie_extra.poster}');"
      @script += get_released_date(movie_extra)
    
    
    respond_to do |format|
       
  		 format.json { render json: @script }        
  	 end
  end
  
  def get_released_date(movie)
                
    script = "$(\"#movie_released_1i\").val(\"#{movie.released.year}\");"
    script += "$(\"#movie_released_2i\").val(\"#{movie.released.month}\");"
    script += "$(\"#movie_released_3i\").val(\"#{movie.released.day}\");"
      
  end
  
end
