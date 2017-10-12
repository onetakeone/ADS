# Use this file to easily define all of your cron jobs.

every 1.day, :at => '00:0 am' do
  rake 'adverts#verification'
end

every 3.day, :at => '23:50 am' do
  rake 'adverts#archivation'
end
