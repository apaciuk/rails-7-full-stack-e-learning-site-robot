# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    title { 'MyString' }
    description { 'MyText' }
    role { nil }
  end
end
