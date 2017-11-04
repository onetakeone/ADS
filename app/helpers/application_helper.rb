# frozen_string_literal: true

#
module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, request.parameters.merge(
      sort: column,
      direction: direction,
      page: nil
    ),
            class: css_class
  end

  def statable(state)
    states = { 'new' => t('layout.states.new'),
               'denied' => t('layout.states.denied'),
               'verified' => t('layout.states.verified'),
               'deleted' => t('layout.states.deleted'),
               'published' => t('layout.states.published'),
               'archieved' => t('layout.states.archieved'),
               'draft' => t('layout.states.draft') }
    states[state]
  end

  def rolable(role)
    roles = { 'user' => t('layout.roles.user'),
              'guest' => t('layout.roles.guest'),
              'admin' => t('layout.roles.admin') }
    roles[role]
  end
end
