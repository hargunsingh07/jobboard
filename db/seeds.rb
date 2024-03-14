# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require 'faker'

# Create Companies
10.times do
  Company.create(
    name: Faker::Company.name,
    industry: Faker::Company.industry
  )
end

# Create Job Listings
50.times do
  JobListing.create(
    title: Faker::Job.title,
    description: Faker::Lorem.paragraph,
    company_id: Company.pluck(:id).sample
  )
end

# Create Applicants
100.times do
  Applicant.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

# Apply Applicants to Job Listings
JobListing.all.each do |job_listing|
  job_listing.applicants << Applicant.order('RANDOM()').limit(rand(1..5))
end
