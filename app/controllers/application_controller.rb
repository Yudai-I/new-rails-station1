class ApplicationController < ActionController::Base
    before_action :set_cache_headers

    private

    def set_cache_headers
        response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate" # HTTP 1.1.
        response.headers["Pragma"] = "no-cache" # HTTP 1.0.
        response.headers["Expires"] = "0" # Proxies.
    end
end
