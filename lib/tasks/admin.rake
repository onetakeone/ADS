require File.expand_path('./config/environment')
namespace :adverts do
  desc 'Set ad state Verified to Published'
  task :verification => :environment do
    @ads = Ad.where(state: :verified)
    @ads.each do |a|
      a.publish
    end
  end

  desc 'Set ad state Published to Archieved'
  task :archivation => :verification do
    @ads = Ad.where(state: :published)
    @ads.each do |ad|
      ad.archieve
    end
  end
end
