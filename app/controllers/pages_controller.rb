class PagesController < ApplicationController
  include Resource::Serializable

  def index
    resource = Borrower.includes(:payments).order(id: :desc)
    gon.data = serialize(resource)
  end
end
