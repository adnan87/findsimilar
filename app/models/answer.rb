class Answer < ActiveRecord::Base

  attr_accessible :comment, :email, :name, :price, :url, :user_id, :question_id, :image, :vote_id
  belongs_to :question
  belongs_to :user
  has_many :votes
  mount_uploader :image, AnswerUploader
  before_save :add_url_protocol
  validates_uniqueness_of :question_id, :scope => :user_id

  def add_url_protocol
   unless self.url[/^http:\/\//] || self.url[/^https:\/\//]
    self.url = 'http://' + self.url
   end
 end
  
end
