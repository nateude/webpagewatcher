module FlashHelper
  def handle_errors(result)
    set_flash :error, multiline_flash(result.errors.full_messages)
  end

  def multiline_flash(messages)
    return nil if messages.blank?

    [*messages].join('.').gsub(/\.+(\s+)?/, '.').split('.')
               .map(&:humanize).join('.<br/>') + '.'
  end

  # Flash message methods
  def set_flash(status, message)
    flash[:status] = status
    flash[:notice] = message
  end

  def set_flash_now(status, message)
    flash[:status] = status
    flash.now[:notice] = message
  end
end
