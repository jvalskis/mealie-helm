{{- define "mealie.dbCredentialsSecretName" -}}
{{- printf "%s-db-credentials" .Release.Name -}}
{{- end -}}
