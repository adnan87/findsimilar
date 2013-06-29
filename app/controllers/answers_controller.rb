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
    @users = @question.user_id
    @user = User.find(@users) if @users.presence
    respond_to do |format|
      if @answer.save
        @user_name = @answer.user.name if @answer.user
        @user_response = @answer.comment
        @default_url = "#{request.protocol}#{request.host_with_port}"
        @url = "#{@default_url}/view/#{@answer.question_id}"
        PostMailer.response_email(@user,@user_name,@user_response,@url).deliver if @user.presence
        format.html { redirect_to root_url, notice: 'Answer was successfully posted.' }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

# def update_answer
#     @question = Question.find(params[:question_id])
#     @answer = @question.answers.where("id=?",params[:answer_id])
#     @user_id = session[:user_id]
#     @user = User.find(@user_id) if @user_id.presence
#     respond_to do |format|
#       if (@answer.first.is_accepted != true)
#         @answer.first.is_accepted =  true
#         @answer.first.save
#         @user_p = User.find(@answer.first.user_id)
#         total_points = @user_p.points + 25
#         @user_p.points = total_points
#         @user_p.save
#       end
#       format.html { redirect_to :back , notice: 'Answer was successfully posted.' }
#    end
#   end
  def update_answer 
    @question = Question.find(params[:question_id]) 
    @answers = Answer.where("question_id = ?", @question).order("created_at DESC")
    @user_id = session[:user_id]
    @user = User.find(@user_id) if @user_id.presence
    @answer = @question.answers.where("id=?",params[:answer_id]) 
    respond_to do |format| 
      if (@answer.first.is_accepted != true) 
        @answer.first.is_accepted =  true
        @answer.first.save
        @user_p = User.find(@answer.first.user_id)
        total_points = @user_p.points + 25
        @user_p.points = total_points
        @user_p.save
        if current_user
          @url = "#{request.protocol}#{request.host_with_port}"
        end 
      end
      PostMailer.welcome_email(@user,@url).deliver if @user.presence
      format.js { render :layout => false , notice: 'Answer was successfully posted.'}
      #format.html { redirect_to :back , notice: 'Answer was successfully posted.' } 
    end  
  end 
end
