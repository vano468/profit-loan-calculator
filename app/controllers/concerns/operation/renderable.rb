module Operation
  module Renderable
    def render_model(op)
      render status: :ok, json: op['model']
    end

    def render_model_errors(op)
      errors = op['contract.default']&.errors&.messages.presence || op['errors.messages']
      render status: :bad_request, json: { errors: errors }
    end
  end
end
