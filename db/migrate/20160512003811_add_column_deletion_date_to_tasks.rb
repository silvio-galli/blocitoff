class AddColumnDeletionDateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :deletion_date, :datetime
  end
end
