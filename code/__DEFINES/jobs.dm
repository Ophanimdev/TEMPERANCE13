
#define ENGSEC			(1<<0)

#define CAPTAIN			(1<<0)
#define HOS				(1<<1)
#define WARDEN			(1<<2)
#define DETECTIVE		(1<<3)
#define OFFICER			(1<<4)
#define CHIEF			(1<<5)
#define ENGINEER		(1<<6)
#define ATMOSTECH		(1<<7)
#define ROBOTICIST		(1<<8)
#define AI_JF			(1<<9)
#define CYBORG			(1<<10)


#define MEDSCI			(1<<1)

#define RD_JF			(1<<0)
#define SCIENTIST		(1<<1)
#define CHEMIST			(1<<2)
#define CMO_JF			(1<<3)
#define DOCTOR			(1<<4)
#define GENETICIST		(1<<5)
#define VIROLOGIST		(1<<6)


#define CIVILIAN		(1<<2)

#define HOP				(1<<0)
#define BARTENDER		(1<<1)
#define BOTANIST		(1<<2)
//#define COOK			(1<<3) //This is redefined below, and is a ss13 leftover.
#define JANITOR			(1<<4)
#define CURATOR			(1<<5)
#define QUARTERMASTER	(1<<6)
#define CARGOTECH		(1<<7)
//#define MINER			(1<<8) //This is redefined below, and is a ss13 leftover.
#define LAWYER			(1<<9)
#define CHAPLAIN		(1<<10)
#define CLOWN			(1<<11)
#define MIME			(1<<12)
#define ASSISTANT		(1<<13)

#define JOB_AVAILABLE 0
#define JOB_UNAVAILABLE_GENERIC 1
#define JOB_UNAVAILABLE_BANNED 2
#define JOB_UNAVAILABLE_PLAYTIME 3
#define JOB_UNAVAILABLE_ACCOUNTAGE 4
#define JOB_UNAVAILABLE_PATRON 5
#define JOB_UNAVAILABLE_RACE 6
#define JOB_UNAVAILABLE_SEX 7
#define JOB_UNAVAILABLE_AGE 8
#define JOB_UNAVAILABLE_WTEAM 9
#define JOB_UNAVAILABLE_LASTCLASS 10
#define JOB_UNAVAILABLE_JOB_COOLDOWN 11
#define JOB_UNAVAILABLE_SLOTFULL 12
#define JOB_UNAVAILABLE_VIRTUESVICE 13

#define DEFAULT_RELIGION "Christianity"
#define DEFAULT_DEITY "Space Jesus"

#define JOB_DISPLAY_ORDER_DEFAULT 0

#define JOB_DISPLAY_ORDER_ASSISTANT 1
#define JOB_DISPLAY_ORDER_CAPTAIN 2
#define JOB_DISPLAY_ORDER_HEAD_OF_PERSONNEL 3
#define JOB_DISPLAY_ORDER_QUARTERMASTER 4
#define JOB_DISPLAY_ORDER_CARGO_TECHNICIAN 5
#define JOB_DISPLAY_ORDER_SHAFT_MINER 6
#define JOB_DISPLAY_ORDER_BARTENDER 7
#define JOB_DISPLAY_ORDER_COOK 8
#define JOB_DISPLAY_ORDER_BOTANIST 9
#define JOB_DISPLAY_ORDER_JANITOR 10
#define JOB_DISPLAY_ORDER_CLOWN 11
#define JOB_DISPLAY_ORDER_MIME 12
#define JOB_DISPLAY_ORDER_CURATOR 13
#define JOB_DISPLAY_ORDER_LAWYER 14
#define JOB_DISPLAY_ORDER_CHAPLAIN 15
#define JOB_DISPLAY_ORDER_CHIEF_ENGINEER 16
#define JOB_DISPLAY_ORDER_STATION_ENGINEER 17
#define JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN 18
#define JOB_DISPLAY_ORDER_CHIEF_MEDICAL_OFFICER 19
#define JOB_DISPLAY_ORDER_MEDICAL_DOCTOR 20
#define JOB_DISPLAY_ORDER_CHEMIST 21
#define JOB_DISPLAY_ORDER_GENETICIST 22
#define JOB_DISPLAY_ORDER_VIROLOGIST 23
#define JOB_DISPLAY_ORDER_RESEARCH_DIRECTOR 24
#define JOB_DISPLAY_ORDER_SCIENTIST 25
#define JOB_DISPLAY_ORDER_ROBOTICIST 26
#define JOB_DISPLAY_ORDER_HEAD_OF_SECURITY 27
#define JOB_DISPLAY_ORDER_WARDEN 28
#define JOB_DISPLAY_ORDER_DETECTIVE 29
#define JOB_DISPLAY_ORDER_SECURITY_OFFICER 30
#define JOB_DISPLAY_ORDER_AI 31
#define JOB_DISPLAY_ORDER_CYBORG 32

#define NOBLEMEN		(1<<0)

#define LORD		(1<<0)
#define LADY		(1<<1)
#define HAND		(1<<2)
#define STEWARD		(1<<3)
#define KNIGHT		(1<<4)
#define GUARD_CAPTAIN		(1<<5)
#define MARSHAL		(1<<6)
#define HOSTAGE		(1<<7)
#define SUITOR		(1<<8)

#define GARRISON		(1<<1)

#define GUARDSMAN	(1<<0)
#define MANATARMS	(1<<1)
#define DUNGEONEER	(1<<2)
#define SQUIRE		(1<<3)
#define BOGGUARD	(1<<4)
#define SERGEANT	(1<<5)
#define SHERIFF		(1<<6)

#define CHURCHMEN		(1<<2)

#define PRIEST		(1<<0)
#define MONK		(1<<1)
#define GRAVEDIGGER	(1<<2)
#define DRUID		(1<<3)

#define COURTIERS	(1<<3)

#define JESTER		(1<<0)
#define WIZARD		(1<<1)
#define PHYSICIAN 	(1<<2)
#define BUTLER		(1<<3)
#define COUNCILLOR	(1<<4)

#define YEOMEN		(1<<4)

#define BARKEEP		(1<<0)
#define ARCHIVIST	(1<<1)
#define ALCHEMIST	(1<<5)
#define MERCHANT	(1<<8)
#define SCRIBE		(1<<9)
#define ELDER		(1<<10)

#define PEASANTS	(1<<5)

#define HUNTER		(1<<0)
#define FARMER		(1<<1)
#define BUTCHER		(1<<2)
#define FISHER		(1<<3)
#define LUMBERJACK	(1<<4)
#define MINER		(1<<5)
#define COOK		(1<<6)
#define KNAVEWENCH (1<<7)
#define GRABBER		(1<<8)
#define NITEMASTER	(1<<9)
#define WENCH		(1<<10)
#define BEGGAR		(1<<11)
#define ADVENTURER	(1<<12)
#define PILGRIM		(1<<13)
#define VILLAGER	(1<<14)
#define PRISONERR	(1<<15)
#define PRISONERB	(1<<16)
#define LUNATIC		(1<<17)
#define MIGRANT		(1<<18)
#define BANDIT		(1<<19)
#define COURTAGENT	(1<<20)
#define WRETCH		(1<<21)

#define YOUNGFOLK	(1<<6)

#define APPRENTICE	(1<<0)
#define CHURCHLING	(1<<1)
#define SERVANT		(1<<2)
#define ORPHAN		(1<<3)
#define PRINCE		(1<<4)
#define SHOPHAND	(1<<5)
#define CLERK 		(1<<6)
#define MAGEAPPRENTICE	(1<<7)
#define APOTHECARY	(1<<8)

#define MERCENARIES		(1<<7)

#define VETERAN			(1<<1)
#define MERCENARY		(1<<2)
#define DESERT_RIDER	(1<<3)	//Unused
#define GRENZELHOFT		(1<<4)	//Unused


#define TRIBAL		(1<<8)

#define CHIEFTAIN	(1<<0)
#define TRIBALCOOK	(1<<1)
#define TRIBALGUARD	(1<<2)
#define TRIBALSMITH	(1<<3)

#define SLOP		(1<<9)

#define TESTER		(1<<0)
#define DEATHKNIGHT (1<<1)
#define SKELETON	(1<<2)
#define GOBLIN		(1<<3)

#define INQUISITION (1<<10)

#define PURITAN		(1<<0)
#define ORTHODOXIST	(1<<1)

#define GUILDSMEN	(1<<11)
#define GUILDMASTER (1<<1)
#define GUILDSMAN  	(1<<2)
#define TAILOR		(1<<3)

#define PERSERDUN	(1<<12)

#define GRANDMASTER	(1<<0) // no-armor leadership wimp w/ drip
#define GRANDKNIGHT (1<<1) // heaviest armor in the game - very tanky - melee only - consider adding a shield
#define KNIGHTCOMMANDER (1<<2) //better armor + sawn down lever-action & a sword
#define AUXILIARIST	(1<<3) //support role - same w/ servico
#define ARMSMAN	(1<<4) //standard soldier w/ a rifle
#define CHIRURGEON (1<<5)
#define PARTISAN (1<<6)
#define ENVOY (1<<7)

#define RISVON	(1<<13)

#define COMMANDANT (1<<0) //1 slot leadership. probably has a heavy smg & great light armor
#define OFICIRO (1<<1) //sniper? maybe a semi-auto rifle? + grenades?
#define VETERANO (1<<2) //veteran w/ a shotgun & grenades instead of a pistol & net
#define SOLDATO	(1<<3) //standard soldier - high speed, low armor, net + pistol
#define SERVISTO (1<<4) //support role - can probably shit meds out the wazoo 
#define CURACISTO (1<<5)
#define CAMPFOLLOWER (1<<6)
#define CONSULO (1<<7)

#define KINGSROW (1<<14)

#define HIERARCH (1<<0)
#define BULWARK (1<<2)
#define PROVISIONER (1<<3)
#define MORTICIAN (1<<4)
#define TOWNER (1<<5)

#define JCOLOR_NOBLE "#aa83b9"
#define JCOLOR_COURTIER "#81adc8"
#define JCOLOR_CHURCH "#c0ba8d"
#define JCOLOR_SOLDIER "#b18484"
#define JCOLOR_YEOMAN "#819e82"
#define JCOLOR_GUILD "#6e6259"
#define JCOLOR_PEASANT "#b09262"
#define JCOLOR_MERCENARY "#c86e3a"
#define JCOLOR_INQUISITION "#FF0000"
#define JCOLOR_PERSERDUN "#52488b"
#define JCOLOR_RISVON "#913333"
#define JCOLOR_KINGSROW "#31437c"

// job display orders //

// PERSERDUN
#define JDO_GRANDMASTER 1
#define JDO_GRANDKNIGHT 1.1
#define JDO_KNIGHTCOMMANDER 1.2
#define JDO_AUXILIARIST 1.3
#define JDO_ARMSMAN 1.4
#define JDO_CHIRURGEON 1.5
#define JDO_PARTISAN 1.6
#define JDO_ENVOY 1.7

// RISVON
#define JDO_COMMANDANT 2
#define JDO_OFICIRO 2.1
#define JDO_VETERANO 2.2
#define JDO_SOLDATO 2.3
#define JDO_SERVISTO 2.4
#define JDO_CURACISTO 2.5
#define JDO_CAMPFOLLOWER 2.6
#define JDO_CONSULO 2.7

// KINGSROW
#define JDO_HIERARCH 3
#define JDO_BULWARK 3.1
#define JDO_PROVISIONER 3.2
#define JDO_MORTICIAN 3.3
#define JDO_TOWNER 3.4

#define PERSERDUN_ROLES \
	/datum/job/roguetown/grandmaster,\
	/datum/job/roguetown/grandknight,\
	/datum/job/roguetown/knightcommander,\
	/datum/job/roguetown/auxiliar,\
	/datum/job/roguetown/armsman,\
	/datum/job/roguetown/chirurgeon,\
	/datum/job/roguetown/partisan,\
	/datum/job/roguetown/envoy

#define RISVON_ROLES \
	/datum/job/roguetown/commandant,\
	/datum/job/roguetown/officaro,\
	/datum/job/roguetown/veterano,\
	/datum/job/roguetown/soldato,\
	/datum/job/roguetown/servicus,\
	/datum/job/roguetown/curacisto,\
	/datum/job/roguetown/campfollower,\
	/datum/job/roguetown/consulo
