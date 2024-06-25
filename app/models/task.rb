# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }

  enum :status, %i[todo wip done], validate: true
end
