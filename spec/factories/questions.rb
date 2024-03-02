# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    sequence(:title) { |i| "Question #{i}" }
    sequence(:content) { |i| "Content of question #{i}" }

    user
  end
end
