with World;
with Actions;
with Sounds;

procedure Shutdown is
   
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


	  
      
      
	 
   
   

     





