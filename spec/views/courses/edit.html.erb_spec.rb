# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'courses/edit', type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
                                title: 'MyString',
                                description: 'MyText',
                                role: nil
                              ))
  end

  it 'renders the edit course form' do
    render

    assert_select 'form[action=?][method=?]', course_path(@course), 'post' do
      assert_select 'input[name=?]', 'course[title]'

      assert_select 'textarea[name=?]', 'course[description]'

      assert_select 'input[name=?]', 'course[role_id]'
    end
  end
end
