class Support < ActiveRecord::Base
    has_many :issues
    has_secure_password
    validates_presence_of :username, :email, :password

    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
  
end
