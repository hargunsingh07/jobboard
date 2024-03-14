class CreateJoinTableApplicantsJobListings < ActiveRecord::Migration[7.1]
  def change
    create_join_table :applicants, :job_listings do |t|
      t.index [:applicant_id, :job_listing_id]
      t.index [:job_listing_id, :applicant_id]
    end
  end
end
