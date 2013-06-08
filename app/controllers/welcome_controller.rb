class WelcomeController < ApplicationController
  #GET index 
  def index
    @questions = Question.find(:all)

    respond_to do |format|
      format.html 
      format.json { render json: @questions }
    end
  
  end
  
  def view
     @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end
end
