# frozen_string_literal: true

module Questions
  class UpdateService
    UNAUTHORIZED_ERROR = "User is not owner the question"

    prepend BaseService

    attr_reader :question

    param :question_id
    param :question_params
    param :user
    param :errors, default: proc { [] }

    def call
      @question = Question.find(@question_id)
      return @errors = [UNAUTHORIZED_ERROR] unless @question.user == user

      @errors = @question.errors unless @question.update(@question_params)
    end

    def success?
      @errors.empty?
    end

    def fail?
      !success?
    end

    def unauthorized?
      @errors == [UNAUTHORIZED_ERROR]
    end
  end
end
