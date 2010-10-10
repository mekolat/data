----------------------------------------------------------------------------------
-- Map File                                                                     --
--                                                                              --
-- In dieser Datei stehen die entsprechenden externen NPC's, Trigger und        --
-- anderer Dinge.                                                               --
--                                                                              --
----------------------------------------------------------------------------------
--  Copyright 2010 The Invertika Development Team                               --
--                                                                              --
--  This file is part of Invertika.                                             --
--                                                                              --
--  Invertika is free software; you can redistribute it and/or modify it        --
--  under the terms of the GNU General  Public License as published by the Free --
--  Software Foundation; either version 2 of the License, or any later version. --
----------------------------------------------------------------------------------


require "scripts/lua/npclib"
require "scripts/ivklibs/invertika"

atinit(function()
 create_npc("Irdath", 89, 35 * TILESIZE + 16, 44 * TILESIZE + 16, tano1_talk, npclib.walkaround_small) --- Ta No 1 (Ta No am Eingang)
 wache = create_npc("Rhaor", 91, 42 * TILESIZE + 16, 36 * TILESIZE + 16, tano2_talk, nil) --- Ta No 2 (Schatzkammer Wächter)
 create_npc("Karl", 92, 25 * TILESIZE + 16, 41 * TILESIZE + 16, tano3_talk, nil) --- Ta No 3 (Verkäufer)
 create_npc("Samos", 93, 67 * TILESIZE + 16, 14 * TILESIZE + 16, tano4_talk, nil) --- Ta No 4 (Sektenführer)
 
 mana.trigger_create(42 * TILESIZE, 36 * TILESIZE, 64, 64, "treasure_trap", 0, true)
 mana.trigger_create(39 * TILESIZE, 36 * TILESIZE, 96, 96, "treasure_warning", 0, true)
end)

function tano1_talk(npc, ch)
    do_message(npc, ch, invertika.get_random_element("Geh doch mal zu Samos, der hat bestimmt einen Auftrag für dich.",
      "Im Laden kannst du erst etwas kaufen, wenn du dir Reputation bei uns erworben hast.",
      "Was das hier ist? Natürlich das Hauptquartier der Ta No!",
      "Unsere Ziele? Die sind geheim!"))
    do_npc_close(npc, ch)
end

function tano2_talk(npc, ch)
    do_message(npc, ch, invertika.get_random_element("Ich passe auf, dass niemand so ohne weiteres in die Schatzkammer geht.",
      "Versuche gar nich erst, etwas zu stehlen!",
      "Über der Schatzkammer hängt ein Schutzzauber.",
      "NEIN, du darfst NICHT in die Schatzkammer."))
    do_npc_close(npc, ch)
end

function tano3_talk(npc, ch)
    do_message(npc, ch, "Ich werde irgendwann mal Waffen und Ausrüstung verkaufen und so.")
    do_npc_close(npc, ch)
end

function tano4_talk(npc, ch)
    do_message(npc, ch, "Ich soll irgendwann mal Quests vergeben, mit denen die Reputation bei den Ta No gesteigert werden kann.")
    do_npc_close(npc, ch)
end

function treasure_trap(being)
  if (mana.being_type(being) == TYPE_CHARACTER) then --- Nur Spieler beachten
    mana.being_say(wache, invertika.get_random_element("Wer nicht hören will muss fühlen.",
      "Kein Durchgang!",
      "Du darfst hier nicht durch!",
      "Draußen bleiben!",
      "Zutritt verboten!",
      "Hier darf keiner durch!"))
    mana.chr_warp(being, mana.get_map_id(), 40 * TILESIZE + 16, 37 * TILESIZE + 16)
    mana.being_damage(being, 50, 40, 100, 1, 0)
  end
end

function treasure_warning(being)
  if (mana.being_type(being) == TYPE_CHARACTER) then --- Nur Spieler beachten
    mana.being_say(wache, invertika.get_random_element("Keinen Schritt weiter!",
      "Stopp! Sonst wird es schmerzhaft.",
      "Halt!"))
  end
end
