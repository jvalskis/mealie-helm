# Mealie Helm chart

Mealie is a self hosted recipe manager, meal planner and shopping list. For more information visit the upstream project.

## Mealie project

https://github.com/mealie-recipes/mealie

## Installing the chart

```console
helm repo add mealie https://jvalskis.github.io/mealie-helm/
helm repo update
helm install mealie mealie/mealie
```

## Configuration

This chart inherits from the [bjw-s common library](https://github.com/bjw-s-labs/helm-charts/tree/main/charts/library/common). All standard options (controllers, services, ingress, persistence, etc.) are available in addition to the chart-specific values documented here.

### Database

Mealie defaults to SQLite. To use PostgreSQL, enable one of the database options below. `DB_ENGINE`, `POSTGRES_SERVER`, `POSTGRES_USER`, and `POSTGRES_PASSWORD` are configured automatically based on which option is active.

#### Option A - Bundled Bitnami PostgreSQL

Full reference: https://github.com/bitnami/charts/tree/master/bitnami/postgresql

| Property | Required | Notes |
|---|---|---|
| `postgresql.enabled` | yes | Set to `true` |
| `postgresql.auth.username` | yes |  |
| `postgresql.auth.password` | no | Required when not using `existingSecret` |
| `postgresql.auth.existingSecret` | no | Use a pre-existing secret instead; must contain `password` and `postgres-password` keys |

#### Option B - CloudNativePG cluster

Requires the [CloudNativePG operator](https://cloudnative-pg.io) to be installed in the cluster.

Full reference: https://github.com/cloudnative-pg/charts/tree/main/charts/cluster

| Property | Required | Notes |
|---|---|---|
| `cluster.enabled` | yes | Set to `true` |
| `cluster.cluster.initdb.secret.name` | no | Pre-existing secret for cluster bootstrap; must contain `username` and `password` keys. The operator creates one automatically if omitted |
