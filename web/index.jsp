

<%@page import="java.util.ArrayList"%>
<%@page import="Persistente.CarroBD"%>
<%@page import="Dominio.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css">
        <title>Challenge</title>
    </head>
    <body>
        <h1>Challenge Car</h1>
        <%

            Carro cadaCarro = null;
            String id = request.getParameter("id");
            if (id != null) {
                ArrayList<Carro> list = CarroBD.conteudoBD("undefied");

                for (int c = 0; c < list.size(); c++) {
                    cadaCarro = list.get(c);
                    if (cadaCarro.getIdCar() == Integer.parseInt(id)) {
                        break;
                    }
                }

            }
        %>
        <form method="POST" <% if (id != null) {%>action="alterar.jsp"<%} else {%>action="salvar.jsp"<%} %> >
            <input name="modelo" placeholder="Model" <% if (id != null) {%>value="<%= cadaCarro.getModelo()%>"<%}%> required>
            <input name="marca" placeholder="Brand" <% if (id != null) {%>value="<%= cadaCarro.getMarca()%>"<%}%> required>
            <input name="nome" placeholder="Name" <% if (id != null) {%>value="<%= cadaCarro.getNome()%>"<%}%> required>
            <input type="number" name="anoFab" placeholder="Year of fabrication" <% if (id != null) {%>value="<%= cadaCarro.getAnoFab()%>"<%}%>>
            <input type="number" name="preco" placeholder="Price" <% if (id != null) {%>value="<%= cadaCarro.getPreco()%>"<%}%> required>
            <input name="cor" placeholder="Color" <% if (id != null) {%>value="<%= cadaCarro.getCor()%>"<%}%> required>
            <input name="id" type="hidden" <% if (id != null) {%>value="<%= cadaCarro.getIdCar()%>"<%}%>>
            <input type="submit" value="Cadastrar">
            <a id="button" href="listar.jsp">Ver lista</a>
        </form>

    </body>
</html>
