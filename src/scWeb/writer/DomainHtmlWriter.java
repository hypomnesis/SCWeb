package scWeb.writer;

import java.util.LinkedHashMap;

import scDomain.domain.objects.DomainObject;

public abstract class DomainHtmlWriter<O extends DomainObject> extends DomainWriter<O> {
    protected static String writeAttributeTable (LinkedHashMap<String, String> attributes) {
        return writeAttributeTable(attributes, null);
    }
    protected static String writeAttributeTable (LinkedHashMap<String, String> attributes, String caption) {
        StringBuilder table = new StringBuilder("<table>\n");
        
        if (caption != null) {
            table.append("\t<caption>").append(caption).append("</caption>\n");
        }
        table.append("\t<thead>\n\t\t<tr>\n");
        
        for (String name : attributes.keySet()) {
            table.append("\t\t\t<th>").append(name).append("</th>\n");
        }
        table.append("\t\t</tr>\n\t</thead>\n\t<tbody>\n\t\t<tr>\n");
        
        for (String attribute : attributes.values()) {
            table.append("\t\t\t<td>").append(attribute).append("</td>\n");
        }
        table.append("\t\t</tr>\n\t</tbody>\n</table>");
        
        return table.toString();
    }
    public DomainHtmlWriter() {
        // TODO Auto-generated constructor stub
    }

    public DomainHtmlWriter(O object) {
        super(object);
    }
}
