<%@ page import="scWeb.data.ConnectionPool" %>
<%@ page import="scWeb.writer.AgentHtmlWriter" %>
<%@ page import="scDomain.domain.objects.Agent" %>
<%@ page import="scDomain.domain.mappers.AgentMapper" %>
<%@ page import="scDomain.domain.objects.Role" %>
<%@ page import="scDomain.domain.mappers.RoleMapper" %>
<%@ page import="scDomain.domain.mappers.MapperFactory" %>
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
Agent me = MapperFactory.getAgentMapper(ConnectionPool.getInstance().getConnection()).find(new Agent.AgentKey("MHAYES"));
Role.RoleKey admin = new Role.RoleKey("ADMIN");
out.println(( me.getRole().getKey().equals(admin) ? "My role is admin." : "My role is not admin.<br />"));
Agent.AgentKey username = new Agent.AgentKey("ADMIN");
out.println(( me.getRole().equals(username) ? "Test Failed." : "Test Passed.<br />"));
%>
</body>
</html>