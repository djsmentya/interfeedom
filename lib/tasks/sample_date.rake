namespace :db do
  desc "Load sample data to DataBase"
  task :samples => :environment do
    puts "Loading data ..."
    SeedFu.seed(File.join(Rails.root, "db/sample"))
    puts "Data has been loaded"
  end
end

#require 'ffaker'

#namespace :ifree do
  #desc 'Loads sample data'
  #task :samples do
    #sample_path = File.join(File.dirname(__FILE__), '..', '..', 'db', 'sample')

    #Rake::Task['db:load_dir'].reenable
    #Rake::Task['db:load_dir'].invoke(sample_path)
  #end
#end
