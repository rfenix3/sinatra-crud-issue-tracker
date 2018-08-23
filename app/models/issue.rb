class Issue < ActiveRecord::Base
    belongs_to :support
    #belongs_to :owner, :required => false
    validates_presence_of :status, :title

    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods

end
