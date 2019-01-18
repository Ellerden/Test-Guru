# frozen_string_literal: true

class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  include ActionView::Helpers::TextHelper
end
