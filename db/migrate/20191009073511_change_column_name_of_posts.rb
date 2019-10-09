class ChangeColumnNameOfPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :description, :content
  end
end
