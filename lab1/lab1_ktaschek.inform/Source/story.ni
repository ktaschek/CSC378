"lab1" by ktaschek

The Observation Ward is a room.
The Dilapidated Hallway is a room.
The Holding Cavity is a room.
The Synapse Chamber is a room.
The Sacrifice Hall is a room.


The  Dilapidated Hallway is north of the  Observation Ward.
The  Holding Cavity is east of the  Dilapidated Hallway.
The  Synapse Chamber is north of the  Holding Cavity.


The Iron Door is a door. The Iron Door is east of the Observation Ward. The Iron Door is closed.
A door can be boarded or unboarded. A door is usually unboarded.


The Sealed Door is a door. The Sealed Door is east of Holding Cavity and west of the Sacrifice Hall.
The Sealed Door is closed. The Sealed Door is locked.


[ Characters ]


[Hunter]
The hunter is a person. The hunter is in a room called Nowhere.
The hunter can be locked or unlocked. The hunter is locked.

The description of the hunter is
	"A tall and wide statured figure, dressed in rugged leather clothing. A dark hat hides his face in shadow.   
	He carries a sawed shotgun in one hand. You take note of the knife handle in your boot, vaguely matching the knife you saw before.";

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
		say "A distant bang echoes, the sound of a shotgun, followed by the clanging of the door falling to the floor. A ringing shoots through your ears, but as it calms, your head is somehow less foggy.";
		now the hunter is unlocked;
		now the hunter is in Observation Ward.
	       
Every turn while hunter is unlocked:
	let next direction be the best route from the location of the hunter to the location of the player;
	if next direction is a direction:
		try the hunter going next direction.


Every turn when the hunter is in the location of the player:
	if the last_location is the location:
		decrement the hunter_grace_period of the hunter;
		say "The man looms ominously, pointing his gun towards you.";
	if the hunter_grace_period of the hunter is 0:
		say "'I'm sorry... I must do this ... for everyone' the man utters as he points the barrel towards your head. ";
		if the location is Sacrifice Hall:
			remove the hunter from play;
			now the corpse of the hunter is in the location;
			say "In an instant, metallic arms reach out from the base of the table, darting for the man in an eradic pattern. He whips his gun around to fire, but he's too late.  An piercing the man's chest and he coughs up blood as he slumps against the wall, lifeless.";
		otherwise:
			end the story;
	else if the last_location is not the location:
		now the last_location is the location of the player.
       
[ Corpse of the Hunter ]
The corpse of the hunter is a thing. The corpse of the hunter can be alive or dead. The corpse of the hunter is dead. The corpse of the hunter is nowhere.  

The description of the corpse of the hunter is
	"The lifeless body of the hunter lies motionless.  
	His clothing is torn, and blood congeals around a dark wound in his chest. Blood covers the floor.";
   
[Doctor]
The doctor is a person in Sacrifice Hall.

The description of the doctor is
	"A lean figure in a spotless dark coat, their cold gaze pierces you.  You notice their bone like apendages and drained face.
	They carry a leather satchel bulging with medical tools.";

Every turn when the turn count is 3:
	say
		"'Hurry ... you must come ... Behind that door is something dangerous.. Come to me .. you will be alright' says a thin, but calming voice ";
	adjust sanity by 1.

   
[ Properties and variables]


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


To adjust sanity by (N - a number):
	now Sanity level of the player is Sanity level of the player + N;
	if Sanity level of the player >= 0 and Sanity level of the player <= 2:
		if N < 1:
			say "Everything feels fuzzy, but as your headache lessens, you notice everything seems off.";
		otherwise:
			say "Your head starts to feel cloudy again and your headache worsens, but things seem more normal.";
	if Sanity level of the player < 0:
		now Sanity level of the player is 0;
	if Sanity level of the player > 2:
		now Sanity level of the player is 2.
       
[ Setup for Reentry Sanity Checks ]


A room has a number called last sanity value.


When play begins:
	repeat with R running through rooms:
		now the last sanity value of R is the sanity level of the player.


Report going to a room (called current room):
	if the sanity level of the player is not the last sanity value of current room:
		say "Something feels off as you step back into [the current room].[line break]";
		now the last sanity value of current room is the sanity level of the player.


A room has a text called sanity-0 description.
A room has a text called sanity-1 description.
A room has a text called sanity-2 description.


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


The sanity-0 description of Observation Ward is "You are in a bleak, colorless void where nothing feels real.".
The sanity-1 description of Observation Ward is "The room appears distorted and hazy, as though viewed through a fog of uncertainty.".
The sanity-2 description of Observation Ward is "Everything seems normal, and the room is as you would expect it to be.".


The sanity-0 description of Dilapidated Hallway is "You are in a bleak, colorless void where nothing feels real.".
The sanity-1 description of Dilapidated Hallway is "The room appears distorted and hazy, as though viewed through a fog of uncertainty.".
The sanity-2 description of Dilapidated Hallway is "Everything seems normal, and the room is as you would expect it to be.".


The sanity-0 description of Holding Cavity is "You are in a bleak, colorless void where nothing feels real.".
The sanity-1 description of Holding Cavity is "The room appears distorted and hazy, as though viewed through a fog of uncertainty.".
The sanity-2 description of Holding Cavity is "Everything seems normal, and the room is as you would expect it to be.".


The sanity-0 description of Synapse Chamber is "You are in a bleak, colorless void where nothing feels real.".
The sanity-1 description of Synapse Chamber is "The room appears distorted and hazy, as though viewed through a fog of uncertainty.".
The sanity-2 description of Synapse Chamber is "Everything seems normal, and the room is as you would expect it to be.".


The sanity-0 description of Sacrifice Hall is "You are in a bleak, colorless void where nothing feels real.".
The sanity-1 description of Sacrifice Hall is "The room appears distorted and hazy, as though viewed through a fog of uncertainty.".
The sanity-2 description of Sacrifice Hall is "Everything seems normal, and the room is as you would expect it to be.".


[ Start Room ]
The description of the Iron Door is
	"Banging continues to radiate from the door. It's a massive iron door centered on the East wall, its surface pitted with age and moisture.  
	Narrow slots around the frame allow a cold draft to slip in. On the other side you can make out a shadow moving.";

The board is a thing in Observation Ward. The board is portable.
The description of the board is "A sturdy plank, slightly worn and covered in mildew by affects of time and moisture.  Maybe you can board up the door."

The jagged knife is a thing in Observation Ward. The jagged knife is portable.
The description of teh jagged knife is "A small uneven blade. Its edge nicked and stained with old rust and a touch of blood. You grip the leather bound handle with ease.".
Understand "knife" as the jagged knife.


Boarding up is an action applying to one thing. Understand "board [something]" or "board up [something]" as boarding up.


instead opening the Iron Door:
	if the Iron Door is unboarded:
		say "A disembodied voice whispers 'Do not open that door ... Board it up ...'";
	if the Iron Door is boarded:
		say "The Iron Door is nailed shut".


Check boarding up:
	if the player does not carry the board:
		say "You need to have a board in your hand in order to board up the door.";
	otherwise:
		say "You firmly nail the board to the Iron Door, reinforcing it, holding back whatever's behind that door, at least for a little longer";
		remove the board from play;
		increase hunter_entrance_delay of the hunter by 4;
		now the Iron Door is boarded;


[ Second Room  ]
The lever is a thing in Dilapidated Hallway.
The lever is portable.
The lever can be attached or detached. The lever is detached.
The description of the lever is
	"A bent metal lever with a smooth wooden handle.  
	It’s clearly meant to latch onto something.";

On the south wall of Holding Cavity is the engraving .  
Understand "runes", "sigils", "carving", "symbols", "wall" as the Engraving.

After going to the Dilapidated Hallway for the first time:
	say "A whispers tells you 'look ...'";

The description of the Engraving is
	"Deeply incised into the stone are interlocking sigils and carved runes.
	A faint, otherworldly glow seeps from the carvings, and the air around you hums with malignant intent."

Check examining the Engraving:
	say "Looking at the engraving makes your head hurt.";
	adjust sanity by 1.

[ Third Room - TODO ]
On the north wall of the Holding Cavity is a painting.  
The painting is a backdrop.  
Understand "painting", "wall", "imagery", "goat" as the painting.

After going to the Holding Cavity for the first time:
	say "'Have you seen the painting' the voice whispers";


The description of the painting is
    "An oil painting of a goat‑headed figure seated upon a jagged throne, horns curling skyward, eyes red.  
    At its feet lie  skulls and flame."
   
check examining the painting:
	say "Looking at the painting makes your head hurt.";
	adjust sanity by 1.


[ Puzzle Room - TODO ]
The wire A is a thing in the Synapse Chamber.
The wire B is a thing in the  Synapse Chamber.
The wire C is a thing in the  Synapse Chamber.
The socket is a thing in the  Synapse Chamber.

The description of wire A is
	"A length of thick copper wire, frayed at one end.  
	You aren’t sure where it goes yet.";

The description of wire B is
	"A thick squirmy wire, its coating chipped in places.  
	It feels slightly warm to the touch.";

The description of wire C is
	"A insulted cable, thicker than the others.  
	When you hold it, you notice a faint hum of energy.";

The description of the socket is
	"A metal socket embedded in the wall, three holes waiting for the correct wiring order.  
	Tiny scorch marks ring its edges.";


The correct_connection_order is a list of things that varies. The correct_connection_order is {wire A, wire C, wire B}.


The current_connection_sequence is a list of things that varies. The current_connection_sequence is {}.


To decide whether (L - a list of things) is_a_prefix of (M - a list of things):
	if the number of entries in L > the number of entries in M, decide on false;
	repeat with I running from 1 to the number of entries in L:
		if entry I of L is not entry I of M, decide on false;
	decide on true.




[ Final Room ]
The description of the Sealed Door is
	"A thick steel door with no visible handles.  
	Deep gouges and scratches cover the door.
	A faint foul odor spills out from the direction of the door";
	
After going to the Sacrifice Hall:
	now the Sealed Door is closed;
	now the Sealed Door is locked;
	say "With a heavy **clang**, the Steel Gate swings shut and locks itself automatically, rattling your head.";
	adjust sanity by -1.


The altar is a thing in Sacrifice Hall.

The description of the altar is
	"A low stone table stained dark with old, crusted fluid and etched with arcane symbols.  
	You sense a heavy weight of ritual here.
	The doctor assures you it's medical standard.";


Laying down on is an action applying to one thing.
Understand "lay down on [something]" as laying down on.
Understand "lay on [something]" as laying down on.


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
	say "You engage the hunter with a desperate charge. In a panic, he fumbles his aim and misses a crucial shot. He swings his shotgun, hitting you in the head. Amidst the chaos, you kill the hunter, stabbing him in the chest.";
	remove the hunter from play;
	now the corpse of the hunter is in the location;
	adjust sanity by -1;



Instead of attacking the doctor:
	say "You lunge at the doctor with fierce determination, but suddenly feel a firm grip from behind. Before you can recover, you are pinned against the table by the doctor, your attack thwarted.";


Instead of attacking yourself:
	adjust sanity by -1;
	say "Your hands shaking, as you attack yourself. ";
	if sanity level of the player is 0:
		say "You start to notice ancient runes covering your body, glowing a crimson red.";
	


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
		now the lever is in the Synapse Chamber.


[ Pulling ]
Understand the command "pull" as something new.
Understand "pull [something]" as pulling


check pulling:
	if the noun  is not the lever:
		say "I'm not sure how to do that ." instead;
	if (current_connection_sequence is_a_prefix of correct_connection_order) and (the number of entries in current_connection_sequence is the number of entries in correct_connection_order):
		say "You pull the lever and the mechanism hums to life. The wires glow with energy. You here something unlock";
		Now the Sealed Door is unlocked;
	else:
		say "You pull the lever, but nothing happens. The wires don't seem to be connected properly."
       
[ talk to ]


Talking to is an action applying to one visible thing.  
Understand "talk to [someone]" as talking to.


Check talking to the hunter:
	if the conversation stage of the hunter is 1:
		say
		    "'This would be easier for me if you didn't face me ...'";
		now the conversation stage of the hunter is 2;
	otherwise if the conversation stage of the hunter is 2:
		say
			    "'Look at yourself ...  Why are you listening to him? ... Snap out of it!' The hunter yells.[line break][line break]'You're going to end the world!'";
		now the conversation stage of the hunter is 3;
	otherwise if the conversation stage of the hunter is 3:
		say
			    "'What do you mean you don't know what's happening? ... Your blood will raise the old gods! Look at your damn arms!' [line break][line break] You look down at your arms, noticing the marks covering your body, glowing red.";
		now the conversation stage of the hunter is 0;
		adjust sanity by -1;
	otherwise:
		say
		    "'...'".
			
Check talking to yourself:
	if the sanity level of the player is 2:
		say "My brain feels foggy";
	if the sanity level of the player is 1:
		say "It's clearing up, but my head still is not right.  And things feel off.";
	if the sanity level of the player is 0:
		say "The pain in my neck and head is gone, but nothing feels right. What happened to the place I was before."
