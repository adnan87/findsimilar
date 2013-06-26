class PostMailer < ActionMailer::Base
  default :from => "adnan.khan@9dots.co.in"
 
  def welcome_email(user,url)
    @user = user
    @url =  url
    #end
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
