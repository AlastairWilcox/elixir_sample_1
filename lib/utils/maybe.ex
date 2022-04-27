defmodule SampleCodeElixir.Utils.Maybe do
  @moduledoc """
  This is Maybe module. It implements a maybe pattern for a variety of use cases.

  In the sample data there were a lot of random nils, this was added to allow calculations in the cases of missing or broken data.
  """
  @moduledoc since: "0.1.0"

  @doc ~S"""
  Attempts to round a value, if there are nils, it returns zero. 
  For the type of calculations that we being performed, a zero in place of a nil is acceptable.

  ## Examples

      iex> SampleCodeElixir.Utils.Maybe.round(nil, 5)
      0

      iex>SampleCodeElixir.Utils.Maybe.round(3.14, 0)
      3.0
  """
  @spec round(nil, integer) :: 0
  def round(nil, _precision) do
    0
  end

  @spec round(integer, integer) :: integer
  def round(val, _precision) when is_integer(val) do
    val
  end

  @spec round(float, integer) :: float
  def round(val, precision ) when is_float(val) do
    Float.round(val, precision)
  end  

  @doc ~S"""
  Attemps to subtract a previous_val from a current_val.
  If either value is nil, it returns 0
  
  ## Examples

      iex> SampleCodeElixir.Utils.Maybe.subtract(3, 2)
      1

      iex> SampleCodeElixir.Utils.Maybe.subtract(3, nil)
      0
  """
  @spec subtract(nil, nil) :: 0
  def subtract(nil, nil) do
    0
  end

  @spec subtract(nil, number) :: 0
  def subtract(nil, _prev_val) do
    0
  end

  @spec subtract(number, nil) :: 0
  def subtract(_current_val, nil) do
    0
  end

  @spec subtract(number, number) :: number
  def subtract(current_val, prev_val) do
    current_val - prev_val
  end
  

  @doc ~S"""
  Always returns a list 

  ## Examples

      iex> SampleCodeElixir.Utils.Maybe.list(1)
      [1]

      iex> SampleCodeElixir.Utils.Maybe.list([1,2,3])
      [1,2,3]

      iex> SampleCodeElixir.Utils.Maybe.list(nil)
      []

  """
  @spec list(list) :: list
  def list(val) when is_list(val) do
    case val do
      nil -> []
        _ -> val
    end
  end

  @spec list(any) :: list
  def list(val) do
    case val do
      nil -> []
        _ -> [val]
    end
  end


  @doc ~S"""
  adds item onto a list, always returns a list

  ## Examples

      iex> SampleCodeElixir.Utils.Maybe.list(nil, nil)
      []

      iex> SampleCodeElixir.Utils.Maybe.list(1, nil)
      [1]

      iex> SampleCodeElixir.Utils.Maybe.list(1, [2,3])
      [1,2,3]  
  """
  @spec list(nil, nil) :: list
  def list(nil, nil) do
    []
  end

  @spec list(nil, list) :: list
  def list(nil, list) do
    list
  end  

  @spec list(any, nil) :: list
  def list(new_val, nil) do
    [new_val]
  end

  @spec list(any, list) :: list
  def list(new_val, list) when is_list(list) do
    [new_val | list]
  end 

  @spec list(any, any) :: list
  def list(new_val, list) do
    [new_val | [list]]
  end  
end
