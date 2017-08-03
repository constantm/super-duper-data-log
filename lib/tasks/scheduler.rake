desc "Task to clear data older than a day for limited Heroku DB"
task :delete_six_hours_and_older => :environment do
  DataPoint.where('created_at < ?', DateTime.now - 6.hours).destroy_all
end
