class AnnounceUser < ApplicationRecord
  belongs_to :announce
  belongs_to :user
end
