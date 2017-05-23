class Api::AnalyticsController < ApiController
  include Resource::Serializable

  def index
    render json: serialize(ProfitAnalyzer.analyze, Borrower::AnalyzedDataSerializer)
  end
end
