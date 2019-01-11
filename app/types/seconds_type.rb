class SecondsType < ActiveRecord::Type::Integer
  # [2018, 12, 25, 0, 5]:Array
  # 0 - hour, 5 - minute
  def cast(datetime)
    hours, minutes = datetime.values.last(2)

    # Часы надо на 3600 умножать.
    # А можно еще хитрее поступить - в Rails пропатчен класс Integer,
    # у него есть методы hours/minutes, можно писать 10.hours + 5.minutes
    values[3] * 60 + values[4] * 60
  end
  # to properly write to db
  def serialize(value)
    value.to_i
  end
end