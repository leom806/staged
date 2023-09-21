# frozen_string_literal: true

module HeroiconHelper
  include Heroicon::Engine.helpers

  def icon(name, text = "", args = {})
    content_tag :span, class: "inline-flex items-center" do
      [
        heroicon(name, options: args),
        text.present? ? content_tag(:span, text, class: "ml-2") : nil
      ].join.html_safe
    end
  end
end
