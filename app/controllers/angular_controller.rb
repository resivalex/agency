class AngularController < ApplicationController
  def template
    render partial: "angular/#{params[:template]}"
  end
end
