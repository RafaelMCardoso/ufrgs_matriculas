PosMat<-function(Horav="all",Dia1v=NULL,Dia2v=NULL){
  data<-read.csv("PossibMatric.CSV")
 
  ##cria a variavel d_data que sera aninhada a variavael h_data para mostrar o resultado final   
  ##d_data depende dos valores de Dia1v e Dia2V
  ##Dia2v existe somente quando a cadeira � dividida em 2 dias; portando nunca existira Dia2v se Dia1v for NULL
  if(is.null(Dia2v)){
    d_data<-data[data$Dia1==Dia1v,]
  }
  else{
    d_data<-data[data$Dia1==Dia1v&data$Dia2==Dia2v,]
  }
  
  ##se o horario escolhido for "all", o resultado final ser� todos as cadeira dispon�veis naquele semestre
  if(!Horav=="all"){
    h_data<-d_data[d_data$Horario==Horav,]
  }
    else{
      h_data<-d_data
      message("Mostrando todas as aulas para os dias selecionados")
    }
  print(h_data)
  ##End of fuction
}