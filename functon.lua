--Chamada de arquivos externos.
dofile("variaveis.lua")

function clearPreviousLines(numLines)
    for i = 1, numLines do
        io.write('\027[F\027[K') -- Move o cursor para cima e limpa a linha atual
    end
end
function getTerminalWidth()
    local handle = io.popen("mode CON", 'r')
    local result = handle:read("*a")
    handle:close()

    local width = tonumber(string.match(result, "Columns:%s*(%d+)"))
    return width or 80  -- Retorna 80 como largura padrão se não conseguir obter a largura do terminal
end
function centerText(text, width)
    local padding = math.floor((width - #text) / 2)
    local centeredText = string.rep(" ", padding) .. text
    return centeredText
end
function printCenteredAndClearPreviousLines(text)
    local terminalWidth = getTerminalWidth() + 50
    local centeredText = centerText(text, terminalWidth)
    local numLines = math.ceil(#centeredText / terminalWidth)
    --clearPreviousLines(numLines)
    print(centeredText)
end
function printCentered(text)
    local screenWidth = getTerminalWidth() + 50 -- Largura padrão, você pode ajustar conforme necessário
    local padding = math.floor((screenWidth - string.len(text)) / 2)
    local centeredText = string.rep(" ", padding) .. text

    print(centeredText)
end
function printsCentered(text)
    local screenWidth = getTerminalWidth() + 50 -- Largura padrão, você pode ajustar conforme necessário
    local textLength = string.len(text)
    local padding = math.floor((screenWidth - textLength) / 2)

    -- Limpa as linhas anteriores antes de imprimir o texto centralizado
    clearPreviousLines(math.ceil(textLength / screenWidth))

    -- Imprime o texto centralizado com o padding calculado
    io.write(string.rep(" ", padding) .. text .. '\n')
end
function gravardados()
    print("Qual seu primeiro nome?")
    nome = io.read()
    print("Qual seu sobrenome?")
    sobrenome = io.read()
    clearPreviousLines(20)
    print("Qual seu endereço?")
    endereco = io.read()
    print("Qual número da casa ou apartamento?")
    numeroc = io.read()
    clearPreviousLines(20)
    print("Possui complemento?")
    complemento = io.read()
    print("Qual seu cep?")
    cep = io.read()
    clearPreviousLines(20)
    print("Qual seu numero para contato?")
    telefone = io.read()
end
function clearPreviousLines(numLines)
    for i = 1, numLines do
        io.write('\027[F\027[K') -- Move o cursor para cima e limpa a linha atual
    end
end
function MolduraSimp(corMold, text, corTitle)
    length = string.len(text)
    topBottom = corMold .. "+" .. string.rep("-", length + 2) .. "+" .. cPadrao
    middle = corMold .. "               | " .. corTitle .. text .. cPadrao .. corMold .. " |" .. cPadrao

    printCenteredAndClearPreviousLines(topBottom)
    printCenteredAndClearPreviousLines(middle)
    printCenteredAndClearPreviousLines(topBottom)
end
function MolduraMultiLine(verdade, corMold, corTitle, ...)
    local args = {...}
    local maxLength = 0  -- Comprimento máximo da linha

    -- Encontrar o comprimento máximo    
    for _, v in ipairs(args) do
        maxLength = math.max(maxLength, string.len(v))
    end

    -- Linha superior da moldura
    local topBottom = corMold .. "+" .. string.rep("-", maxLength + 6) .. "+" .. cPadrao

    -- Imprimir a linha superior
    if verdade then
        printCenteredAndClearPreviousLines(topBottom)
    else
        printCentered("   " .. topBottom)
    end
    
    

    -- Imprimir cada linha do texto dentro da moldura
    for _, line in ipairs(args) do
        local padding = maxLength - string.len(line)
        local spaces = string.rep(" ", padding)
        local middle = corMold .. "     " .. corTitle .. line .. spaces .. " " .. cPadrao
        if verdade then
            printCenteredAndClearPreviousLines(middle)
        else
            printCentered(middle)
        end
    end

    -- Imprimir a linha inferior da moldura
    if verdade then
        printCenteredAndClearPreviousLines(topBottom)
    else
        printCentered(topBottom)
    end
end
function copyright() -- Imprime o Copyright
    print("\n\nCopyright" .. cVerde .. "©" .. cPadrao .. " 2024 by: PierreMoraes " .. cCiano .. _VERSION)
end
function Multip(var1, var2)
    return var1 * var2
end
function Soma(var1, var2)
    return var1 + var2
end
function Subtr(var1, var2)
    return var1 - var2
end
function Divis(var1, var2)
    return var1 / var2
end
function Concat(...)
    local args = {...}
    local result = ""
    for _, v in ipairs(args) do
        result = result .. v
    end
    return result
end









