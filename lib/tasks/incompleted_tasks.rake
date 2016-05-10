namespace :older_tasks do
  desc "Delete tasks when they reach their expected end date"
  task mark_as_incomplete: :environment do
    _tasks = Task.active
    _tasks.each do |t|
      if t.expected_end_date.to_time.end_of_day <= DateTime.now
        t.update(uncompleted: true)
      end
    end
  end
end
