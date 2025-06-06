"lab1" by ktaschek


[ TODO ]
[
- doctor interactions
- room descriptions


- sanity interactions
 - can attack self or hunter
 - talk to hunter


 - talk to doctor / voice


- tutorial of sanity
 - talk to voice and you regain it
]


[ Rooms ]


The room1 is a room.
The room2 is a room.
The room3 is a room.
The room4 is a room.
The room5 is a room.


The  room2 is north of the  room1.
The  room3 is east of the  room2.
The  room4 is north of the  room3.


The Iron Door is a door. The Iron Door is east of the room1. The Iron Door is closed.
A door can be boarded or unboarded. A door is usually unboarded.


The lockedDoor is a door. The lockedDoor is  east of the Room3 and west of the Room5.
The lockedDoor is closed. The lockedDoor is locked.


[ Properties and variables]

To adjust sanity by (N - a number):
	now Sanity level of the player is Sanity level of the player + N;
	if Sanity level of the player >= 0 and Sanity level of the player <= 2:
		if N < 1:
			say "everything feels fuzzy, but as your headache softens, you notice everything seems off";
		otherwise:
			say "your head starts cloudy and your headache worsens, but things seem more normal";
	if Sanity level of the player < 0:
		now Sanity level of the player is 0;
	if Sanity level of the player > 2:
		now Sanity level of the player is 2.
		
The player has a number called sanity level. The sanity level of the player is 2.
A person can be light_headed or sober. The player is light_headed.


Every turn when the player is light_headed:
	if the current action is looking or the current action is waiting or the current action is talking to yourself:
		now the player is sober;
		if the current action is talking to yourself:
			say "I'm glad I rested";
	otherwise:
		say "You try to get up, but your legs betray you. In an instant you collapse back onto the floor—the impact jostles your head. The world seems to shift, as if seen through unfamiliar eyes.";
		adjust sanity by -1;
		now the player is sober;

	   
[ Setup for Reentry Sanity Checks ]


A room has a number called last sanity value.


When play begins:
	repeat with R running through rooms:
		now the last sanity value of R is the sanity level of the player.


Report going to a room (called current room):
	if the sanity level of the player is not the last sanity value of current room:
		say "Something feels off as you step into [the current room].[line break]";
		now the last sanity value of current room is the sanity level of the player.


A room has a text called sanity-0 description.
A room has a text called sanity-1 description.
A room has a text called sanity-2 description.

[ Characters ]


[Hunter]
The hunter is a person. The hunter is in a room called Nowhere.
The hunter can be locked or unlocked. The hunter is locked.


The last_location is a room that varies.


The hunter has a number called hunter_entrance_delay. The hunter_entrance_delay of the hunter is 12.
The hunter has a number called hunter_grace_period. The hunter_grace_period of the hunter is 5.
The hunter has a number called hunter_talking_stage. The hunter_talking_stage of the hunter is 1.


The hunter has a number called conversation stage.  
The conversation stage of the hunter is 1.


When play begins:
	now the last_location  is the location of the player.


Every turn when hunter_entrance_delay of the hunter > 0:
	decrement the hunter_entrance_delay of the hunter;
	if the hunter_entrance_delay of the hunter is 0:
		say "A distant click echoes as you notice the boarded door creak open...";
		now the hunter is unlocked;
		now the hunter is in Room1.
	   
Every turn while hunter is unlocked:
	let next direction be the best route from the location of the hunter to the location of the player;
	if next direction is a direction:
		try the hunter going next direction.


Every turn when the hunter is in the location of the player:
	if the last_location is the location:
		decrement the hunter_grace_period of the hunter;
		say "The hunter looms ominously. You have [hunter_grace_period of the hunter] turn[s] left before he strikes!";
		if the hunter_grace_period of the hunter is 0:
			say "Before you can act, the hunter pounces—your fate is sealed!";
			say "'I'm sorry, I must do this'";
			end the story;
	else if the last_location is not the location:
		now the last_location is the location of the player.
	   
[ Corpse of the Hunter ]
The corpse of the hunter is a thing. The corpse of the hunter can be alive or dead. The corpse of the hunter is dead. The corpse of the hunter is nowhere.  
   
[Doctor]
The doctor is a person in Room5.

   



[ Dynamic Room Descriptions ]


To say my sanity description of (R - a room):
	if the sanity level of the player is 0:
		say the sanity-0 description of R;
	else if the sanity level of the player is 1:
		say the sanity-1 description of R;
	else:
		say the sanity-2 description of R.


After printing the name of a room (called R) while looking:
	say "[line break][line break][roman type][my sanity description of R]";


The sanity-0 description of Room1 is "You are in a bleak, colorless void where nothing feels real.".
The sanity-1 description of Room1 is "The room appears distorted and hazy, as though viewed through a fog of uncertainty.".
The sanity-2 description of Room1 is "Everything seems normal, and the room is as you would expect it to be.".


The sanity-0 description of Room2 is "You are in a bleak, colorless void where nothing feels real.".
The sanity-1 description of Room2 is "The room appears distorted and hazy, as though viewed through a fog of uncertainty.".
The sanity-2 description of Room2 is "Everything seems normal, and the room is as you would expect it to be.".


The sanity-0 description of Room3 is "You are in a bleak, colorless void where nothing feels real.".
The sanity-1 description of Room3 is "The room appears distorted and hazy, as though viewed through a fog of uncertainty.".
The sanity-2 description of Room3 is "Everything seems normal, and the room is as you would expect it to be.".


The sanity-0 description of Room4 is "You are in a bleak, colorless void where nothing feels real.".
The sanity-1 description of Room4 is "The room appears distorted and hazy, as though viewed through a fog of uncertainty.".
The sanity-2 description of Room4 is "Everything seems normal, and the room is as you would expect it to be.".


The sanity-0 description of Room5 is "You are in a bleak, colorless void where nothing feels real.".
The sanity-1 description of Room5 is "The room appears distorted and hazy, as though viewed through a fog of uncertainty.".
The sanity-2 description of Room5 is "Everything seems normal, and the room is as you would expect it to be.".


[ Testing ]
Increasing sanity is an action out of world. Understand "sanity up" as increasing sanity.


Carry out increasing sanity:
	say "You feel more composed.";
	adjust sanity by 1.


Decreasing sanity is an action out of world. Understand "sanity down" as decreasing sanity.


Carry out decreasing sanity:
	say "Your mind trembles.";
	adjust sanity by -1.
   
Checking sanity is an action out of world. Understand "check sanity" as checking sanity.


Carry out checking sanity:
	say "Sanity Level: [Sanity level of the player][line break]";
	say "Current Location: [location of the player][line break]";
	say "Current Room Sanity: [last sanity value of the location ]".


[ Start Room - TODO ]
The board is a thing in Room1. The board is portable.
The jagged knife is a thing in Room1. The jagged knife is portable.
Understand "knife" as the jagged knife.


Boarding up is an action applying to one thing. Understand "board [something]" or "board up [something]" as boarding up.


instead opening the Iron Door:
	if the Iron Door is unboarded:
		say "A disembodied, stern voice whispers: 'Do not open that door!'";
	if the Iron Door is boarded:
		say "The Iron Door is nailed shut".


Check boarding up:
	if the player does not carry the board:
		say "You need to have the board in your hand in order to board up the door.";
	otherwise:
		say "You firmly nail the board to the Iron Door, reinforcing it and buying yourself extra time.";
		remove the board from play;
		increase hunter_entrance_delay of the hunter by 4;
		now the Iron Door is boarded;


[ Second Room - TODO ]
The lever is a thing in Room2.
The lever is portable.
The lever can be attached or detached. The lever is detached.


[ Third Room - TODO ]
On the north wall of the Chapel is a painting.  
The painting is a backdrop.  
Understand "painting", "wall", "imagery", "goat" as the painting.


The description of the satanic painting is
	"At first glance it’s an exquisite oil work: a goat‑headed figure seated upon a jagged throne, horns curling skyward, eyes smoldering ember‑red.  
	Surrounding it are arcane sigils painted in dolorous crimson, and at its feet lie broken chalices and sacrificial candles whose flames seem almost to gasp in the still air."
   
check examining the painting:
	adjust sanity by 1.


[ Puzzle Room - TODO ]
The wire A is a thing in the Room4.
The wire B is a thing in the  Room4.
The wire C is a thing in the  Room4.
The socket is a thing in the  Room4.


The correct_connection_order is a list of things that varies. The correct_connection_order is {wire A, wire C, wire B}.


The current_connection_sequence is a list of things that varies. The current_connection_sequence is {}.


To decide whether (L - a list of things) is_a_prefix of (M - a list of things):
	if the number of entries in L > the number of entries in M, decide on false;
	repeat with I running from 1 to the number of entries in L:
		if entry I of L is not entry I of M, decide on false;
	decide on true.




[ Final Room ]
The altar is a thing in Room5.
After entering Room5:
	now the lockedDoor is closed;
	now the lockedDoor is locked;
	say "With a heavy **clang**, the Steel Gate swings shut and locks itself automatically.";
	adjust sanity by -1.

Laying down on is an action applying to one thing.
Understand "lay down on [something]" as laying down on.


Instead of laying down on the altar:
	end the story.


[ Actions ]


[ Attacking ]
Attacking without weapon is an action applying to one thing.
Attacking with weapon is an action applying to two things.


Understand "hit [someone]" as attacking.
Understand "attack [someone] with [something]" as attacking with weapon.
Understand "stab [someone] with [something]" as attacking with weapon.
Understand "hit [someone] with [something]" as attacking with weapon.
Understand "cut [someone] with [something]" as attacking with weapon.


Instead of attacking the hunter:
	say "You engage the hunter with a desperate charge. In a panic, he fumbles his aim and misses a crucial shot. He swings his shotgun, hitting you in the head. Amidst the chaos, you kill the hunter.";
	remove the hunter from play;
	now the corpse of the hunter is in the location;


Instead of attacking the doctor:
	say "You lunge at the doctor with fierce determination, but suddenly feel a firm grip from behind. Before you can recover, you are pinned against the table by the doctor, your attack thwarted.";


Instead of attacking yourself:
	adjust sanity by -1;
	say "In an act of self-directed violence, you turn your fury inward. Blood flows as your insanity level drops by one."


[ Wires ]
Connecting is an action applying to one thing.  
Understand "connect [thing]" as connecting.




Check connecting:
	if (noun is not wire A) and (noun is not wire B) and (noun is not wire C):
		say "That doesn't look like one of the wires" instead;
	if the noun is listed in the current_connection_sequence:
		say "You've already connected [the noun]." instead;
	say "You connect [the noun].";
	add the noun to the current_connection_sequence;
	if (current_connection_sequence is_a_prefix of correct_connection_order) and (the number of entries in current_connection_sequence is the number of entries in correct_connection_order):
		say "A satisfying click sounds as the wires align perfectly.";
	else if  not (current_connection_sequence is_a_prefix of correct_connection_order):
		say "Sparks fly as the connections fizzle out! The wires reset.";
		now the current_connection_sequence is {}.
   
[ Attaching ]
Attaching is an action applying to one thing. Understand "attach [thing]" as attaching.


Check attaching:
	if the noun is not the lever:
		say "That doesn't seem to fit" instead;
	else:
		say "The lever latches into place";
		now the lever is attached;
		now the lever is in the Room4.


[ Pulling ]
Understand the command "pull" as something new.
Understand "pull [something]" as pulling


check pulling:
	if the noun  is not the lever:
		say "I'm not sure how to do that ." instead;
	if (current_connection_sequence is_a_prefix of correct_connection_order) and (the number of entries in current_connection_sequence is the number of entries in correct_connection_order):
		say "You pull the lever and the mechanism hums to life. The wires glow with energy. You here something unlock";
		Now the lockedDoor is unlocked;
	else:
		say "You pull the lever, but nothing happens. The wires don't seem to be connected properly."
	   
[ talk to ]


Talking to is an action applying to one visible thing.  
Understand "talk to [someone]" as talking to.


Check talking to the hunter:
	if the conversation stage of the hunter is 1:
		say
			"'Be careful out here—wolves have been spotted,' the hunter warns.";
		now the conversation stage of the hunter is 2;
	otherwise if the conversation stage of the hunter is 2:
		say
			"'You look like you could use some provisions. I’ve got extra arrows,' he offers.";
		now the conversation stage of the hunter is 3;
	otherwise if the conversation stage of the hunter is 3:
		say
			"'Safe travels, friend. May your aim be true,' he salutes and turns away.";
		now the conversation stage of the hunter is 1;
	otherwise:
		say
			"'...'".
Check talking to yourself:
	if the sanity level of the player is 2:
		say "My brain feels foggy";
	if the sanity level of the player is 1:
		say "It's clearing up";
	if the sanity level of the player is 0:
		say "The pain in my neck and head is gone, but nothing feels right"
