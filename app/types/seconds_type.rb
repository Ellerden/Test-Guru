class SecondsType < ActiveRecord::Type::Integer
  # datetime format from form {1=>2018, 2=>12, 3=>25, 4=>0, 5=>7}:Hash
  # [2018, 12, 25, 0, 5]:Array
  def type_cast(datetime)
    values = datetime.values
    values[3] * 60 + values[4] * 60
   # datetime[:hour] * 60
   # time_hash = ::Date._parse(datetime)
   # time_hash[:hour] * 60 + time_hash[:min] * 60
   # hash = params["test"]
    #hash["time(5i)"]


    # "test"=>{"title"=>"124141414", "level"=>"5", "category_id"=>"1", "time(1i)"=>"2018", "time(2i)"=>"12", "time(3i)"=>"25", "time(4i)"=>"00", "time(5i)"=>"03"},
    # minute = (params[(datetime.to_s + '(5i)').to_sym] || 0).to_i
    # #datetime['1i']
  #  datetime[4i]* 60 + datetime[5i] * 60
    #datetime(4i)
 #   params[:datetime]['open_schedule(4i)']).to_s
    # :hash
    # datetime.strftime("%H").to_i * 60 + time.strftime("%M").to_i * 60
    # datetime["4"]
    #.to_i * 60 + datetime[:5].to_i * 60

#    datetime.strftime("%H").to_i * 60 + time.strftime("%M").to_i * 60
  end
end