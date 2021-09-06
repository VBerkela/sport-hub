namespace :demo do
  desc "Demo rake task"
  task say_hi: :environment do
    puts "Hi!"
  end
end