module ApplicationHelper
  def flash_msg(opts = {})
    ignore_types = ["order_completed"].concat(Array(opts[:ignore_types]).map(&:to_s) || [])
    flash.each_with_object([]) do |(type, message), flash_messages|
      unless ignore_types.include?(type)
        type = "success" if type == "notice"
        type = "error" if type == "alert"
        text = "<script>toastr.#{type}(`#{message}`, '', { closeButton: true, progressBar: true })</script>"
        flash_messages << text.html_safe if message
      end
    end.join("\n").html_safe
  end
end
