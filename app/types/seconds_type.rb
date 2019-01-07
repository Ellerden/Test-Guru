class SecondsType < ActiveRecord::Type::Integer
  # [2018, 12, 25, 0, 5]:Array
  # 3 - hour, 4 - minute
  def cast(datetime)
    values = datetime.values
    values[3] * 60 + values[4] * 60
  end
  # to properly write to db
  def serialize(value)
    value.to_i
  end
end