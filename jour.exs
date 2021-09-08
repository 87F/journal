defmodule Journal do
  @journal "journal.txt"

  def main([]), do: IO.puts(File.read!(@journal))

  def main(args), do: write(args)

  def write(args) do
    entry = "#{NaiveDateTime.utc_now()}: " <> Enum.join(args, " ")
    File.open!(@journal, [:append], fn file -> IO.puts(file, entry) end)
  end
end

Journal.main(System.argv)
