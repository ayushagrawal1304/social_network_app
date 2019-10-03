class CreateUserApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_approvals do |t|

      t.integer :community_id
      t.integer :user_id
      t.boolean :approved

      t.timestamps
    end
  end
end
