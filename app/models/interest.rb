# frozen_string_literal: true

class Interest < ApplicationRecord
  has_many :users_interests
  has_many :users, through: :users_interests
end
