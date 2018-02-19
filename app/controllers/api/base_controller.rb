module Api
  class BaseController < ApplicationController
    before_action :set_variable

    def set_variable
      @your_var = "this really really works"
    end
  end
end
