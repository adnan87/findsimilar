class QuestionsController < ApplicationController
  before_filter :authenticate_user
  
  def index
    @questions = Question.find(:all)

    respond_to do |format|
      format.html 
      format.json { render json: @questions }
    end
  end
  

  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @question }
    end
  end

  def new
    @question = Question.new
    
    respond_to do |format|
      format.html 
      format.json { render json: @question }
    end
  end
  
  def create
    @question = Question.new(params[:question])
    @question.user_id = session[:user_id]
    respond_to do |format|
      if @question.save
        format.html { redirect_to root_url, notice: 'Question was successfully posted.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def authenticate_user
    
    if (!current_user)
      redirect_to "/auth/facebook"
    end
  end
end
