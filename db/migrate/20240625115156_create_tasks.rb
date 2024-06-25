# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :name, limit: 100, null: false
      t.integer :status, default: 0, null: false, index: true

      t.timestamps
    end
  end
end
