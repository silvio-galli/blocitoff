module TasksHelper
  def time_left(task)
    time = (task.expected_end_date.end_of_day - Time.now)
    distance_of_time_in_words(time)
  end

  def completion_time(task)
    time = (task.actual_end_date - task.created_at)
    distance_of_time_in_words(time)
  end

  def deletion_time(task)
    time = (task.deletion_date - task.created_at)
    distance_of_time_in_words(time)
  end

  def expiring_tasks_count(tasks, seconds)
    total = []
    tasks.each do |task|
      limit = (Time.now.end_of_day.to_i + seconds)
      if task.expected_end_date.to_i < limit || task.expected_end_date.end_of_day.to_i == limit
        total << task
      end
    end
    return total.count
  end
  
end
