class User < ApplicationRecord
  has_secure_password
  scope :spamers, -> {where banned: true}
  has_many :todos, dependent: :destroy
  has_many :comments, foreign_key: :author_id
  has_many :todo_comments, through: :todos, source: :comments
  has_many :commenters, through: :todo_comments, source: :author

  enum role: [:user, :admin]

  def send_code!
    code_to_send = genenerate_code
    puts "code_to_send: #{code_to_send}"
    update code: code_to_send
  end

  private
    def genenerate_code
      @g_code ||= rand.to_s[2..5]
    end
end
