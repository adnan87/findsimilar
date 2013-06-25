class Question < ActiveRecord::Base

  attr_accessible :description, :image, :price, :question, :url, :user_id
  belongs_to :user
  mount_uploader :image, QuestionUploader
  has_many :answers
  
end
