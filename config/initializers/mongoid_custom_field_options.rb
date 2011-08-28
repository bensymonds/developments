Mongoid::Field.option :required do |model, field, required|
  model.validates_presence_of field.name if required
end
