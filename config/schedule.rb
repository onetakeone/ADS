# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.

every 1.day, at: '4:41pm' do
  rake 'adverts#verification'
end

every 3.day, at: '4:42pm' do
  rake 'adverts#archivation'
end
