# frozen_string_literal: true

class User < ApplicationRecord
  MIN_AGE = 1
  MAX_AGE = 90

  has_many :users_interests
  has_many :interests, through: :users_interests

  has_many :users_skills
  has_many :skills, through: :users_skills
end
