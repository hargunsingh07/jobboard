class CreateJobListings < ActiveRecord::Migration[7.1]
  def change
    create_table :job_listings do |t|
      t.string :title
      t.text :description
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
