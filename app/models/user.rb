# frozen_string_literal: true

class User < ApplicationRecord
  rolify # :after_add => :after_add_user
  devise :masqueradable, :database_authenticatable, :confirmable, :registerable, :trackable, :recoverable,
         :rememberable, :validatable, :omniauthable
  # Validations, Names, Avatars
  validates :email, presence: true
  validates :email, uniqueness: true
  has_one_attached :avatar
  has_person_name
  # Roles
  after_create :assign_default_role
  # Notifications & Services
  has_many :notifications, as: :recipient
  has_many :services

  private

  def assign_default_role
    if roles.blank?
      add_role(:registered)
      #  User.find_or_create_by(UsersRoles.user_id).update(Role.resource_type = 'default')
    end
  end

  # def resource_type
  # ['registered', 'author'].each do |role|
  #   Role.find_or_create_by({name: role})
  # end
  # def after_add_user(role)
  # role
  # end
end
