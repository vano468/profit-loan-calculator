class ApiController < ApplicationController
  include Operation::Runnable
  include Operation::Renderable
  include Operation::Definable

  define_operation_handler(type: :model,
    success: :render_model, failure: :render_model_errors)
  define_operation_handler(type: :render, success: :render_model)
end
