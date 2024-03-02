# frozen_string_literal: true

module Questions
  class UpdateService
    prepend BaseService

    attr_reader :question

    param :question_id
    param :question_params
    param :errors, default: proc { [] }

    def call
      @question = Question.find(@question_id)
      @errors = @question.errors unless @question.update(@question_params)
    end

    def success?
      @errors.empty?
    end

    def fail?
      !success?
    end
  end
end
