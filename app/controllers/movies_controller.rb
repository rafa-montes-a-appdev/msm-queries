class MoviesController < ApplicationController

  def index
    @movie_table = Movie.all
    @dir_table = Director.all
    render({ :template => "/movie_templates/index.html.erb"})
  end

  def show
    @movie_table = Movie.all
    @mov_id = params.fetch("path_id")
    @the_movie = @movie_table.where({ :id => @mov_id }).at(0)
    @dir_table = Director.all
    
    render({ :template => "/movie_templates/show.html.erb"})
  end

end
