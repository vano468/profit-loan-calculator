module Operation
  module Renderable
    def render_model(op)
      render status: :ok, json: op['model']
    end

    def render_contract_errors(op)
      render status: :bad_request,
        json: { errors: op['contract.default']&.errors&.messages }
    end
  end
end
