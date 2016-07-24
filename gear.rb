class Gear

  attr_reader :chainring, :cog, :wheel

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