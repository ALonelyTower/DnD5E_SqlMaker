USE DnD5_Spells;

INSERT INTO Class (class_Name) VALUES ("Barbarian");
INSERT INTO Class (class_Name) VALUES ("Bard");
INSERT INTO Class (class_Name) VALUES ("Druid");
INSERT INTO Class (class_Name) VALUES ("Fighter");
INSERT INTO Class (class_Name) VALUES ("Monk");
INSERT INTO Class (class_Name) VALUES ("Rogue");
INSERT INTO Class (class_Name) VALUES ("Sorceror");
INSERT INTO Class (class_Name) VALUES ("Warlock");
INSERT INTO Class (class_Name) VALUES ("Wizard");

INSERT INTO Component (component_Name, component_AbbreviatedName) VALUES ("Somatic", "S");
INSERT INTO Component (component_Name, component_AbbreviatedName) VALUES ("Verbal", "V");
INSERT INTO Component (component_Name, component_AbbreviatedName) VALUES ("Material", "M");

INSERT INTO SpellSchool (spellSchool_Name) VALUES ("Abjuration")
INSERT INTO SpellSchool (spellSchool_Name) VALUES ("Conjuration")
INSERT INTO SpellSchool (spellSchool_Name) VALUES ("Divination")
INSERT INTO SpellSchool (spellSchool_Name) VALUES ("Enchantment")
INSERT INTO SpellSchool (spellSchool_Name) VALUES ("Evocation")
INSERT INTO SpellSchool (spellSchool_Name) VALUES ("Illusion")
INSERT INTO SpellSchool (spellSchool_Name) VALUES ("Necromancy")
INSERT INTO SpellSchool (spellSchool_Name) VALUES ("Transmutation")

INSERT INTO CastingTime (castingTime_Metric, castingTime_Count) VALUES ("Instantaneous", 1)
INSERT INTO CastingTime (castingTime_Metric, castingTime_Count) VALUES ("Reaction", 1)
INSERT INTO CastingTime (castingTime_Metric, castingTime_Count) VALUES ("Bonus Action", 1)
INSERT INTO CastingTime (castingTime_Metric, castingTime_Count) VALUES ("Action", 1)
INSERT INTO CastingTime (castingTime_Metric, castingTime_Count) VALUES ("Minute", 1)
INSERT INTO CastingTime (castingTime_Metric, castingTime_Count) VALUES ("Minute", 10)
INSERT INTO CastingTime (castingTime_Metric, castingTime_Count) VALUES ("Hour", 1)
INSERT INTO CastingTime (castingTime_Metric, castingTime_Count) VALUES ("Hour", 8)
INSERT INTO CastingTime (castingTime_Metric, castingTime_Count) VALUES ("Hour", 24)
