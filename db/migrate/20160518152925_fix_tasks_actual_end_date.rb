class FixTasksActualEndDate < ActiveRecord::Migration
  def change
    remove_column :tasks, :actual_end_date
    add_column :tasks, :actual_end_date, :datetime
  end
end
