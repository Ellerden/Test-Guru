module RulesHelper
  def rule_header(rule)
    content_tag(:h1, rule.persisted? ? t('.edit_rule') : t('.new_rule'))
  end


  #Модели про формы вообще ничего не знают.
  #Это правильнее в декораторы выносить, но т.к. мы пока стараемся придерживаться стандартного MVC стека,
  #то используй хелперы

  # def validates_

  # validates :name, uniqueness: { scope: :params }
  # validates :name, :params, :description, presence: true
  # end


  # def posts_smth_path(post)
  #   case post.content.class.to_s.downcase
  #   when "topic" : posts_topic_path(post)
  #   when "link" : posts_link_path(post)
  #   when "podcast" : posts_podcast_path(post)
  #   end
  # end

  def rule_type
    Rule::RULES.map{ |rule| [t(rule, scope: 'admin.rules.form.name'), rule] }
  end
end
