# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { "test_task" }
    status { Task.statuses.keys.sample }
  end
end
