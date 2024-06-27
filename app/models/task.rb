# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }

  enum :status, { todo: 0, wip: 1, done: 2 }, validate: true
end
