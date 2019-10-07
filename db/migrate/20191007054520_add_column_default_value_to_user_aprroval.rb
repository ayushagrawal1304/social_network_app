class AddColumnDefaultValueToUserAprroval < ActiveRecord::Migration[5.2]
  def change
    change_column_default :user_approvals, :approved, false 
  end
end
