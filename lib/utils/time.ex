defmodule SampleCodeElixir.Utils.Time do
  @moduledoc """
  This is Time module. 

  It has utilty functions to work with unix timestamps and normalise peroids of time from a range of unix timestamps 
  
  """
  @moduledoc since: "0.1.0"

  @doc ~S"""
  Get the hour minute second from a unix timestamp
  
  ## Examples
      iex> SampleCodeElixir.Utils.Time.get_hour_minute_second(1649939223)
      "12:27:03"
  """
  @spec get_hour_minute_second(integer) :: String.t()
  def get_hour_minute_second(unix_timestamp) do    
    case DateTime.from_unix(unix_timestamp) do
      {:ok, dt} -> 
        t = DateTime.to_time(dt) 
        t_string = Time.to_string(t)
        [hour, minute, second] = String.split(t_string, ":")
        "#{hour}:#{minute}:#{second}"

      _ -> ""
    end
  end
  
  @doc ~S"""
  Get the hour minute from a unix timestamp
  
  ## Examples
      iex> SampleCodeElixir.Utils.Time.get_hour_minute(1649939223)
      "12:27"
  """
  @spec get_hour_minute(integer) :: String.t()
  def get_hour_minute(unix_timestamp) do    
    case DateTime.from_unix(unix_timestamp) do
      {:ok, dt} -> 
        t = DateTime.to_time(dt) 
        t_string = Time.to_string(t)
        [hour, minute, _second] = String.split(t_string, ":")
        "#{hour}:#{minute}"

      _ -> ""
    end
  end    

  @doc ~S"""
  Get the hour from a unix timestamp
  
  ## Examples
      iex> SampleCodeElixir.Utils.Time.get_hour(1649939223)
      "12"
  """
  @spec get_hour(integer) :: String.t()
  def get_hour(unix_timestamp) do
    case DateTime.from_unix(unix_timestamp) do
      {:ok, dt} -> 
        t = DateTime.to_time(dt) 
        t_string = Time.to_string(t)
        [hour, _minute, _second] = String.split(t_string, ":")
        "#{hour}"

      _ -> ""
    end
  end

  @doc ~S"""
  Get ymd with forward slash from a unix timestamp
  
  ## Examples
      iex> SampleCodeElixir.Utils.Time.get_ymd_forward_slash(1649939223)
      "2022/4/14"
  """
  @spec get_ymd_forward_slash(integer) :: String.t()
  def get_ymd_forward_slash(unix_timestamp) do
    case DateTime.from_unix(unix_timestamp, :second) do
      {:ok, dt} ->
        date = DateTime.to_date(dt)
        "#{date.year}/#{date.month}/#{date.day}"
      
        _ -> ""
      end
  end

  @doc ~S"""
  Get ymd from a unix timestamp
  
  ## Examples
      iex> SampleCodeElixir.Utils.Time.get_ymd(1649939223)
      "2022-4-14"
  """
  @spec get_ymd(integer) :: String.t()
  def get_ymd(unix_timestamp) do
    case DateTime.from_unix(unix_timestamp, :second) do
      {:ok, dt} ->
        date = DateTime.to_date(dt)
        "#{date.year}-#{date.month}-#{date.day}"
      
        _ -> ""
      end
  end 

  
  @doc ~S"""
  Get a timestamp formatter function from a lable
  
  """
  @spec determine_label_by_type(String.t()) :: function
  def determine_label_by_type(label_type)  do    
    case label_type do
      "hour" -> 
        &get_hour/1
      
      "hour_minute" ->
        &get_hour_minute/1

      "hour_minute_second" -> 
        &get_hour_minute_second/1

      "ymd" -> 
        &get_ymd/1

      "ymd_forward_slash" -> 
        &get_ymd_forward_slash/1

    end   
  end
end
