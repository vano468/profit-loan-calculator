module Operation
  module Runnable
    def run_operation(op, callbacks: {}, inject: {}, as: nil)
      op_params = operation_params(inject)
      handle_operation(op.(op_params), as, callbacks)
    end

    def handle_operation(op, type, callbacks)
      if type &&
        self.class.respond_to?(:operation_handlers)
        callbacks = self.class.operation_handlers[type]
      end

      op.success? ?
        run_callback(op, :success, callbacks) :
        run_callback(op, :failure, callbacks)
    end

    def run_callback(op, type, callbacks)
      default_callbacks = {
        success: -> (_) { head :ok },
        failure: -> (_) { head :bad_request } }

      case callbacks[type]
        when Proc then callbacks[type]
        when Symbol then method(callbacks[type])
        else default_callbacks[type]
      end.(op)
    end

    def operation_params(additional_params = {})
      params.permit!.to_h.deep_merge(additional_params)
    end
  end
end
