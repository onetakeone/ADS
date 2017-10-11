# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
user = User.create(id: 1, username: 'admin', role: 'admin', email: 'admin@admin', password: 'passpass', password_confirmation: 'passpass')
user = User.create(id: 2, username: 'user', role: 'user', email: 'user@user', password: 'passpass', password_confirmation: 'passpass')
user = User.create(id: 3, username: 'guest', role: 'guest', email: 'guest@guest', password: 'passpass', password_confirmation: 'passpass')
user = User.create(id: 4, username: 'roman', role: 'user', email: 'user1@user1', password: 'passpass', password_confirmation: 'passpass')

Type.delete_all
Type.create(id: 1, ad_type: 'WTS')
Type.create(id: 2, ad_type: 'WTB')
Type.create(id: 3, ad_type: 'Platforms')

Ad.delete_all
Ad.create(user_id: 2, type_id: 1, state: 'draft', title: 'BTC', body: '10 BTC per 3500 USDT')
Ad.create(user_id: 4, type_id: 2, state: 'new', title: 'ETH', body: '100 ETH per 250 USDT')
Ad.create(user_id: 2, type_id: 3, state: 'verified', title: 'LTC', body: '10 LTC per 35 USDT')
Ad.create(user_id: 4, type_id: 1, state: 'published', title: 'BTC', body: '101 BTC per 3600 USDT', image: Rails.root.join("app/assets/images/111.png").open)
Ad.create(user_id: 2, type_id: 2, state: 'archieved', title: 'DASH', body: '50 DASH per 3400 USDT')
Ad.create(user_id: 4, type_id: 3, state: 'denied', title: 'BTC', body: '10 BTC per 3550 USDT')
Ad.create(user_id: 2, type_id: 1, state: 'deleted', title: 'BTC', body: '100 BTC per 3560 USDT')
Ad.create(user_id: 4, type_id: 2, state: 'draft', title: 'ETH', body: '5 ETH per 270 USDT')
Ad.create(user_id: 2, type_id: 3, state: 'verified', title: 'LTC', body: '10 BTC per 3570 USDT')
Ad.create(user_id: 4, type_id: 1, state: 'published', title: 'BTC', body: '5 BTC per 3530 USDT', image: Rails.root.join("app/assets/images/222.png").open)
Ad.create(user_id: 2, type_id: 2, state: 'published', title: 'BTC', body: '9 BTC per 3520 USDT', image: Rails.root.join("app/assets/images/333.png").open)
Ad.create(user_id: 4, type_id: 3, state: 'published', title: 'BTC', body: '2 BTC per 3550 USDT', image: Rails.root.join("app/assets/images/444.png").open)
Ad.create(user_id: 2, type_id: 1, state: 'published', title: 'BTC', body: '11 BTC per 3510 USDT', image: Rails.root.join("app/assets/images/555.png").open)
Ad.create(user_id: 4, type_id: 2, state: 'published', title: 'BTC', body: '55 BTC per 3400 USDT', image: Rails.root.join("app/assets/images/666.png").open)



