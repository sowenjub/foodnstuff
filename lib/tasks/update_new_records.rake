namespace :cron do
  task :update_new_records => :environment do
    UpdateNewRecordsService.new.call
  end
end
