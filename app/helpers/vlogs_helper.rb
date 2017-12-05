module VlogsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_vlogs_path
    elsif action_name == 'edit'
      vlog_path
    end

  end
end
