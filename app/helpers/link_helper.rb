# frozen_string_literal: true

#
module LinkHelper
  def returnHelper(path)
    link_to t('layout.return'), path
  end

  def showHelper(obj)
    link_to t('layout.show'), obj if can? :read, obj
  end

  # Edit link helpers
  #
  def editHelper(obj)
    link_to t('layout.edit'), edit_ad_path(obj) if can? :update, obj
  end

  # Edit type link at Type.index page
  def editHelper_t(obj)
    link_to t('layout.edit'), edit_type_path(obj) if can? :update, obj
  end

  # Edit ad link at Users.ads page
  def editHelper_ua(obj)
    if obj.state == 'draft' || obj.state == 'archieved'
      link_to t('layout.edit'),
              edit_ad_path(obj)
    end
  end

  # Destroy link helpers
  #
  def destroyHelper(obj)
    if can? :destroy, obj
      link_to t('layout.destroy'), obj, method: :delete,
                                        data: { confirm: t('layout.confirm') }
    end
  end

  # Destroy user link at Users.index page
  def destroyHelper_u(obj)
    if can? :destroy, obj
      link_to t('layout.destroy'), destroy_user_path(obj), method: :delete,
                                                           data: { confirm: t('layout.confirm') }
    end
  end

  def pagination(obj)
    paginate obj, theme: 'twitter-bootstrap-3',
                  pagination_class: 'pagination  justify-content-sm-center'
  end
end
