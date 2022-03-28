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


  # has_many :courses, through: :roles, source: :resource, source_type: :Post
  # has_many :creator_posts, -> { where(roles: {name: :creator}) }, through: :roles, source: :resource, source_type: :Post
  # has_many :editor_posts, -> { where(roles: {name: :editor}) }, through: :roles, source: :resource, source_type: :Post

  # validate :must_have_a_role, on: :update

  private

  def must_have_a_role
    unless roles.any?
      errors.add(:roles, 'must have at least 1 role')
    end
  end

  def assign_default_role
    self.add_role(:registered) if self.roles.blank?
      #  User.find_or_create_by(UsersRoles.user_id).update(Role.resource_type = 'default')
    end
end

