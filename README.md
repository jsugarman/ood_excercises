Store of code and notes written while reading Sandi Metz's Practical Object-Orientated Design in Ruby

Single responsibility principle: Chapter 2
------------------------------------------
**i.e. increasing cohesion**

1. Class Single Responsibility
    - Use Structs for convenient lightweight class substitute
    - Extract to class when more complex/reusable/
2. method single responsibility
    - a plural method can probably be broken into two - plural and singuler
    - e.g. diameters calls diameter

Dependency Management: Chapter 3
--------------------------------
**i.e. descreasing coupling**

1. isolate or remove external class dependencies
    - remove by injecting/passing in instance of the external class
    - remove by passing the required external class message value directly to method
    - isolate through instantiation in method and/or eager load in initialisation

2. isolate message dependencies
    - wrap external class instance message/method-call dependency in local method
    - e.g. def diameter; wheel.diameter; end;

3. remove argument order dependencies
    - use a hash of args/options i.e. named-parameters
    - explicitly define defaults in separate method
    - if you cannot remove argument dependencies (not your class) then create module wrapper to isolate call.

4. dependencie direction - reversing dependencies - how to choose
    - the class that is most likely to change is best suited to having the dependency
    - the class that is least likely to change is best suited to having dependants


Create Flexible Interfaces - Chapter 4
---------------------------------------

1. defining:
    - public interface is for stable methods that define the classes responbilitites
    - protected/private for changeable methods handling implementation
2. designing the public interface:
    - domain objects are obvious - e.g. Customer, Trip, Bicycle
    - required messages reveal hidden classes and interfaces - e.g. suitable_trips method reveals TripFinder class
    - use sequence diagrams for throwaway analysis to identify best designs
    - messages ask "what", not tell "how"
    - increase context independence - using dependency injection and passing self out
    e.g.
```ruby
    # remove context - trip does not need to know that mechanic
    # will prepare bicycles as part of preparing trip. Instead trip
    # provides a receiver (bicycles) for mechanic.
    class Trip
      def prepare
        #...other prep'
        mechanic.prepare _trip(self)
      end
    
      def bicycles
        3.mountain_bikes
      end
    end

    class Mechanic
      def prepare_trip trip
        trip.bicycles
      end
    end
```
3. law of demeter a.k.a. only talk to your neighbour, use only one dot
    - the longer the chain the more dependencies
    - reading attributes by chaining is less problematic
    - chain elements of the same class (e.g. enumerable, `hash.keys.sort.join(',')`) is less problematic
    - can use delegation (deletegate/forwardable) to circumnavigate law but not spirit
    - violations can indicate poor design - i.e. perhaps the method should not even be in this class
