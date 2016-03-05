require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
holiday_hash[:winter][:christmas] << supply
holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  all = []
  all.push(holiday_hash[:winter].values)
  all.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
seasons_string = []
supplies_string = []
  holiday_hash.each do |season, holidays|
    seasons_string.push(season.to_s.capitalize!)
    #seasons are now capitalized, stringform in an array
    #["Winter", "Summer", "Fall", "Spring"]
  end
  split_holiday = []
  holiday_hash.each do |season, holidays|
    holidays.each do |season2, holidays|
    holidays.to_s.capitalize!
    if holidays.include?(" ") == true
      split_holiday.push(holiday.split(" ").capitalize!.join)
      supplies_string.push(split_holiday)
    end
    supplies_string.push(holidays)
     supplies_string.flatten!
  #supplies of each holiday are in an array of arrays ==> supplies_string
  #["Lights", "Wreath"], ["Party Hats"], ["Fireworks", "BBQ"], ["Turkey"], ["BBQ"]]
  end
  end
##here we're trying to get the holidays as strings into an array
  holidays_strings = []
  new_holiday_strings = []
holiday_hash.each do |season, holidays_supplies|
  holidays_strings.push(holidays_supplies.keys)
end
holidays_strings.flatten!.each do |x|
  new_holiday_strings.push(x.to_s)
end
split_array = []
final_split_array = []
one_word_holidays = []
new_holiday_strings.each do |y|
   if y.include?("_") == true
      split_array.push(y.split("_"))
     #[["new", "years"], ["fourth", "of", "july"], ["memorial", "day"]]
     else
     one_word_holidays.push(y.capitalize!)
   end
end
split_array.flatten.each do |x|
  final_split_array.push(x.capitalize!)
end
final_split_array
new_years_array = []
fourth_array = []
memorial_day_array = []
fixed = []
#final_split_array equals below:
#["New", "Years", "Fourth", "Of", "July", "Memorial", "Day"]
new_years_array.push(final_split_array[0..1].join(" "))
new_years_array #==> "New Years"
fourth_array.push(final_split_array[2..4].join(" "))
fourth_array #==>["Fourth Of July"]
memorial_day_array.push(final_split_array[5..6].join(" "))
memorial_day_array #==>["Memorial Day"]
fixed.push(new_years_array, fourth_array, memorial_day_array).flatten!
fixed #==>["New Years", "Fourth Of July", "Memorial Day"]
one_word_holidays #==>["Christmas", "Thanksgiving"]
all_holidays = [one_word_holidays[0], fixed[0], fixed[1], one_word_holidays[1], fixed[2]]
all_holidays #==> ["Christmas", "New Years", "Fourth Of July", "Thanksgiving", "Memorial Day"]
colon = []
all_holidays.each do |x|
  colon.push("  "<< x<<": ")
end
colon #==>["  Christmas: ", "  New Years: ", "  Fourth Of July: ", "  Thanksgiving: ", "  Memorial Day: "]
winter = seasons_string[0]<<":"
christmas = colon[0]<< supplies_string[0] << ", " << supplies_string[1]
newyears = colon[1] << supplies_string[2]
summer = seasons_string[1] <<":"
fourthofjuly = colon[2] << supplies_string[3] << ", " << supplies_string [4]
fall = seasons_string[2]<< ":"
thanksgiving = colon[3] << supplies_string[5]
spring = seasons_string[3] << ":"
memorial = colon[4] << supplies_string[6]

puts winter
puts christmas
puts newyears
puts summer
puts fourthofjuly
puts fall
puts thanksgiving
puts spring
puts memorial
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
names = []
  holiday_hash.each do |season, holidays|
   holidays.each do |k, v|
     v.each do |x|
       names.push(k) if x == "BBQ"
     end
  end
  end
  names
end







