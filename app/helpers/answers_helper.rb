# frozen_string_literal: true

module AnswersHelper
  def answer_question_text(answer)
    content_tag(:h2, t('.question', question_text: answer.question.text))
  end
end
