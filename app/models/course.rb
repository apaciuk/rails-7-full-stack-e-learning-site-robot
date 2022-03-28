# frozen_string_literal: true

class Course < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum:  5 }
  resourcify

  private

  def to_s
    title
  end
end
