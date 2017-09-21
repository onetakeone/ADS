# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new
user.id = 1
user.username = 'admin'
user.role = 'admin'
user.email = 'admin@admin'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.save!

user = User.new
user.id = 2
user.username = 'user'
user.role = 'user'
user.email = 'user@user'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.save!

user = User.new
user.id = 3
user.username = 'guest'
user.role = 'guest'
user.email = 'guest@guest'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.save!

user = User.new
user.id = 4
user.username = 'roman'
user.role = 'user'
user.email = 'roman@roman'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.save!

# Type.create(ad_type: 'WTS')
# Type.create(ad_type: 'WTB')
# Type.create(ad_type: 'Platforms')

# Ad.create(id: 1, user_id: 2, type_id: 1, state: 'draft', title: 'BTC', body: '10 BTC per 3500 USDT')
# Ad.create(id: 2, user_id: 4, type_id: 2, state: 'new', title: 'ETH', body: '100 ETH per 250 USDT')
# Ad.create(id: 3, user_id: 2, type_id: 3, state: 'verified', title: 'LTC', body: '10 LTC per 35 USDT')
# Ad.create(id: 4, user_id: 4, type_id: 1, state: 'published', title: 'BTC', body: '101 BTC per 3600 USDT')
# Ad.create(id: 5, user_id: 2, type_id: 2, state: 'archieved', title: 'DASH', body: '50 DASH per 3400 USDT')
# Ad.create(id: 6, user_id: 4, type_id: 3, state: 'denied', title: 'BTC', body: '10 BTC per 3550 USDT')
# Ad.create(id: 7, user_id: 2, type_id: 1, state: 'deleted', title: 'BTC', body: '100 BTC per 3560 USDT')
# Ad.create(id: 8, user_id: 4, type_id: 2, state: 'draft', title: 'ETH', body: '5 ETH per 270 USDT')
# Ad.create(id: 9, user_id: 2, type_id: 3, state: 'verified', title: 'LTC', body: '10 BTC per 3570 USDT')
# Ad.create(id: 10, user_id: 4, type_id: 1, state: 'published', title: 'BTC', body: '5 BTC per 3530 USDT')
# Ad.create(id: 11, user_id: 2, type_id: 2, state: 'published', title: 'BTC', body: '9 BTC per 3520 USDT')
# Ad.create(id: 12, user_id: 4, type_id: 3, state: 'published', title: 'BTC', body: '2 BTC per 3550 USDT')
# Ad.create(id: 13, user_id: 2, type_id: 1, state: 'published', title: 'BTC', body: '11 BTC per 3510 USDT')
# Ad.create(id: 14, user_id: 4, type_id: 2, state: 'published', title: 'BTC', body: '55 BTC per 3400 USDT')



