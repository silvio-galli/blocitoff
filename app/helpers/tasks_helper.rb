module TasksHelper
  def time_left(task)
    time = (task.expected_end_date.to_time.end_of_day - Time.now)
    distance_of_time_in_words(time)
  end

  def completion_time(task)
    time = (task.actual_end_date.to_time - task.created_at)
    distance_of_time_in_words(time)
  end

  def deletion_time(task)
    time = (task.updated_at - task.created_at)
    distance_of_time_in_words(time)
  end
end
