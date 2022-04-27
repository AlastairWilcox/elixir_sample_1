defmodule SampleCodeElixir.Api.ApiSensors do
  @moduledoc """
  This module contains the entry function for this sample.
  """
  @moduledoc since: "0.1.0"

  alias SampleCodeElixir.Utils.Time
  alias SampleCodeElixir.Utils.DataSeriesHelpers 
  
  @doc """
  This is the entry function for this sample.
    
  """
  @spec process(list, String.t(), String.t()) :: list(map())
  def process(series, field_name, time_label_type) do 
    field_name_atom = String.to_existing_atom(field_name)
     
    time_render_func = Time.determine_label_by_type(time_label_type)
    DataSeriesHelpers.accumulate_value(series, field_name_atom, time_render_func)     
  end   
end
