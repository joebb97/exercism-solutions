defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim
    |> String.at(0)
  end

  def initial(name) do
    append_period = fn str -> str <> "." end
    name
    |> String.capitalize
    |> first_letter
    |> append_period.()
  end

  def initials(full_name) do
    full_name
    |> String.split
    |> Enum.map(&initial/1)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    fn1_initials = initials(full_name1)
    fn2_initials = initials(full_name2)
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{fn1_initials}  +  #{fn2_initials}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
