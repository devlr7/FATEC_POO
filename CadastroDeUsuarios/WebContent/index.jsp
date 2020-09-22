<%@page import="br.edu.fatecpg.poo.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    	ArrayList<Usuarios> usuariosList = (ArrayList)application.getAttribute("usuariosList");
    
    	if(usuariosList == null){
    		
    		usuariosList = new ArrayList<>();
    		usuariosList.add(new Usuarios("admin","99998888","admin@gmail.com"));
    		usuariosList.add(new Usuarios("admin0","99997777","admin0@gmail.com"));
    		usuariosList.add(new Usuarios("admin1","99996666","admin1@gmail.com"));
    		application.setAttribute("usuariosList", usuariosList);
    	}
    	
    	if(request.getParameter("add") != null){
    		String 	nome = request.getParameter("nome");
    		String 	telefone = request.getParameter("telefone");
    		String 	email = request.getParameter("email");
    		usuariosList.add(new Usuarios(nome, telefone, email));
    		response.sendRedirect(request.getRequestURI());
    	}
    	
		if(request.getParameter("remove") != null){
    		
    		int i = Integer.parseInt(request.getParameter("i"));
    		usuariosList.remove(i);
    		response.sendRedirect(request.getRequestURI());
    	}
    	
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aula 05 - POO</title>
</head>
<body>
	<h1>Cadastro de Usuários</h1>
	
	<form>
		Nome:<input type="text" name="nome">
		Telefone: <input type="text" name="telefone">
		Email: <input type="text" name="email">
		<input type="submit" value="Cadastrar" name="add"> <br><br>
	</form>
	<hr><br>
		<table border="1">
			<tr>
				<th>Índice</th>
				<th>Nome</th>
				<th>Email</th>
				<th>Password</th>
				<th>Comandos</th>
			</tr>
			<% for(int i = 0; i< usuariosList.size(); i++){ %>
			<tr>
				<td> <%= i %></td>
				<% Usuarios u = usuariosList.get(i); %>
				<td> <%= u.getNome() %> </td>
				<td> <%= u.getTelefone() %> </td>
				<td> <%= u.getEmail() %> </td>
				<td>
					<form>
						<input type="hidden" name="i" value="<%= i %>">
						<input type="submit" name="remove" value="Remover">
					</form>
				</td>
			</tr>
			<% } %>
		</table>
	
</body>
</html>