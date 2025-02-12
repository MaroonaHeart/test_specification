# frozen_string_literal: true

class UsersInterest < ApplicationRecord
  belongs_to :user
  belongs_to :interest
end
