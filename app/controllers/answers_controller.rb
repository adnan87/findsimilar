class AnswersController < ApplicationController
  
  def index
  @question = Question.find(params[:question_id])
#  @answer = @question.answers.new
    
    respond_to do |format|
      format.html 
      format.json { render json: @questions }
    end
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
    
    respond_to do |format|
      format.html 
      format.json { render json: @answer }
    end
  end

  def create
    @question = Question.find(params[:answer][:question_id])
    logger.debug "question is"+ params[:answer][:question_id]
    @answer = @question.answers.new(params[:answer])
    @answer.user_id = session[:user_id]
    respond_to do |format|
      if @answer.save
        format.html { redirect_to root_url, notice: 'Answer was successfully posted.' }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update_answer
  #   @question = Question.find(params[:question_id])
  #   @users = session[:user_id]
  #   @user = User.find(@users)
  #   logger.debug "user id #{@user}"
  #   @answer = @question.answers.where("id=?",params[:answer_id])

  #   respond_to do |format|
  #     @answer.first.is_accepted =  true
  #     @answer_points =  Answer.select("*").where("user_id = ?",1).order("is_accepted DESC").first.points
  #     logger.debug "points are #{@answer_points}"
  #     points= 0
  #     if @answer_points.nil?
  #       @answer.first.points = points + 25 
  #     else
  #       @answer.first.points = @answer_points + 25
  #     end
  #     @answer.first.save
  #     logger.debug "points are #{@answer_points}"
  #     PostMailer.welcome_email(@user).deliver
  #     sds
  #     format.js { render :layout => false }
  #     format.html { redirect_to :back , notice: 'Answer was successfully posted.' }
  #  end

  # end

  def update_answer 
  @question = Question.find(params[:question_id]) 
  @users = session[:user_id]
  @user = User.find(@users)
  @answer = @question.answers.where("id=?",params[:answer_id]) 
  respond_to do |format| 
   if (@answer.first.is_accepted != true) 
     @answer.first.is_accepted = true
      @answer.first.save 
      @user = User.find(@answer.first.user_id) 
      total_points = @user.points + 25 
      @user.points = total_points 
      @user.save 
      PostMailer.welcome_email(@user).deliver
    end 
      #format.js { render :layout => false } 
      format.html { redirect_to :back , notice: 'Answer was successfully posted.' } 
    end 
  end
  

end
