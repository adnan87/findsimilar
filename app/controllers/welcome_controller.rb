class WelcomeController < ApplicationController
  #GET index 
  def index
    #@questions = Question.find(:all,:order => "created_at DESC")
    @questions = Question
                  .select("*")
                  .order("created_at DESC")
                  .paginate(:page => params[:page],:per_page=>10)
    @page = @questions.current_page 
    logger.debug "next page is #{@page}"

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
    #@answers = Answer.where("question_id = ?", @question.id).order("created_at DESC")
    @answers = Answer
      .select("answers.*,questions.user_id as user_id")
      .joins(:question).where("question_id = ?", @question.id)
      .order("answers.created_at DESC")
      .paginate(:page => params[:page],:per_page=>10)
      
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
    @question_image = @question.image.thumb

    respond_to do |format|
        format.js { render :layout => false }
      end
  end

  def follow_user
    @question = Question.find(params[:question_id])
    @follower = current_user
    @followable = User.find(@question.user_id)
    @follower.follow(@followable)
    respond_to do |format|
      format.js { render :layout => false  }
    end
  end

  def follow_question
    @questions = Question.find(:all)
    @question = Question.find(params[:question_id])
    @follower = current_user
    @follower.follow(@question)
    respond_to do |format|
      format.js { render :layout => false  }
    end
  end

end
