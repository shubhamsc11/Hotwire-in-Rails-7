class OtherController < ApplicationController

  def post_something
    respond_to do |format|
      format.turbo_stream { }
    end
  end

end
