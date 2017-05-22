class PagesController < ApplicationController
  include Resource::Serializable

  def index
    gon.data = serialize(Borrower.all)
  end
end
