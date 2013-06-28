# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
 set :output, "/home/teamsure/work/code/findsimilar/log/cron_log.log"
#

# every 1.day, :at => '11:59 pm' do
#   rake "db:load_user"
# end
every 1.day, :at => '04:50 pm' do
  #command "/usr/bin/some_great_command"
  #runner "MyModel.some_method"
  rake "rake db:send_email"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
