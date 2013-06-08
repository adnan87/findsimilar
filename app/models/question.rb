class Question < ActiveRecord::Base
  attr_accessible :description, :image, :price, :question, :url, :user_id
  mount_uploader :image, QuestionUploader
end
