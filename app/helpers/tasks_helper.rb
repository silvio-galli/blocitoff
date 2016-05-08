module TasksHelper
  def time_left(task)
    time = (task.expected_end_date.to_time.end_of_day - Time.now)
    distance_of_time_in_words(time)
  end
end
