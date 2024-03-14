class Applicant < ApplicationRecord
    validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_and_belongs_to_many :job_listings
end
