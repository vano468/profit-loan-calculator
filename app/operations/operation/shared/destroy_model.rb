class Operation::Shared::DestroyModel
  extend Uber::Callable

  def self.call(options, **)
    options['model'].destroy
  end
end
