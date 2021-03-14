let
    // Selecionado o arquivo.
    Source = Excel.Workbook(File.Contents("[incluir aqui o enderelo do arquivo no seu computador]\dicionario_dados.xlsx"), null, true),
    // Selecionado a planilha dentro do arquivo.
    Planilha1_Sheet = Source{[Item="Planilha1",Kind="Sheet"]}[Data],
    // Primeira linha promovida como cabeçalho.
    #"Promoted Headers" = Table.PromoteHeaders(Planilha1_Sheet, [PromoteAllScalars=true]),
    // Tipos de dados definidos.
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"nome_variavel", type text}, {"descricao", type text}, {"tipo_dado", type text}, {"tamanho", Int64.Type}, {"tipo_variavel", type text}, {"tipo_mensuaracao", type text}, {"valores_possiveis", type text}})
in
    #"Changed Type"
