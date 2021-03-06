class User < ActiveRecord::Base
  has_many :tasks
  
  def self.find_or_create_from_auth_hash(auth_hash)
    user = find_or_create_by(provider: auth_hash[:provider], uid: auth_hash[:uid])
    user.name = auth_hash[:info][:name]
    user.image = auth_hash[:info][:image]
    user.save!
    user
  end
end
