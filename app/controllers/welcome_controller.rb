class WelcomeController < ApplicationController
  #GET index 
  def index
    @questions = Question.find(:all)

    respond_to do |format|
      format.html 
      format.json { render json: @questions }
    end
  
  end
  
  def posts
    
  end
end
