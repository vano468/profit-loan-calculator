module Resource::Serializable
  def serialize(resource)
    ActiveModelSerializers::SerializableResource.new(resource).serializable_hash
  end
end
