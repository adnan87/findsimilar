class WelcomeController < ApplicationController
  #GET index 
  def index
    @questions = Question.find(:all)
    @question = Question.find(params[:name]).question if params[:question_id]
    logger.debug "question is #{@question}"
    respond_to do |format|
      format.html 
      format.json { render json: @questions }
    end
  
  end
  
  def view
    @question = Question.find(params[:id])
    @answer = @question.answers.new
    @answers = Answer.where("question_id = ?", @question.id).order("created_at DESC")
    @vote = @answer.votes.new
    respond_to do |format|
      format.html
      format.json { render json: @question }
    end
  end

  def profile
    @questions = Question.where("user_id=?",current_user.id)
    @answers = Answer.where("user_id=?",current_user.id)
    @user = current_user.id
    @accepted_answers = Answer.where("user_id=? and is_accepted=?",current_user.id,true)

     respond_to do |format|
      format.html
      format.json { render json: @question }
    end
  end
  
  def post_question
    @question = Question.find(params[:id])
    @question_name = @question.question

    respond_to do |format|
        format.js { render :layout => false }
      end
  end

end
