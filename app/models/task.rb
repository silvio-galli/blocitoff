class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }
  validates :expected_end_date, presence: true

  default_scope { order('expected_end_date ASC') }
end
