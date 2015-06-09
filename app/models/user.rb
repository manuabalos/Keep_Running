class User < ActiveRecord::Base
    has_and_belongs_to_many :routes
    
	def self.sign_in_from_omniauth(auth)
        find_by(provider: auth['provider'], uid:auth['uid']) || create_user_from_omniauth(auth)
    end

    def self.create_user_from_omniauth(auth)
        create(
            provider: auth['provider'],
            uid: auth['uid'],
            name: auth['info']['name']
            )
    end
end
