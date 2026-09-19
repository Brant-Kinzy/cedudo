@id("developers-observe-demo")
permit (
    principal is Linux::User,
    action in [Linux::Action::"read-logs", Linux::Action::"view-status"],
    resource == Linux::Service::"cedar-demo"
)
when {
    principal has groups &&
    principal.groups.contains("developers")
};
