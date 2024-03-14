class JobListing < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :company
  has_and_belongs_to_many :applicants
end
