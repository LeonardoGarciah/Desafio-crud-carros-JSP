<%@page import="Persistente.CarroBD"%>
<%
  
  String id = request.getParameter("id");
  CarroBD.excluir(id);
  response.sendRedirect("listar.jsp");
  
%>