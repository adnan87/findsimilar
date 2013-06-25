class PostMailer < ActionMailer::Base
  default :from => "adnan.khan@9dots.co.in"
 
  def welcome_email(user)
    @user = user
    #@url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
