--[[
    Inicio das aulas de programação em Lua.
    +                   = Adição
    -                   = Subitração
    *                   = Multiplicação
    /                   = Divisão
    ..                  = Concatenar ou juntar valores
    =                   = Aplica um valor
    ==                  = Sinal de comparação
    <                   = Menor que
    >                   = Maior que
    <=                  = Menor ou igual
    >=                  = Maior ou igual
    nil                 = significa nulo ou zera os valores dentro da variavel
    tostring()          = voce força uma variaver a trazer o resultado em string
    

    --para dar aspas em um texto dentro da string por exemplo:

    variavel1           = "tampa da caixa d'água?"
    variavel2           = "Você é \"rico""


    --como imprimir um texto usando barra "\" exemplo:
    
    variavel3 = "Voce tem 1\\3 da pizza"


    --tabulação ou parágrafo  e recuo de linha em linha exemplo:

    variavel4 = "\tTabulacao de texto ou \n ponto paragrafo em texto."
    variavel4 = "\rTabulacao de texto ou \n ponto paragrafo em texto."

    --captura de digitação do usuario
    variavel5 = io.read()


]]
--Chamada de arquivos externos.
dofile("variaveis.lua")
dofile("functon.lua")

-- Para exibir corretamente no console
io.stdout:setvbuf("no") 

-- Define o local para português do Brasil
os.setlocale("pt_BR.utf8")


--[[]]
print("\n")

gravardados() -- Chama a função para gravar os dados antes de imprimi-los
clearPreviousLines(20)

MolduraSimp(cAzul, "Dados Cadastrais", cCiano)
MolduraMultiLine(true, cAzul, cCiano, 
    Concat(cPadrao, "Nome: ", cVerde, nome),
    Concat(cPadrao, "Sobrenome: ", cVerde, sobrenome),
    Concat(cPadrao, "Rua: ", cVerde, endereco, cPadrao, " n° ", cVerde, numeroc),
    Concat(cPadrao, "Complemento: ", cVerde, complemento),
    Concat(cPadrao, "Cep: ", cVerde, cep),
    Concat(cPadrao, "Contato: ", cVerde, telefone)
)

copyright()