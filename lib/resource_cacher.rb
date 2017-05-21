class ResourceCacher
  EXPIRE_IN = 5.minutes

  attr_reader :resource, :expire_in

  def initialize(resource, expire_in: EXPIRE_IN)
    @resource = resource
    @expire_in = expire_in
  end

  def fetch(&block)
    Rails.env.test? ?
      block.call :
      Rails.cache.fetch(resource, expires_in: expire_in, &block)
  end
end
