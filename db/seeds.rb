# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create users
User.find_or_create_by!(full_name: 'User 2', email: 'user2@example.com') do |user|
  user.password = 'password2'
  user.confirmed_at = Time.now
end

User.find_or_create_by!(full_name: 'User 3', email: 'user3@example.com') do |user|
  user.password = 'password3'
  user.confirmed_at = Time.now
end

User.find_or_create_by!(full_name: 'Yesuf Fenta', email: 'yesuf023@gmail.com') do |user|
  user.password = '123456'
  user.confirmed_at = Time.now
end
