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

    it "not renders new question link" do
      expect(page).to have_no_link("Ask")
    end
  end

  context "when user as signed user visit questions path" do
    let(:user) { create(:user) }
    let!(:user_questions) { create_list(:question, 2, user:) }

    before do
      sign_in user
      visit questions_path
    end

    it "renders list of questions" do
      (questions + user_questions).each do |question|
        expect(page).to have_content(question.title)
      end
    end

    it "renders new question link" do
      expect(page).to have_link(t("questions.ask_question"))
    end

    it "renders actions links only for owned questions" do
      questions.each do |question|
        within "#question_#{question.id}" do
          expect(page).to have_no_link(t("edit"))
          expect(page).to have_no_link(t("destroy"))
        end
      end

      user_questions.each do |question|
        within "#question_#{question.id}" do
          expect(page).to have_link(t("edit"))
          expect(page).to have_link(t("destroy"))
        end
      end
    end
  end
end
