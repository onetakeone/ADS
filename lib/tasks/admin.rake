require File.expand_path('./config/environment')
namespace :adverts do
  desc 'Set ad state Verified to Published'
  task verification: :environment do
    @ads = Ad.where(state: :verified)
    @ads.each(&:publish)
  end

  desc 'Set ad state Published to Archieved'
  task archivation: :verification do
    @ads = Ad.where(state: :published)
    @ads.each(&:archieve)
  end
end
