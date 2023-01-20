module UserroomsHelper
#チャット相手のＲｏｏｍレコードを取得する
  def open_userroom_record(member)
    @currentUserRooms = Userroom.where(user_id: current_user.id)
    @currentUserRooms.each do |userroom|
        record = Userroom.find_by(user_id: member.user_id, room_id: userroom.room_id)
        unless record.nil?
          return record
        end
    end
    return nil
  end
end
