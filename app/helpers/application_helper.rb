# frozen_string_literal: true

module ApplicationHelper
  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end
end
