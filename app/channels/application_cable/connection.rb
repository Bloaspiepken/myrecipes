module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_corsogroup
    
    def connect
     self.current_corsogroup = find_current_user
    end
    
    def disconnect
      
    end
    
    protected
    def find_current_user
      if current_corsogroup = Corsogroup.find_by(id: cookies.signed[:corsogroup_id])
        current_corsogroup
      else
        reject_unauthorized_connection
      end
    end
  end
end
