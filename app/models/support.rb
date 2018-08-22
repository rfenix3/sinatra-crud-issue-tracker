class Support < ActiveRecord::Base
    has_many :issues
    has_secure_password
    validates_presence_of :username, :email, :password

end
