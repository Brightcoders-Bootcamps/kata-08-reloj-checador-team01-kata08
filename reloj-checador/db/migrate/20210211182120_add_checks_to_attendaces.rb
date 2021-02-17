class AddChecksToAttendaces < ActiveRecord::Migration[6.1]
  def change
    add_column :attendaces, :check_in, :integer
    add_column :attendaces, :check_out, :integer
  end
end
