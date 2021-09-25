<%@page import="Persistente.CarroBD"%>
<%@page import="Dominio.Carro"%>
<%
 String nome = request.getParameter("nome");
 String modelo = request.getParameter("modelo");
 String marca = request.getParameter("marca");
 String preco = request.getParameter("preco");
 String anoFab = request.getParameter("anoFab");
 String cor = request.getParameter("cor");
 int idCar = 0;
 Double precoD =  Double.parseDouble(preco);
 int anoFabI = Integer.parseInt(anoFab);
 Carro car = new Carro(idCar, marca,modelo,cor,nome,anoFabI,precoD);
 CarroBD.inserir(car);
 response.sendRedirect("listar.jsp");
%>