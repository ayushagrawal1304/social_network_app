class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name

      t.timestamps
    end
    add_index :communities, :name, unique: true
    add_reference :communities, :user, null: false, foreign_key: true
  end
end
