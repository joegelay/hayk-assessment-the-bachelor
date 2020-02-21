require 'pry'

# helper funciton to put all contestant hashes in one array
def contestant_data(data)
  data.values.flatten
end 

def get_first_name_of_season_winner(data, season)
  data[season].find { |contestant| 
    contestant["status"].downcase == "winner"
    return contestant["name"].split(" ").first
}
end

def get_contestant_name(data, occupation)
  contestant_data(data).find do |contestant| 
     contestant["occupation"] == occupation
   end["name"]
end

def count_contestants_by_hometown(data, hometown)
  contestant_data(data).select do |contestant| 
    contestant["hometown"] == hometown
  end.length
end

def get_occupation(data, hometown)
  contestant_data(data).find do |contestant| 
    contestant["hometown"] == hometown
  end["occupation"]
end

def get_average_age_for_season(data, season)
  result = data[season].reduce(0) do |total, contestant| 
    total + contestant["age"].to_f
  end
  (result / data[season].size).round
end 
