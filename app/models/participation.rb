# frozen_string_literal: true

class Participation < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def current_question_counter
    test.questions.size - questions_left
  end

  def success?
    total_result >= 85
  end

  def total_result
    ((correct_questions.to_f / test.questions.size) * 100)
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    # т.к. по какой-то причине в answer_ids первый элемент всегда ""
    answer_ids.shift
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  # тут подсчитать сколько вопросов осталось их вычесть
  def questions_left
    (test.questions.order(:id).where('id > ?', current_question.id)).size
  end
end
