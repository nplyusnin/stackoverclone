# frozen_string_literal: true

require "rails_helper"

describe Questions::UpdateService do
  describe "#call" do
    subject(:called_service) { call_service(question.id, question_params, user) }

    let!(:question) { create(:question, user:) }
    let!(:user) { create(:user) }

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

    context "when question user are not authorized" do
      subject(:called_service) { call_service(question.id, question_params, unauthorize_user) }

      let(:question_params) { attributes_for(:question) }
      let!(:unauthorize_user) { create(:user) }

      it { expect { called_service }.not_to change(question, :title) }
      it { is_expected.not_to be_success }
      it { expect(called_service.errors).to be_a(Array) }
      it { expect(called_service.errors).to eq([described_class::UNAUTHORIZED_ERROR]) }
      it { expect(called_service.errors).not_to be_blank }
    end

    def call_service(question_id, question_params, user)
      service_result = described_class.call(question_id, question_params, user)
      question.reload
      service_result
    end
  end
end
