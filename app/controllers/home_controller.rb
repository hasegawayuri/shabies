class HomeController < ApplicationController
  skip_before_action :require_login, only: [:top]
  def top
  end
  def message
    @groups=Group.joins(:members).where(members: { user_id: current_user.id })

    group_ids = []
    @groups.each do |group|
      group_ids.push(group.id)
    end
     @members = Member.where(group_id: group_ids).select(:user_id).distinct(:user_id)
  end
end