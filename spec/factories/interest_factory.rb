# frozen_string_literal: true

FactoryBot.define do
  factory :interest do
    name { Faker::Verb.base }
  end
end
