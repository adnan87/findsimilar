class PostMailer < ActionMailer::Base
  default :from => "adnan.khan@9dots.co.in"
 
  def welcome_email(user,url)
    @user = user
    @url =  url
    #end
    mail(:to => user.email, :subject => "Thanks for your Answer")
  end

  def response_email(user,answered_by,response,url)
  	@user = user
    @user_name = answered_by
    @user_response = response
    @url = url
  	mail(:to => user.email, :subject => "User #{answered_by} responded to your question ")
  end

  def reply_to_owner(user,date)
    @user = user
    @sent_at = date
    mail(:to => user.email, :subject => "There has been no responce to your question in the last 3 Days ")
  end
end
