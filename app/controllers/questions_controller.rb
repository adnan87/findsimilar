class QuestionsController < ApplicationController
  before_filter :authenticate_user
  
  def index
    
  end
  
  def authenticate_user
    
    if (!current_user)
     # redirect_to "/auth/facebook"
    end
  end
end
