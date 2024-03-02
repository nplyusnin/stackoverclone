# frozen_string_literal: true

require "rails_helper"

describe Questions::UpdateService do
  describe "#call" do
    subject(:called_service) do
      service_result = described_class.call(question.id, question_params)
      question.reload
      service_result
    end

    let!(:question) { create(:question) }

    context "when question params are valid" do
      let(:question_params) { attributes_for(:question) }

      it { expect { called_service }.to change(question.reload, :title).to(question_params[:title]) }
      it { is_expected.to be_success }
      it { expect(called_service.errors).to be_blank }
    end

    context "when question params are invalid" do
      let(:question_params) { attributes_for(:question, title: " ") }

      it { expect { called_service }.not_to change(question, :title) }
      it { is_expected.not_to be_success }
      it { expect(called_service.errors).to be_a(ActiveModel::Errors) }
      it { expect(called_service.errors).not_to be_blank }
    end
  end
end
