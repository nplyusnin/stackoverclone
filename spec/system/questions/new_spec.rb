# frozen_string_literal: true

require "system_helper"

describe "questions#new" do
  context "when signed user visit new question page and try create question" do
    let(:user) { create(:user) }

    before do
      sign_in user
      visit new_question_path
    end

    context "when params are valid" do
      before do
        fill_in "Title", with: "The new question"
        fill_in "Content", with: "The content on new question"
        click_on t("questions.ask_question")
      end

      it "redirects to questions path and renders new question title on page" do
        expect(page).to have_current_path(questions_path)
        expect(page).to have_content("The new question")
      end
    end

    context "when params are invalid" do
      before do
        fill_in "Title", with: " "
        fill_in "Content", with: " "
        click_on t("questions.ask_question")
      end

      it "render validation error" do
        expect(page).to have_content("не может быть пустым")
      end
    end
  end

  context "when guest visit new question page" do
    before { visit new_question_path }

    it "redirects to sign_in page" do
      expect(page).to have_current_path(new_user_session_path)
    end
  end
end
