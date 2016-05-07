class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :notes
      t.string :expected_end_date, null: false
      t.string :actual_end_date
      t.boolean :completed
      t.boolean :uncompleted
      t.boolean :deleted
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
