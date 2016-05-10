FactoryGirl.define do
  factory :task do
    title "MyString"
    notes "MyText"
    expected_end_date "MyString"
    actual_end_date "MyString"
    completed false
    uncompleted false
    deleted false
    user nil
  end
end
