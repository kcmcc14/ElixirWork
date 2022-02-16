defmodule Company do
  defstruct title: "", employees: []
  # count/1, member?/2, reduce/3
  ## reduce // first arg - enumerable, second arg - accumulator (store the result), third arg - reducer function to apply
  ### accumlator is duple {verb, result} // :cont, :halt, :suspend
  ### result = {state, result} // :done, :halt, :suspended

  defimpl Enumerable do

    def reduce(_, {:halt, result}, _fun), do: {:halted, result}

    def reduce(%Company{employees: _employees} = company, {:suspend, result}, fun) do
      {:suspended, result, &reduce(company, &1, fun)}
    end

    def reduce(%Company{employees: []}, {:cont, result}, _fun), do: {:done, result}

    def reduce(%Company{employees: [ head | tail ]}, {:cont, result}, fun) do
      reduce(%Company{employees: tail}, fun.(head, result), fun)
    end

    def count(%Company{employees: employees}) do
      { :ok, Enum.count(employees )}
    end

    def member?(%Company{employees: employees}, employee) do
      { :ok, Enum.member?(employees, employee) }
    end

  end
end

defmodule Employee do
  defstruct name: "", salary: "", works_for: 0

  defimpl String.Chars do
    def to_string(%Employee{name: name, salary: salary}) do
      "Name: #{name}, salary: #{salary}"
    end
  end
end

defmodule Demo do
  def work do
    company = %Company{
      title: "HCA",
      employees: [
        %Employee{name: "Bryan", salary: "high", works_for: 50},
        %Employee{name: "Vikas", salary: "high", works_for: 55},
        %Employee{name: "Ryan", salary: "high", works_for: 60}
      ]
    }

    Enum.count(company) |> IO.inspect
    Enum.member?(company, %Employee{name: "Ryan", salary: "high", works_for: 60}) |> IO.inspect
    Enum.reduce(company, 0, fn(employee, total_years) -> employee.works_for + total_years end ) |> IO.inspect
  end
end

Demo.work()
