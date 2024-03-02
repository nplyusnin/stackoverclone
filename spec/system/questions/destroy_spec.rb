# frozen_string_literal: true

require "system_helper"

describe "questions#destroy" do
  context "when user as question owner click to destroy button on question" do
    let!(:user) { create(:user) }
    let!(:questions) { create_list(:question, 2, user:) }
    let!(:question_to_be_deleted) { create(:question, user:) }

    before do
      sign_in user
      visit questions_path

      within "#question_#{question_to_be_deleted.id}" do
        accept_alert do
          click_on "Destroy"
        end
      end
    end

    it "destroys only question to be delete and not renders it on page" do
      expect(page).to have_no_content(question_to_be_deleted.title)

      questions.each do |question|
        expect(page).to have_content(question.title)
      end
    end
  end
end
