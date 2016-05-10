class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }
  validates :expected_end_date, presence: true

  after_initialize { self.completed ||= false }
  after_initialize { self.uncompleted ||= false }
  after_initialize { self.deleted ||= false }

  scope :active, -> { where(:completed => false, :deleted => false) }
  scope :completed, -> { where(completed: true) }
  scope :deleted, -> { where(deleted: true) }
  scope :uncompleted, -> { where(uncompleted: true) }
end
