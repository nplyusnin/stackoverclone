# frozen_string_literal: true

require "system_helper"

describe "questions#index" do
  let!(:questions) { create_list(:question, 2) }

  context "when guest visit questions path" do
    before { visit questions_path }

    it "renders list of questions" do
      questions.each do |question|
        expect(page).to have_content(question.title)
      end
    end
  end
end
