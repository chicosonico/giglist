class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.string :gig_name
      t.date :gig_date
      t.decimal :gig_cache
      t.string :gig_type

      t.timestamps
    end
  end
end
