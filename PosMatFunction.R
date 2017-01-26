PosMat<-function(Horav="all",Dia1v=NULL,Dia2v=NULL,data=read.csv("PossibMatric.CSV")){
  ##REV-03 <- incluído uma variavel data com default;
  cols<-c("Horario","Dia1","Dia2","Nome.Extenso","Dep","Creditos")
  ##cria a variavel d_data que sera aninhada a variavael h_data para mostrar o resultado final   
  ##d_data depende dos valores de Dia1v e Dia2V
  ##Dia2v existe somente quando a cadeira é dividida em 2 dias; portando nunca existira Dia2v se Dia1v for NULL
  if(is.null(Dia2v)){
    d_data<-data[data$Dia1==Dia1v,]
  }
  else{
    d_data<-data[data$Dia1==Dia1v&data$Dia2==Dia2v,cols]
  }
  
  ##se o horario escolhido for "all", o resultado final será todos as cadeira disponíveis naquele semestre
  if(!Horav=="all"){
    h_data<-d_data[d_data$Horario==Horav,cols]
  }
    else{
      h_data<-d_data[,cols]
      message("Mostrando todas as aulas para o(S) dia(s) selecionado(s)")
    }
  print(h_data)
  ##End of fuction
}

set_turno<-function(Turno){
  data<-read.csv("PossibMatric.CSV")
  
  if(Turno=="M"){
    h_vector<-c("07:30","09:30","11:30")
  }
  else{
    if(Turno=="T"){
      h_vector<-c("13:30","15:30","17:30")
    }
    else{
      if(Turno=="N"){
        h_vector<-c("18:30","20:30")
      }
    }
  
  }
  
}


PosMat_turno<-function(Dia1v=NULL,Turno){
  data<-read.csv("PossibMatric.CSV")

    if(is.null(Dia1v)&(Turno=="M"|Turno=="T"|Turno=="N")){
    message("Turno Válido")
  set_turno(Turno)
  t_data<-data$Horario==h_vector
  sel_class<-data[t_data,c("Horario","Dia1","Dia2","Dep","Nome.Extenso")]
  }
  else{
    message("Turno Selecionado Inválido")
  set_turno(Turnov)
      d_data<-data["Dia1"==Dia1v,]
      t_data<-d_data$Horario==h_vector
      sel_class<-d_data[t_data,c("Horario","Dia1","Dia2","Dep","Nome.Extenso")]
  }
  
}
