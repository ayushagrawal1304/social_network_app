class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :community_id
      t.integer :user_id
      t.string :description
      t.timestamps
    end
  end
end
