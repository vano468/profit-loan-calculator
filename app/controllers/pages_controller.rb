class PagesController < ApplicationController
  include Resource::Serializable

  def index
    analytics = serialize(ProfitAnalyzer.analyze, Borrower::AnalyzedDataSerializer)
    borrowers = serialize(Borrower.includes(:payments).order(id: :desc))

    gon.data = {}
      .merge(borrowers)
      .merge(analytics: analytics)
  end
end
