class WelcomeController < ApplicationController
  def index
    begin
      raise "foo!"
    rescue Exception => e
      logger.info("yo g, i had an exception: #{e}")
    end
  end
end