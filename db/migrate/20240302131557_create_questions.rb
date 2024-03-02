# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :title,   null: false, default: ""
      t.text   :content, null: false, default: ""

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
