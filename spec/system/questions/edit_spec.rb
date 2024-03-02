# frozen_string_literal: true

require "system_helper"

describe "questions#edit" do
  let!(:question) { create(:question) }
  let(:user) { question.user }

  context "when user as question owner visit question edit path" do
    before do
      sign_in user
      visit edit_question_path(question)
    end

    context "when user update question with valid params" do
      before do
        fill_in "Title", with: "New question title"
        click_on "Update"
      end

      it "redirects to questions path and renders new question title on page" do
        expect(page).to have_current_path(questions_path)
        expect(page).to have_content("New question title")
      end
    end

    context "when user update question with invalid params" do
      before do
        fill_in "Title", with: " "
        click_on "Update"
      end

      it "renders validation error" do
        expect(page).to have_content("can't be blank")
      end
    end
  end
end
