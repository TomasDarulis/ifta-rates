# frozen_string_literal: true

class HelloWorldController < ApplicationController

  def index
    @hello_world_props = { ifta_rates: [IftaRate.all] }
  end
end
