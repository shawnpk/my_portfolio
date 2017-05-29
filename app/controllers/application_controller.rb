class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
end
