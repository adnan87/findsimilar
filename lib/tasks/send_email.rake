namespace :db do

  desc "Send Mail to Owner of the question if no response to question in 3 days"
  task :send_email => :environment do
    begin
      messages = []
      status = "success"
      @question = Question.all
      @question.each do |question|
        date = DateTime.now.end_of_day #+ 3.days
        @users = question.user_id
        @user = User.find(@users) if @users.presence
        @sent_at = question.created_at
        date_diff = (date.to_date - @sent_at.to_date).to_i
        #puts "user is #{@user.name}"
        if !question.answers.present? && date_diff > 3
          puts "answers not present"
          puts question.id
          puts "Date is #{date > @sent_at}"
          puts "Added Date is #{date_diff}"
          puts "user is #{@user.name}"
          puts "Actual date is #{question.created_at}" 
          PostMailer.reply_to_owner(@user,@sent_at).deliver if @user.presence
        #puts "-----------------------------------------------------------------"
        # else
        #   puts "answers present"
        #   puts question.id
        #   puts "Date is #{date}"
        #   puts "user is #{@user.name}"
        #   puts "content is #{question.question}" 
        end
      end

      (status== "success") && (messages << "Successfully send mail")
    rescue
      status = "error" #error
      messages << " Cannot send mail"
    end
    puts messages
  end
end