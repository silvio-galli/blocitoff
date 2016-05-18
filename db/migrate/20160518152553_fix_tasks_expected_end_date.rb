class FixTasksExpectedEndDate < ActiveRecord::Migration
  def change
    remove_column :tasks, :expected_end_date
    add_column :tasks, :expected_end_date, :datetime
  end
end
