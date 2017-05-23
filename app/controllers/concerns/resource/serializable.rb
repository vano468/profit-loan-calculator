module Resource::Serializable
  def serialize(resource, custom_serializer = nil)
    if custom_serializer
      custom_serializer.new(resource).serializable_hash
    else
      ActiveModelSerializers::SerializableResource.new(resource).serializable_hash
    end
  end
end
