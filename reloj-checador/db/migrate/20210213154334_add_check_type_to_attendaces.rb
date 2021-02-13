class AddCheckTypeToAttendaces < ActiveRecord::Migration[6.1]
  def change
    add_column :attendaces, :check_type, :string, limit: 4
  end
end
