
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

  @doc """
  Input to cell interface via receptor.
  """
  @callback take_reception :: (%{:reception_data =>  reception_data :: struct, :cell_id => cell_id :: Cell.cell_id_t} -> cell :: Cell.cell_t)

end


defmodule State do
  @moduledoc """
  A state provides all information about the cell and its mutations.
  Cells may die but states persist. States are eternal transactional logbook for a each cell's journey.
  See: https://www.genome.gov/genetics-glossary/Cell-Cycle

  Cells use special proteins and checkpoint signaling systems to ensure that the cell cycle progresses properly.
  """

  @typedoc """
  Mutation meta data on a cell.
  """
  @type mutation_t :: %{:cell_id => Cell.cell_id_t, :mutation_metadata => term}

  @typedoc """
  A stage is a transactional snapshot of a cell's memories, metadata, mutation data.
  """
  @type stage_t :: %{
    :cell_id => Cell.cell_id_t,
    :memory => memory :: struct,
    :stage_metadata => stage_metadata :: struct,
    :mutation => mutation :: mutation_t | none
  }

  @typedoc """
  Mitosis: This is where the cell actually partitions the two copies of the genetic material into the two daughter cells.
  After M phase completes, cell division occurs and two cells are left, and the cell cycle can begin again.
  """
  @type mitosis_t :: stage_t

  @typedoc """
  G1 is the stage where the cell is preparing to divide.
  """
  @type g1_stage_t :: stage_t

  @typedoc """
  S phase where the cell copies all the DNA. S stands for DNA synthesis.
  """
  @type s_stage_t :: stage_t

  @typedoc """
  G2 stage, where cell organizes and condenses the genetic material
  and prepares to divide.
  """
  @type g2_stage_t :: stage_t

  @typedoc """
  Cell cycle is the name we give the process through which cells replicate and make two new cells.
  Cell cycle has different stages called G1, S, G2, and M. G1 is the stage where the cell is preparing to divide.
  To do this, it then moves into the S phase where the cell copies all the DNA.
  So, S stands for DNA synthesis. After the DNA is copied and there's a complete extra set of all the genetic material,
  the cell moves into the G2 stage, where it organizes and condenses the genetic material,
  or starts to condense the genetic material, and prepares to divide.
  """
  @type interphase_t :: g1_stage_t | :s_stage_t | :g2_stage_t

  @typedoc """
  Healthy stage in a cell's lifecycle.
  """
  @type healthy_stage_t :: mitosis_t | interphase_t

  @typedoc """
  Unhealthy stage in a cell's lifecycle.
  This will generally lead to cell getting destroyed.
  """
  @type kill_stage_t :: stage_t

  @typedoc """
  A list of chronological cell stages.
  """
  @type cell_stages_t :: list(stage_t)

  @typedoc """
  Checkpoints at the end of G1 and at the beginning of G2 are designed to assess
  DNA for damage before and after S phase.
  """
  @type check_stage_t :: (stage :: stage_t -> assessment :: boolean)

  @typedoc """
  A cell with its initial stage.
  """
  @type new_cell_state_t :: %{
    :daughter_cell => daughter_cell :: Cell.cell_t,
    :cell_stage => cell_stage :: stage_t
  }

  @typedoc """
  Reproduces a cell into two daughter cells replicating from the original copy.
  """
  @type reproduce_t :: (%{
    :cell_id => cell_id :: Cell.cell_id_t,
    :cell_stages => cell_stages :: cell_stages_t,
    } -> {new_cell_state_ :: new_cell_state_t, new_cell_state :: new_cell_state_t})

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
  @callback get :: (cell_id :: Cell.cell_id_t -> cell_stages :: State.cell_stages_t)

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
