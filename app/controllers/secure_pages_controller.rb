class SecurePagesController < PagesController 
  before_filter :require_login
end
