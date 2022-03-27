# frozen_string_literal: true

json.extract! course, :id, :title, :description, :role_id, :created_at, :updated_at
json.url course_url(course, format: :json)
