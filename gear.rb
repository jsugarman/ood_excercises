class Gear

  attr_reader :chainring, :cog, :wheel

  # Single responsibility principle: Chapter 1
  # ------------------------------------------
  # Use Structs for convenient lightweight class substitute
  # Extract to class when more complex/reusable/

  # Dependency Management: Chapter 2
  # --------------------------------
  # remove external class dependences by injecting/passing in instance of the external class
  # remove argument order dependencies by using a hash of args/options
  # explicitly define defaults in separate method
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

  # isolate message/method call dependences
  def diameter
    wheel.diameter
  end

  # explicitly define defaults in separate method
  def defaults
    { chainring: 20, cog: 30, wheel: nil }
  end

end