class Question < ActiveRecord::Base
  attr_accessible :description, :image, :price, :question, :url, :user_id
end
