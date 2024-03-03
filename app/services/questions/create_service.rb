# frozen_string_literal: true

module Questions
  class CreateService
    prepend BaseService

    attr_reader :question

    param :question_params
    param :user
    param :errors, default: proc { [] }

    def call
      @question = Question.new(@question_params)
      @question.user = @user
      @errors = @question.errors unless @question.save
    end

    def success?
      @errors.empty?
    end

    def fail?
      !success?
    end
  end
end
