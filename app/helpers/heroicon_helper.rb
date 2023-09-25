# frozen_string_literal: true

module HeroiconHelper
  include Heroicon::Engine.helpers

  def icon(name, text = "", args = {})
    return heroicon(name, options: args) if text.blank?

    content_tag :span, class: "inline-flex items-center" do
      [
        heroicon(name, options: args),
        content_tag(:span, text, class: "ml-2")
      ].join.html_safe
    end
  end
end
