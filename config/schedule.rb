# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.

every 1.day, at: '11:55pm' do
  rake 'adverts#verification'
end

every 3.day, at: '12:00pm' do
  rake 'adverts#archivation'
end
