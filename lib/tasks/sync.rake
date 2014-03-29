namespace :sync do
  task :reading_lists => :environment do
    User.find_each(&:update_reading_list)
  end
end
