# SampleCodeElixir

This sample is inspired by code that was part of an API. A user would run a query then they could select a 
field and function to perform on the data. The results were fed into a data visualisation package.

Here data is generated emulating an ecto query, returning a list of maps. There are a variety of functions that can be run on the data.


## Testing
mix test

## Running
iex -S mix
iex> SampleCodeElixir.run()

## Output
Output is wrtitten to the following files:

output_1_day_hour_minute_second.json
output_1_day_hour_minute.json./output_1_day_hour.json
output_60_days_ymd.json





