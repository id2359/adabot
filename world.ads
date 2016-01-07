package World is
   type Entity is (Food, Friend, Enemy, Shelter, Gunk);
   type Location is (Left, Right, Front, Behind);
   type Perception is record
      What: Entity;
      Where: Location;
   end Perception;
  procedure Perceive: Perception;

end World;

