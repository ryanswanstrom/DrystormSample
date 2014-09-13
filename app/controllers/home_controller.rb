class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "landing_page_layout"

  def show
  end

end