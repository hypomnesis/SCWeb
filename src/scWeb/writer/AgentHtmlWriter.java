package scWeb.writer;

import java.util.LinkedHashMap;

import scDomain.domain.objects.Agent;

public final class AgentHtmlWriter extends DomainHtmlWriter<Agent> {
	public AgentHtmlWriter(Agent agent) { super(agent); }
	
	public String writeObject() {
		LinkedHashMap<String, String> attributes = new LinkedHashMap<String, String>();
		
		attributes.put("Name", object.getDisplayName());
		attributes.put("Username", object.getUsername());
		attributes.put("Role", object.getRole().getFullName());
		attributes.put("Email", object.getEmail());
		attributes.put("Lead", object.getTeamLead());
		attributes.put("Supervisor", object.getSupervisor());
		
		return writeAttributeTable(attributes, "Agent " + object.getUsername() + " attributes.");
	}
}