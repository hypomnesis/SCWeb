<%@ page import="scWeb.data.ConnectionPool" %>
<%@ page import="scWeb.writer.AgentHtmlWriter" %>
<%@ page import="scDomain.domain.objects.Agent" %>
<%@ page import="scDomain.domain.commands.AgentCommand" %>
<%@ page import="scDomain.domain.dao.DomainDaoFactory" %>
<%@ page import="scDomain.domain.dao.DomainDaoProvider" %>
<%@ page import="scDomain.data.database.DbDaoProvider" %>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<%
DomainDaoFactory.INSTANCE.setProvider(DbDaoProvider.INSTANCE.setConnectionProvider(ConnectionPool.getInstance()));
AgentCommand command = new AgentCommand();
AgentHtmlWriter writer = new AgentHtmlWriter(command.find(new Agent.Key("MHAYES")));
out.print(writer.writeObject());
%>
</body>
</html>