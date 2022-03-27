# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'courses/show', type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
                                title: 'Title',
                                description: 'MyText',
                                role: nil
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
