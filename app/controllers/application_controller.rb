class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        hiring_positions_path
    end

end
