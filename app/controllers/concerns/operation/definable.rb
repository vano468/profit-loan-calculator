module Operation
  module Definable
    extend ActiveSupport::Concern

    class_methods do
      def operation_handlers
        @@operation_handlers ||= {}
      end

      def define_operation_handler(type:, success: nil, failure: nil)
        operation_handlers[type] = { success: success, failure: failure }
      end
    end
  end
end
