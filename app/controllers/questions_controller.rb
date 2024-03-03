# frozen_string_literal: true

class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @questions = Question.order(created_at: :desc).all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
    redirect_to questions_path unless @question.user == current_user
  end

  def create
    service = Questions::CreateService.new(question_params, current_user).call
    @question = service.question

    if service.success?
      redirect_to questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    service = Questions::UpdateService.new(params[:id], question_params, current_user).call
    @question = service.question

    if service.success? || service.unauthorized?
      redirect_to questions_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy if @question.user == current_user
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
