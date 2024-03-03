# frozen_string_literal: true

module TranslationHelper
  def t_input(*args)
    case args.count
    when 1
      attribute_name = args.first
      t("simple_form.labels.defaults.#{attribute_name}")
    when 2
      model_name, attribute_name = args
      t("simple_form.labels.#{model_name}.#{attribute_name}")
    else
      raise ArgumentError, message: "wrong number of arguments (given #{args.count}, expected 1..2)"
    end
  end
end
