class ChangeTasksDateFieldsColumnType < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.change :expected_end_date, :datetime
      t.change :actual_end_date, :datetime
    end
  end
end
