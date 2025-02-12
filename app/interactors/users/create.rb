# frozen_string_literal: true

class Users::Create < ActiveInteraction::Base
  string :name
  string :surname
  string :patronymic
  string :fullname
  string :email
  string :nationality
  string :country
  string :gender
  string :skills, default: ''

  integer :age

  array :interests, default: []

  set_callback :execute, :after, :create_skills, :create_interests

  validates :name, :patronymic, :email, :age, :nationality, :country, :gender, presence: true, allow_blank: true
  validates :age, length: { minimum: User::MIN_AGE, maximum: User::MAX_AGE, allow_blank: true, message: 'Please enter age from 1 to 90' }
  validates :gender, inclusion: { in: %w[male female], allow_blank: true, message: 'Please enter your gender as male or female' }
  validate  :validate_email_uniqueness

  attr_reader :user

  private

  def execute
    create_user
  end

  def create_user
    @user = User.create!(create_params)

    errors.merge(@user.errors) if @user.invalid?
  end

  def create_params
    inputs.except(:interests, :skills).merge(fullname: user_full_name)
  end

  def user_full_name
    "#{surname} #{name} #{patronymic}"
  end

  def create_interests
    return if interests.blank?

    Interest.where(name: interests).each do |interest|
      @user.interests << interest
    end
  end

  def create_skills
    return if skills.blank?

    arr_skills = skills.gsub(/\s+/, '').split(',')

    Skill.where(name: arr_skills).each do |skill|
      @user.skills << skill
    end
  end

  def validate_email_uniqueness
    errors.add(:email, 'A user with that email already exists') if User.exists?(email:)
  end
end
