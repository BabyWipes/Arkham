Arkham Horror
================

Source breakdown
---
```
ArkhamHorror-core - platform agnostic code
	LIB
		PESGraph - provides node based graph building, route finding, and distance finding for the game board

	Categories - categories are an Obj-C concept to add methods (not properties/fields) to existing classes for convenience
		NSMutableArray+Deck - added deck like behavior to mutable arrays, such as drawing and discarding to the bottom

	Utils
		MFJSONObject - "magic" base class to allow rapid packing on unpacking of objects to json and back. it's usage isn't speed optimized, but it makes for much simpler/less error prone code
		SetupUtils - generates / resets the gigantic JSON doc that lives in ~/Documents/ArkhamHorror/. this doc contains all the game data, and can be editted to add extra characters,monsters,etc
		Defines - i used a lot of typedef'ed enums, they're almost all here
		JSTest - an experiment in running arbitrary strings of JS against code objects at runtime. the idea is to add strings of JS to the settings json doc to make monster abilities modular
		PathFinder - implementation of the PESGraph lib
		SettingsManager - generic file I/O management for the settings files manipulated by setup utils
		Macros - almost all project macros, macros and enums which aren't patform agnostic live in their target. macros are basic string substitution for easy breezy and dangerous coding
		GameEventDelegate - mostly unused interface pattern for game items to listen for global events
		ArkhamHorrorUIAPI - defines how the core communicates with an implementation. has lots of typedef'ed blocks

	Movable - base class for all objects which can take up space on the board and move around (Monsters + Players)
	Investigator - model for a player, .h file has notes

	Bad Guys
		Ancient One - model for Boss Monsters
		Monster - model for Monsters
		Dimension - object wrapper around MonsterMovementDimension enum

	Cards
		Card - base class for all cards
		Item - model for all items which a player can have in their inventory. could be split into more distinct classes
		Ally - model for Allies
		Skill - model for Skills
		Mythos
			Mythos - base class for Mythoi, .h includes mythos notes
			HeadlineMythos - model for headline mythoi
			EnvironmentMythos - model for environment mythoi
			RumorMythos - model for rumor mythoi

	Locations
		Location - model for a location (an area where a player can occupy)
		Neighborhood - model for a Neighborhood (a collection of locations)
		OtherWorld - an area a player can occupy via portal

	Game - encapsulates the state machine that is the game of arkham horror, a singleton instance of the currently running game

ArkhamHorror-CLI - CLI specific code
	ArkhamHorrorCLI.m - contains all the code for running the Game state machine, reading and writing to the console, and processing the events queue

ArhkamHorror-iOS - iOS specific code, largely untouched, don't bother with this for now
ArkhamHorrorTests - unused unit testing target files
Products - symlink to destination folder for compiled binaries, don't touch
```
How it works
---
The game is a state machine, which constantly loops between the game phases. on executing a phase, if it requires user interaction or otherwise asynchronous interaction, it will either enqueue or push a game event onto the uidelegate's event queue. After a phase has been completed, the uidelegate will resolve the events in order, calling the callback associated with each event on the caller's thread. once all events have been proccessed, the Game will then make another pass at the game loop. the game itself will decide when it needs to advance or mutate state. UI delegates are only responsible for displaying information to a user or getting information out of a user and passing it along. it would make sense to make most game events enqueable to accomodate for animations and etc.
	