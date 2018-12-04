# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    content_tag(:h1, question.persisted? ? t('.edit_question', title: question.test.title) : t('.new_question', title: question.test.title))
  end
end
