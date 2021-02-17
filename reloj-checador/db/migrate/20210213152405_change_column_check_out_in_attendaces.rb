class ChangeColumnCheckOutInAttendaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendaces, :check_in
  end
end
