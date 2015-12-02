module ApplicationHelper
  # For things like 'Suitable for vegetarians'. Makes it a little more presentable.
  def human_boolean(boolean)
    boolean ? 'Yes' : 'No'
  end
end
