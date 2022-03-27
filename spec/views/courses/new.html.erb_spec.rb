# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'courses/new', type: :view do
  before(:each) do
    assign(:course, Course.new(
                      title: 'MyString',
                      description: 'MyText',
                      role: nil
                    ))
  end

  it 'renders new course form' do
    render

    assert_select 'form[action=?][method=?]', courses_path, 'post' do
      assert_select 'input[name=?]', 'course[title]'

      assert_select 'textarea[name=?]', 'course[description]'

      assert_select 'input[name=?]', 'course[role_id]'
    end
  end
end
