class ActorsController < ApplicationController

  def index
    @actor_table = Actor.all
    render({ :template => "/actor_templates/index.html.erb"})
  end
  
  def show
    @actor_table = Actor.all
    @actor_id = params.fetch("path_id")
    @the_actor = @actor_table.where({ :id => @actor_id }).at(0)
    @actor_chars = Character.where({ :actor_id => @actor_id })
    @movie_table = Movie.all
    render({ :template => "/actor_templates/show.html.erb" })
  end
end
