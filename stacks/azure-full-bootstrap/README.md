# Azure Full Bootstrap

This stack creates all the necessary resources for Azure DevOps pipelines that will produce the artifacts needed.

The following prerequisites must be assured:

1. Presence of an Azure subscription, where all the creation permissions are allowed. User should be owner of the subscription
2. Permissions to create applications and service principals in the tenant's IntraID directory.
3. An Azure DevOps organization already set up. This will set the necessary project(s), but the organization and the personal user of the bootstrapper must already exist
