CREATE DATABASE IF NOT EXISTS DnD5_Spells;

USE DnD5_Spells;

DROP TABLE IF EXISTS Class;

CREATE TABLE Class (
	class_ID INTEGER AUTO_INCREMENT,
	class_Name CHAR(20) NOT NULL,
	CONSTRAINT ClassPK PRIMARY KEY (class_ID)
);

DROP TABLE IF EXISTS Component;

CREATE TABLE Component (
	component_ID INTEGER AUTO_INCREMENT,
	component_Name CHAR(16) NOT NULL,
	component_AbbreviatedName CHAR(2) NOT NULL,
	CONSTRAINT ComponentPK PRIMARY KEY (component_ID)	
);

DROP TABLE IF EXISTS SpellSchool;

CREATE TABLE SpellSchool (
	spellSchool_ID INTEGER AUTO_INCREMENT,
	spellSchool_Name CHAR(20) NOT NULL
);

DROP TABLE IF EXISTS CastingTime;

CREATE TABLE CastingTime (
	castingTime_ID INTEGER AUTO_INCREMENT,
	castingTime_Metric CHAR(24),
	castingTime_Count INTEGER
);

DROP TABLE IF EXISTS Spell;

CREATE TABLE Spell (
	spell_ID INTEGER AUTO_INCREMENT,
	spell_Name CHAR(40) NOT NULL,
	spell_Level INTEGER NOT NULL,
	spellSchool_ID INTEGER NOT NULL,
	spell_CastRangeInFeet INTEGER NOT NULL,
	spell_CastingTime_ID INTEGER NOT NULL,
	spell_Duration_ID INTEGER NOT NULL,
	spell_ConcentrationFlag BOOLEAN NOT NULL,
	spell_RitualFlag BOOLEAN NOT NULL,
	spell_LineOfSight BOOLEAN NOT NULL,
	spell_Description CHAR(1000) NOT NULL,
	CONSTRAINT SpellPK PRIMARY KEY (spell_ID),
	CONSTRAINT SchoolFK FOREIGN KEY (spellSchool_ID)
		REFERENCES SpellSchool (spellSchool_ID)
);

DROP TABLE IF EXISTS ClassSpell;

CREATE TABLE ClassSpell (
	classSpell_ID INTEGER AUTO_INCREMENT,
	class_ID INTEGER NOT NULL,
	spell_ID INTEGER NOT NULL,
	CONSTRAINT ClassSpellPK PRIMARY KEY (classSpell_ID),
	CONSTRAINT ClassFK FOREIGN KEY (class_ID)
		REFERENCES Class (class_ID),
	CONSTRAINT SpellFK FOREIGN KEY (spell_ID)
		REFERENCES Spell (spell_ID)
);

DROP TABLE IF EXISTS SpellComponent;

CREATE TABLE SpellComponent (
	spellComponent_ID INTEGER AUTO_INCREMENT,
	spell_ID INTEGER NOT NULL,
	component_ID INTEGER NOT NULL,
	CONSTRAINT SpellComponentPK PRIMARY KEY (spellComponent_ID),
	CONSTRAINT SpellFK FOREIGN KEY (spell_ID)
		REFERENCES Spell (spell_ID),
	CONSTRAINT ComponentFK FOREIGN KEY (component_ID)
		REFERENCES Component (component_ID)
);