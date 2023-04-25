class DirectorsController < ApplicationController

  def index
    @dir_table = Director.all
    render({ :template => "/director_templates/index.html.erb"})
  end
  
  def show
    @dir_table = Director.all
    @dir_id = params.fetch("path_id")
    @the_director = @dir_table.where({ :id => @dir_id }).at(0)
    @dir_movies = Movie.where({ :director_id => @dir_id })
    render({ :template => "/director_templates/show.html.erb"})
  end 

  def youngest
    dir_with_date = Director.where.not({:dob => nil})
    @youngest_dir = dir_with_date.order({:dob => :desc}).at(0)
    render({ :template => "/director_templates/youngest.html.erb"})
  end 

  def eldest
    dir_with_date = Director.where.not({:dob => nil})
    @eldest_dir = dir_with_date.order({:dob => :asc}).at(0)
    render({ :template => "/director_templates/eldest.html.erb"})
  end 

end
