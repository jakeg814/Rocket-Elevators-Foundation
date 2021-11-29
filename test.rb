require('date')

random_year = rand(2017..2021)
random_month = rand(1..12)
random_date = rand(1..28)

intervention_start_date = Date.new(random_year, random_month, random_date).to_date

