# frozen_string_literal: true

require "rails_helper"

describe Questions::CreateService do
  describe "#call" do
    subject(:called_service) { described_class.call(user, question_params) }

    let(:user) { create(:user) }

    context "when question params are valid" do
      let(:question_params) { attributes_for(:question) }

      it { expect { called_service }.to change(Question, :count).from(0).to(1) }
      it { is_expected.to be_success }
      it { expect(called_service.errors).to be_blank }
    end

    context "when question params are invalid" do
      let(:question_params) { {} }

      it { expect { called_service }.not_to change(Question, :count) }
      it { is_expected.not_to be_success }
      it { expect(called_service.errors).to be_a(ActiveModel::Errors) }
      it { expect(called_service.errors).not_to be_blank }
    end
  end
end
