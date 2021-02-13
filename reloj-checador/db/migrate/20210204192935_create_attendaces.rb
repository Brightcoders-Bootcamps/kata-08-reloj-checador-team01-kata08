class CreateAttendaces < ActiveRecord::Migration[6.1]
  def change
    create_table :attendaces do |t|
      t.string :private_number
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
