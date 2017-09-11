class AnnounceJob < ApplicationJob
  queue_as :default

  def perform(announce_id, user_id)
    announce = Announce.find_by id: announce_id
    user = User.find_by id: user_id
    if user && announce
      user.send_sms_announce(announce)
    end
  end
end
