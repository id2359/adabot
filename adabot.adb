with Ada.Real_Time; use Ada.Real_Time;
with Nxt.Avr;
with NXT.Display; use NXT.Display;

with World;
with Actions;
with Sounds;

-- need to add "last chance handler" 
-- http://www.adacore.com/adaanswers/gems/gem-112-lego-mindstorms-ada-environment-part-1/

procedure Shutdown is
begin
   Put_Line("shutting down..");
   loop
      delay until Clock + Seconds(1);
      Nxt.Avr.Power_Down;
   end loop;
end Shutdown;

procedure AdaBot is
   P : World.Perception;
   
   loop 
      if Switched_Off then
	Shutdown;
	exit loop;
      end if;
      
      P := World.Perceive;
      
      case P.What is
	 when Food =>
	    Sounds.Yum;
	    Actions.Go_Toward (P.Where);
	    Actions.Eat;
	    
	 when Friend =>
	    Sounds.Purr;
	    Actions.Go_Toward (P.Where);
	    Actions.Greet;
	    
	 when Enemy =>
	    Sounds.Scream;
	    Actions.Run_Away (P.Where);
	    Actions.Tremble;
	    
	 when Gunk =>
	    Sounds.Beep;
	    Actions.Explore (P.Where);
      end case;
    	      
   end loop;
end AdaBot;


	  
      
      
	 
   
   

     





