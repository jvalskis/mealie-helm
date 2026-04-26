{{- define "mealie.dbCredentialsSecretName" -}}
{{- if .Values.cluster.enabled -}}
{{- if .Values.cluster.cluster.initdb.secret.name -}}
{{- .Values.cluster.cluster.initdb.secret.name -}}
{{- else -}}
{{- printf "%s-cluster-app" .Release.Name -}}
{{- end -}}
{{- else if .Values.postgresql.enabled -}}
{{- if .Values.postgresql.auth.existingSecret -}}
{{- .Values.postgresql.auth.existingSecret -}}
{{- else -}}
{{- printf "%s-db-credentials" .Release.Name -}}
{{- end -}}
{{- else -}}
{{- printf "%s-db-credentials" .Release.Name -}}
{{- end -}}
{{- end -}}

{{- define "mealie.dbEngine" -}}
{{- if or .Values.cluster.enabled .Values.postgresql.enabled -}}
postgres
{{- else -}}
sqlite
{{- end -}}
{{- end -}}

{{- define "mealie.postgresServer" -}}
{{- if .Values.cluster.enabled -}}
{{- printf "%s-cluster-rw" .Release.Name -}}
{{- else if .Values.postgresql.enabled -}}
{{- printf "%s-postgresql" .Release.Name -}}
{{- end -}}
{{- end -}}
