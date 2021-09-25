

<%@page import="java.util.ArrayList"%>
<%@page import="Dominio.Carro"%>
<%@page import="Persistente.CarroBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style2.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <title>Carros</title>
    </head>
    <body>
        <h1>List of cars</h1>
        <a id="new" href="index.jsp" >New car</a>
        <form id="search" action="" method="POST">
            <input type="text" placeholder="Search model" name="search">
            <input type="submit" value="Search">
        </form>
        <table width=100%>
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Cor</th>
                    <th>Preco</th>
                    <th>Ano Fabricacao</th>
                </tr>
            </thead>
            <%  
                String modelo;
                ArrayList<Carro> carlist;
                modelo = request.getParameter("search");
                if(modelo == null){
                modelo = "undefied";
                
                }

                    carlist = CarroBD.conteudoBD(modelo);
                for (int c = 0; c < carlist.size(); c++) {
                    Carro cadaCarro = carlist.get(c);

            %>
            <tr id="tr">
                <td><%= cadaCarro.getNome()%></td>
                <td><%= cadaCarro.getMarca()%></td>
                <td><%= cadaCarro.getModelo()%></td>
                <td><%= cadaCarro.getCor()%></td>
                <td><%= cadaCarro.getPreco()%></td>
                <td><%= cadaCarro.getAnoFab()%></td>
                <td><a href="index.jsp?id=<%= cadaCarro.getIdCar()%>"><i style="color: green; red;font-size: 30px;margin-right: 10x" class="fa fa-pencil"></i></a>  <a href="excluir.jsp?id=<%= cadaCarro.getIdCar()%>" onclick="return confirm('Deseja realmente excluir?')"><i style="color: red;font-size: 30px" class="fa fa-trash"></i></a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
