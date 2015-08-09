package scWeb.writer;

import scDomain.domain.objects.DomainObject;

public abstract class DomainWriter<O extends DomainObject<?>> {
	protected O object;
	
	public DomainWriter() {}
	public DomainWriter(O object) {
		this.object = object;
	}
	
	public O getObject() { return object; }
	public void setObject(O object) { this.object = object; }
	
	//Do we always want them to return Strings?
	public String writeKey() {
		return object.getKey().toString();
	}
	
	public String writeObject() {
		return object.toString();
	}
}