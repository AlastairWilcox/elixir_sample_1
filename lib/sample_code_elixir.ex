defmodule SampleCodeElixir do
  @moduledoc """
  Documentation for `SampleCodeElixir`.
  """

  alias SampleCodeElixir.Api.ApiSensors
  alias SampleCodeElixir.Utils.DataSeriesHelpers

  require Logger

  @doc """
  Run

  ## Examples

      iex> SampleCodeElixir.run()
      

  """
  @spec run() :: {:ok}
  def run() do
    # 1440 minutes in a day, assume 1 message a minute
    Logger.info("Running process for 1 day of generated data")
    run_and_write("output_1_day_hour.json", generate_data(1440), "val" , "hour")

    # 1440 minutes in a day, 7 days, assume 1 message a minute
    Logger.info("Running process for 1 day of generated data")
    run_and_write("output_1_day_hour_minute.json", generate_data(1440), "other", "hour_minute")

     # 1440 minutes in a day, 30 days, assume 1 message a minute
    Logger.info("Running process for 1 day of generated data")
    run_and_write("output_1_day_hour_minute_second.json", generate_data(1440), "another", "hour_minute_second")

    # 1440 minutes in a day, 60 days, assume 1 message a minute
    Logger.info("Running process for 60 days of generated data")

    data = DataSeriesHelpers.sample_every(generate_data(1440 * 60), 720)
    run_and_write("output_60_days_ymd.json", data, "yet", "ymd")    
    
    {:ok}
  end
  
  @doc """
  generates a dataset of a particular size

  Returns [%{other: 1.38268, unix_timestamp: 1650294470, val: 15}, ...]

  """
  @spec  generate_data(integer) :: list(map())
  def generate_data(item_count) do
    now  = System.os_time(:second)
    for n <- 1..item_count do
      ts =  now - n * 60;
      val = :rand.uniform(60)
      other = :rand.uniform(100) * 0.34567
      another = :rand.uniform(10)
      yet = :rand.uniform(600)

      %{
        :unix_timestamp => ts,
        :val => val,
        :other => other,
        :another => another,
        :yet => yet
      }
    end  
  end

  @spec run_and_write(String.t(), list ,String.t(), String.t()) :: none()
  defp run_and_write(file_name, data, field_name, time_label_type) do
    {:ok, file} = File.open(file_name, [:write])    
    IO.write(file, Poison.encode!(ApiSensors.process(data, field_name, time_label_type)))
    File.close(file)       
  end
end
