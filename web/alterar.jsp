<%@page import="Persistente.CarroBD"%>
<%
    String id = request.getParameter("id");
    String nome = request.getParameter("nome");
    String modelo = request.getParameter("modelo");
    String marca = request.getParameter("marca");
    String preco = request.getParameter("preco");
    String anoFab = request.getParameter("anoFab");
    String cor = request.getParameter("cor");
    int anoFabi = Integer.parseInt(anoFab);
    Double precoD = Double.parseDouble(preco);
    try {
    CarroBD.alterar(id, nome, modelo, marca, cor, anoFabi, precoD);
            
        } catch (Exception e) {
            out.print(e);
        }
    response.sendRedirect("listar.jsp");
%>
