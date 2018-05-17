class NewsFeedsController < ApplicationController
  before_action :find_follow_list , only:[ :index ]
  def index

  end
end
