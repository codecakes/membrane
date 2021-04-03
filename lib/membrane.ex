
defmodule Cell do
  @moduledoc """
  Cell is the molecular structure for life.
  """
  defstruct cell_id: nil, receptor: nil, signal: nil, nucleus: nil

  @typedoc """
  Unique Cell Id.
  """
  @type cell_id_t :: pos_integer | bitstring

  @typedoc """
  A receptor is the implemetation that collects information from outside.
  """
  @type receptor_t :: term

  @typedoc """
  A signal is the perceived information type translated from external environment to local vocabulary inside the cell.
  """
  @type signal_t :: term

  @typedoc """
  The engine that processes and generates expressions and overarching guadian of the cell.
  """
  @type nucleus_t :: term

  @typedoc """
  Defines the Cell.
  """
  @type cell_t :: %Cell{cell_id: cell_id_t, receptor: receptor_t, signal: signal_t, nucleus: nucleus_t}
end

defmodule CellInterface do
  @moduledoc false

  @doc """
  Creates new cell.
  """
  @callback create_cell :: ({receptor :: Cell.receptor_t, signal :: Cell.signal_t, nucleus :: Cell.nucleus_t} -> new_cell :: Cell.cell_t)

  @doc """
  Destroys a cell.
  """
  @callback destroy_cell :: (cell_id :: Cell.cell_id_t -> none)

  @doc """
  Get a cell.
  """
  @callback get_cell :: (cell_id :: Cell.cell_id_t -> cell :: Cell.cell_t) | (cell_id :: Cell.cell_id_t -> none)

end


defmodule State do
  @moduledoc """
  A state provides all information about the cell and its mutations.
  Cells may die but states persist. States are eternal transactional logbook for a each cell's journey.
  """

  @typedoc """
  Mutation is meta data on a cell which gives its state.
  """
  @type mutation_t :: %{:cell_id => Cell.cell_id_t, :state_metadata => term, :memory => struct}
end

defmodule StateInterface do
  @moduledoc false

  @doc """
  Creates a mutation, a transient process that results in a state transformation.
  """
  @callback mutate :: (original_cell_state :: {Cell.cell_t, State.mutation_t} -> new_cell_state :: {Cell.cell_t, State.mutation_t})

  @doc """
  Gets a state by cell id detailing it's mutations meta data.
  """
  @callback get :: (cell_id :: Cell.cell_id_t -> mutations :: list(State.mutation_t))

end


defmodule Environment do
  @moduledoc """
  TL;DR Every cell is shaped by its environment. An environemnt is the perfect place for distributed AI cells.

  Generic cells or so-called stem cells are embryonic cells that can transform into any kind of cell in the body i.e. Shapeshifters.
  """

  @typedoc """
  An environment can host many cells.
  """
  @type cells_t :: list(Cell.cell_t)

end


defmodule Membrane do
  @moduledoc """
  Documentation for `Membrane`.

  Cellular interface: Skeletal API that exposes structures to build intelligent information systems based on Cellular structures.

  Vocabulary: Receptors, signals, environment, mutation (driven by external environment)

  Membrane was inspired by the podcast "Under The Skin" with Russel Brand featuring Bruce Lipton.
  Link: https://www.youtube.com/watch?v=6XmhVB8AIt0&ab_channel=RussellBrand

  It speaks about the remarkable cellular structure:
  a. membranes: they are receptors to environment and pass the message to nucleus.
  b. nucleus: Reproduction center i.e. gonads of the cell: this is what uses the cell culture based on information from
  the skin(receptors) of the cell i.e. membranes and generates information.
  """

  # TODO(codecakes): impl Interfaces
  # @behaviour CellInterface
  # @behaviour StateInterface

  @doc """
  Hello world.

  ## Examples

      iex> Membrane.hello()
      :world

  """
  def hello do
    :world
  end
end

defmodule Membrane.CLI do
  @moduledoc false

end
