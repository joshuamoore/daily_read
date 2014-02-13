module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert-success"
    when :error then "alert-danger"
    when :alert then "alert-warning"
    else "alert-info"
    end
  end

  def is_edit_action?
    action_name == "edit"
  end

  module BootstrapExtension
    FORM_CONTROL_CLASS = "form-control"

    def text_field(name, value = nil, options = {})
      class_name = options[:class]
      if class_name.nil?
        options[:class] = FORM_CONTROL_CLASS
      else
        options[:class] << " #{FORM_CONTROL_CLASS}" if
        " #{class_name} ".index(" #{FORM_CONTROL_CLASS} ").nil?
      end

      super
    end

    alias_method :email_field, :text_field
    alias_method :password_field, :text_field
  end

  include BootstrapExtension
end
