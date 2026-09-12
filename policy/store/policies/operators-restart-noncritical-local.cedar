@id("operators-restart-noncritical-local")
permit (
    principal is Linux::User,
    action == Linux::Action::"restart",
    resource
)
when {
    principal has groups &&
    principal.groups.contains("operators") &&
    resource has critical &&
    !resource.critical &&
    context has local_console &&
    context.local_console == true
};
