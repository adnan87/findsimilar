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
    @answer = @question.answers.new
    @answers = Answer.where("question_id = ?", @question.id).order("created_at DESC")
    @vote = @answer.votes.new
    @url = "https://www.facebook.com/dialog/feed?
  app_id=458358780877780&
  link=http://localhost:3000/&
  picture=http://fbrell.com/f8.jpg&
  name=Find%20Similar&
  caption=Post%20Questionn&
  description=#{@question.question}&
  redirect_uri=https://mighty-lowlands-6381.herokuapp.com/"
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
  
  def url
    @question = Question.find(params[:question_id])
    logger.debug "question_id is #{@question}"
    @url = Answer.select("url,user_id,question_id").where("user_id=? and question_id=?",current_user,@question)
    @final_url = @url.first.url
    logger.debug "url is #{@url.first.url}"
    respond_to do |format|
        format.html { redirect_to @final_url and return}
      end
  end

end
