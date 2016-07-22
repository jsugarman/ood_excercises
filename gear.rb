class Gear

  attr_reader :chainring, :cog, :wheel

  # Single responsibility principle: Chapter 2
  # ------------------------------------------
  # **i.e. increasing cohesion**
  # 1. Class Single Responsibility
  #   - Use Structs for convenient lightweight class substitute
  #   - Extract to class when more complex/reusable/
  # 2. method single responsibility
  #    - a plural method can probably be broken into two plural and singuler
  #    - e.g. diameters calls diameter

  # Dependency Management: Chapter 3
  # --------------------------------
  # **i.e. descreasing coupling**
  # 1. isolate or remove external class dependences
  #   - remove by injecting/passing in instance of the external class
  #   - remove by passing the required external class message value directly to method
  #   - isolate through instantiation in method and/or eager load in initialisation
  #
  # 2. isolate message dependencies
  #   - wrap external class instance message/method-call dependency in local method
  #   - e.g. def diameter; wheel.diameter; end;
  #
  # 3. remove argument order dependencies
  #   - use a hash of args/options i.e. named-parameters
  #   - explicitly define defaults in separate method
  #   - if you cannot remove argument dependencies (not your class)
  #     then create module wrapper to isolate call.
  #
  # 4. dependencie direction - reversing dependencies - how to choose
  #  - the class that is most likely to change is best suited to having the dependency
  #  - the class that is least likely to change is best suited to having dependants
  def initialize args
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * diameter
  end

  private

  # isolate message/method call dependencies
  def diameter
    wheel.diameter
  end

  # explicitly define defaults in separate method
  def defaults
    { chainring: 20, cog: 30, wheel: nil }
  end

end