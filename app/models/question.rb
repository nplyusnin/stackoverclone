# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user

  validates :title, :content, presence: true
end
