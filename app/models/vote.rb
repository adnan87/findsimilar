class Vote < ActiveRecord::Base

  attr_accessible :answer_id, :user_id, :vote_type
  belongs_to :answer
  belongs_to :user
  validates :user_id, :presence => true
  validates :answer_id, :presence => true
  validates_uniqueness_of :user_id, :scope => :answer_id
  
end
