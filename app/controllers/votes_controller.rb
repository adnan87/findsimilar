class VotesController < ApplicationController
  
  def index
    @answer = Answer.find(params[:answer_id])
    if @answer.vote.present?
      render :action => 'edit'
    end
  end
  
  def new
    @answer = Answer.find(params[:answer_id])
    @vote = @answer.votes.new
  end
  
  def create 
    @answer = Answer.find(params[:answer_id]) 
    @vote = @answer.votes.new(params[:vote]) 
    @vote.is_vote = params[:is_vote] 
    @vote.user_id = session[:user_id] 
    @user = User.find(@answer.user_id) 
    total_points = @user.points + 1 
    @user.points = total_points 
    @user.save 
    respond_to do |format| 
      if @vote.save 
        format.html{ redirect_to root_url, notice: 'Vote was successfully posted.' } 
        format.json { render json: @vote, status: :created, location: @vote} 
      else format.html { render action: "new" } 
        format.json { render json: @vote.errors, status: :unprocessable_entity } 
      end 
    end 
  end
  
end



