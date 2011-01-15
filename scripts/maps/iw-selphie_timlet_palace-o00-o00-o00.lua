----------------------------------------------------------------------------------
-- Map File                                                                     --
--                                                                              --
-- In dieser Datei stehen die entsprechenden externen NPC's, Trigger und        --
-- anderer Dinge.                                                               --
--                                                                              --
----------------------------------------------------------------------------------
--  Copyright 2008 The Invertika Development Team                               --
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
 create_npc("Luor", 20, 34 * TILESIZE + 16, 24 * TILESIZE + 16, luor_talk, nil) --- Luor
 create_npc("Krenel", 54, 41 * TILESIZE + 16, 56 * TILESIZE + 16, krenel_talk, nil) --- Krenel
end)

function luor_talk(npc, ch)
    if mana.chr_inv_count(ch, 40027) == 1 then
        do_message(npc, ch, "Ein Brief? Gib her!")
        mana.chr_inv_change(ch, 40027, -1)
        do_message(npc, ch, "*Grübel* Das sind schlechte Neuigkeiten...")
        do_message(npc, ch, "Danke, dass du mir den Brief gebracht hast. Nimm diese VIP-Eintrittskarte für die Arena als Dank!")
        mana.chr_inv_change(ch, 40026, 1)
        mana.chr_set_quest(ch, "selphi_timlet_chodar_quest", 4)
    elseif tonumber(get_quest_var(ch, "selphi_timlet_chodar_quest")) >= 4 then
        do_message(npc, ch, "Danke für den Brief aber jetzt muss ich arbeiten!")
    else
        do_message(npc, ch, "Sei gegrüßt, ich bin Luor, Herscher über Selphi Timlet, Bewahrer des Heiligen Kelches von Rixx. Wie lautet deine Bitte? - Obwohl lieber nicht, im Moment steht es mir nicht nach einer Audienz.")

    end
    do_npc_close(npc, ch)
end

function krenel_talk(npc, ch)
    				do_message(npc, ch, invertika.get_random_element("Wir müssen Aktivität vortäuschen...",
	  "Aktivität simulieren... Also steh hier nicht rum. Los hop hop!",
	  "Ich täusche Aktivität vor, also schau nicht so und mache das gleiche.",
	  "Wenn wir das nicht tun ist alles zu spät.",
	  "Das ganze Invertika Team macht das so... aber psssst..."))
	do_npc_close(npc, ch)
end
