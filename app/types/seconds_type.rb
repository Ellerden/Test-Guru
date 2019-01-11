class SecondsType < ActiveRecord::Type::Integer
  # [2018, 12, 25, 0, 5]:Array
  # 0 - hour, 5 - minute
  def cast(datetime)
    hours, minutes = datetime.values.last(2)
    hours.hour.to_i + minutes.minute.to_i
  end
  # to properly write to db
  def serialize(value)
    value.to_i
  end
end