class ObservationSerializer < ActiveModel::Serializer
  attributes :id, :temp, :humidity, :pressure, :user_id
end
