class HomeController < ApplicationController
 
  def home
  @gossip = Gossip.all
  end

end
