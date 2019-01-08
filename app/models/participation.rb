# frozen_string_literal: true

class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  validates :user, :test, presence: true

  before_validation :before_validation_set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.current_question = next_question
    save!
  end

  def current_question_counter
    test.questions.order(:id).where('id <= ?', current_question.id).size
  end

  def success?
    total_result >= 85
  end

  def total_result
    ((correct_questions.to_f / test.questions.size) * 100).round(2)
  end

  def progress
    (100 * current_question_counter) / test.questions.size
  end

  def time_left?
    (Time.current.to_i - created_at.to_i) < test.time_to_pass if test.time_to_pass.present?
  end

  def check_reward

    # тут проверяем условия - может ли юзер получить бейдж
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    # есль пользователь не выбрал ни один чекбокс - ответ признается как неверный
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
