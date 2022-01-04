defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:milliliter, mls}) do
    {:milliliter, mls}
  end

  def to_milliliter({:cup, cups}) do
    {:milliliter, cups * 240}
  end

  def to_milliliter({:fluid_ounce, fl_oz}) do
    {:milliliter, fl_oz * 30}
  end

  def to_milliliter({:teaspoon, amt}) do
    {:milliliter, amt * 5}
  end

  def to_milliliter({:tablespoon, amt}) do
    {:milliliter, amt * 15}
  end

  def from_milliliter({_label, millis}, :milliliter) do
    {:milliliter, millis}
  end

  def from_milliliter({_label, millis}, :cup) do
    {:cup, millis / 240}
  end

  def from_milliliter({_label, millis}, :fluid_ounce) do
    {:fluid_ounce, millis / 30}
  end

  def from_milliliter({_label, millis}, :teaspoon) do
    {:teaspoon, millis / 5}
  end

  def from_milliliter({_label, millis}, :tablespoon) do
    {:tablespoon, millis / 15}
  end

  def convert(volume_pair, out_unit) do
    as_millis = get_volume(to_milliliter(volume_pair))
    in_unit = elem(volume_pair, 0)
    out_vol = get_volume(from_milliliter({in_unit, as_millis}, out_unit))
    {out_unit, out_vol}
  end
end
