script_name("ColeteMenu")
script_author("SeuNome")

require "sampfuncs"
require "samp"

local menuAtivo = false

function main()
    while not isSampAvailable() do wait(100) end
    sampRegisterChatCommand("c", abrirMenu)
end

function abrirMenu()
    if not menuAtivo then
        menuAtivo = true
        sampShowDialog(1, "Menu de Colete", "Deseja pegar um colete?", "Sim", "Não", 0)
    end
end

function onDialogResponse(dialogId, button, listItem, inputText)
    if dialogId == 1 then
        if button == 1 then -- Se o jogador apertar "Sim"
            givePlayerArmor()
        end
        menuAtivo = false
    end
end

function givePlayerArmor()
    local player = getCharPointer(PLAYER_PED)
    if player then
        setCharArmour(PLAYER_PED, 100) -- Dá 100 de colete
        sampAddChatMessage("✅ Você pegou um colete!", -1)
    else
        sampAddChatMessage("❌ Erro ao pegar o colete!", -1)
    end
end
