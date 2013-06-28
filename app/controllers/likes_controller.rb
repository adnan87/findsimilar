class LikesController < ApplicationController


  def index
  end
  
  def new
    @answer = Answer.find(params[:answer_id])
    @like = @answer.likes.new
  end
  
  def create
    @answer = Answer.find(params[:answer_id])
    @answers = Answer.where("question_id = ?", @answer.question_id).order("created_at DESC")
    @like = @answer.likes.new(params[:like])
    @like.is_like = true
    @like.user_id = session[:user_id]
    respond_to do |format|
      if @like.save
      format.js { render :layout => false  }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update_like_status
    @answer = Answer.find(params[:answer_id])
    @answers = Answer.where("question_id = ?", @answer.question_id).order("created_at DESC")
    @like = Like.where("answer_id=? and user_id=?", @answer.id, current_user.id)
    respond_to do |format|
      if @like.last.is_like == false
        @like.last.is_like = true
      else
        @like.last.is_like = false
      end
      @like.last.save
      format.js { render :layout => false  }
   end
  end

end
