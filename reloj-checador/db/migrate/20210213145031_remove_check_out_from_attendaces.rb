class RemoveCheckOutFromAttendaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendaces, :check_out
  end
end
