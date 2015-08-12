package scWeb.writer;

import scDomain.domain.objects.DomainObject;
//should this just be an interface and i can dispense with DomainObject?
public abstract class DomainWriter<O extends DomainObject> {
	protected O object;
	
	public DomainWriter() {}
	public DomainWriter(O object) {
		this.object = object;
	}
	
	public DomainObject getObject() { return object; }
	public void setObject(O object) { this.object = object; }
	
	//Do we always want them to return Strings?
	public String writeKey() {
		return object.getKey().toString();
	}
	
	public String writeObject() {
		return object.toString();
	}
}