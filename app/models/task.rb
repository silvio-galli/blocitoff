class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }
  validates :expected_end_date, presence: true, if: :ends_after_now?

  after_initialize { self.completed ||= false }
  after_initialize { self.uncompleted ||= false }
  after_initialize { self.deleted ||= false }

  scope :active, -> { where(:completed => false, :deleted => false, :uncompleted => false) }
  scope :completed, -> { where(completed: true) }
  scope :deleted, -> { where(deleted: true) }
  scope :uncompleted, -> { where(uncompleted: true) }

  def ends_after_now?
    expected_end_date >= DateTime.now.end_of_day
  end
end
