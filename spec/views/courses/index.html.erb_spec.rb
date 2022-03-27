# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'courses/index', type: :view do
  before(:each) do
    assign(:courses, [
             Course.create!(
               title: 'Title',
               description: 'MyText',
               role: nil
             ),
             Course.create!(
               title: 'Title',
               description: 'MyText',
               role: nil
             )
           ])
  end

  it 'renders a list of courses' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
