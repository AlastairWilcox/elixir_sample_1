defmodule SampleCodeElixir.Utils.DataSeriesHelpers do
  alias SampleCodeElixir.Utils.Maybe

  
 
  @doc ~S"""
  
  """
  def accumulate_value([], field_name, _) do
    %{ 
      field_name => [],
      :time => []
    }
  end

  def accumulate_value([head | tail], field_name, time_func) do    
    time_display_str = time_func.(head.unix_timestamp)
    time_acc = Maybe.list(time_display_str, [])
    
    field_value = Maybe.round(Map.fetch!(head, field_name), 2)
    field_acc = Maybe.list(field_value, [])    

    acc = %{
      field_name => field_acc,
      :time => time_acc
    }

    accumulate_value(tail, field_name, time_func, acc)
  end

  defp accumulate_value([head | tail], field_name, time_func, acc) do 
    time_display_str = time_func.(head.unix_timestamp)
    time_acc = Maybe.list(time_display_str, acc.time)

    
    field_value = Maybe.round(Map.fetch!(head, field_name), 2)
    field_acc = Maybe.list(field_value, acc[field_name])

    acc = %{ 
      field_name => field_acc,
      :time => time_acc
    }
    
    accumulate_value(tail, field_name, time_func, acc)
  end

  defp accumulate_value([], _, _, acc) do 
    acc
  end  

   
  @doc ~S"""
  Samples every nth value from a list
  
  """
  def sample_every([], _nth) do
    []
  end 

  def sample_every(_sample_list, 0) do
    []
  end

  def sample_every(sample_list, 1) do
    sample_list
  end

  def sample_every(sample_list, nth) do
    sample_every(sample_list, nth, 1, [])
  end

  def sample_every([head | tail], nth, count, acc) when count >= nth do    
    new_acc = [head | acc]
    sample_every(tail, nth, 1, new_acc)
  end  

  def sample_every([_head | tail], nth, count, acc) do
    sample_every(tail, nth, count + 1, acc)
  end  

  def sample_every([], _, _, acc) do        
    acc    
  end  
end
