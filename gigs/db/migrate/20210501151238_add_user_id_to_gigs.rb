class AddUserIdToGigs < ActiveRecord::Migration[6.1]
  def change
    add_column :gigs, :user_id, :integer
    add_index :gigs, :user_id
  end
end
