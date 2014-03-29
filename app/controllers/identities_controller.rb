class IdentitiesController < ApplicationController
  def create
    identity = Identity.create_from_auth(env['omniauth.auth'], current_user)
    self.current_user = identity.user
    redirect_to sources_path
  end
end
