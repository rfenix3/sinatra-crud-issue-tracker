class Issue < ActiveRecord::Base
    belongs_to :support
    validates_presence_of :status, :title


end
