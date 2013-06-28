class Like < ActiveRecord::Base
  attr_accessible :answer_id, :is_like, :user_id
  belongs_to :user
  belongs_to :answer
  validates_uniqueness_of :user_id,:scope=>:answer_id
end
