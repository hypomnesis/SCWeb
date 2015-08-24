<%@ page import="scWeb.data.ConnectionPool" %>
<%@ page import="scWeb.writer.AgentHtmlWriter" %>
<%@ page import="scDomain.domain.objects.Agent" %>
<%@ page import="scDomain.domain.objects.Department" %>
<%@ page import="scDomain.domain.objects.Role" %>
<%@ page import="scDomain.domain.commands.AgentCommand" %>
<%@ page import="scDomain.domain.dao.DomainDaoFactory" %>
<%@ page import="scDomain.domain.dao.DomainDaoProvider" %>
<%@ page import="scDomain.domain.dao.AgentDao" %>
<%@ page import="scDomain.data.database.DbDaoProvider" %>
<%@ page import="java.util.ArrayList" %>
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
AgentDao provider = new AgentCommand().getDao();
ArrayList<Agent> agents = provider.findByDeptRole( new Department.Key[] { new Department.Key("FMS"), new Department.Key("COMPL") }, new Role.Key[] { new Role.Key("AGENT"), new Role.Key("SUPERVISOR") }, true);

for (Agent agent : agents) {
    AgentHtmlWriter writer = new AgentHtmlWriter(agent);
    out.print(writer.writeObject() + "<br /><br />");
}
%>
</body>
</html>