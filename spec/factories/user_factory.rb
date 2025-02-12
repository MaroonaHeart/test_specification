# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    patronymic { Faker::Name.last_name }
    fullname { Faker::Name.last_name }
    email { Faker::Internet.email }
    nationality { Faker::Nation.nationality }
    country { Faker::Address.country }
    gender { 'male' }
    age { Faker::Number.within(range: 1..90) }
  end
end
