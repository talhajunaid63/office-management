# frozen_string_literal: true

module ApplicationHelper
  def sidebar_active_class(path)
    return unless current_page?(path)

    'bg-gray-100 dark:bg-gray-700'
  end
end
