module ApplicationHelper
  def bootstrap_class_for_flash_message_type(type)
    case type
    when 'notice'
      'alert-success'
    when 'alert'
      'alert-danger'
    else
      'alert-primary'
    end
  end
end
