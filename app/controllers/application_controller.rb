class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain_or_domain(:company, :subdomain, :domain_name)
end
