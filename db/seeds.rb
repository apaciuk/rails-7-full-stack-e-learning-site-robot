# frozen_string_literal: true

#
# This file should contain all the record creation needed to seed the database with its default values.
#   The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
#   Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
#   Below are roles, add/delete as required (admin is boolean flag in users)

%w[registered author].each do |role|
  Role.find_or_create_by({ name: role })
end
