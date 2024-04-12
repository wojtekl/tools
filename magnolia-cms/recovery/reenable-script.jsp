<%@ page contentType="text/plain" %>
<%@ page import="info.magnolia.cms.core.Content"%>
<%@ page import="info.magnolia.cms.core.HierarchyManager"%>
<%@ page import="info.magnolia.context.MgnlContext"%>
<%
MgnlContext.doInSystemContext(new MgnlContext.Op<Void, Throwable>() {
    public Void exec() throws Throwable {
        HierarchyManager hm = MgnlContext.getHierarchyManager("users");
        final Content su = hm.getContent("/system/superuser");
        su.setNodeData("enabled", true);
        su.save();
        return null;
    }
});
%>
