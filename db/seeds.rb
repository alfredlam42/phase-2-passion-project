require 'faker'

User.delete_all
Rsvp.delete_all
Route.delete_all

users = 20.times.map do
  User.create!( :user_name => Faker::Name.first_name,
                :email      => Faker::Internet.email,
                :hashed_password   => 'password',
                :city => Faker::Address.city,
                :state => Faker::Address.state_abbr )
end

routes = 20.times.map do
  Route.create!(  :start_location_address => Faker::Address.street_address,
                  :start_location_city => Faker::Address.city,
                  :start_location_state => Faker::Address.state_abbr,
                  :distance => Faker::Number.between(1, 26),
                  :title => Faker::Team.creature,
                  :pace => Faker::Number.between(4, 12),
                  :date => Faker::Date.forward(30),
                  :start_time => "08:00",
                  :creator_id => Faker::Number.between(1,20) )
end

rsvps = 50.times.map do
  Rsvp.create!(   :participant_id => Faker::Number.between(1,21),
                  :route_id => Faker::Number.between(1, 20) )
end
