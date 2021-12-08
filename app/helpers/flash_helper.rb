module FlashHelper
  def flash_message (type, msg)
    content_tag :div, msg, class: "flash #{type}"
  end
end
