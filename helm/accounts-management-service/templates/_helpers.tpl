Expand the name of the chart.
*/}}
{{- define "accounts-management-service.name" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "accounts-management-service.fullname" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf "%s-accounts-management-service" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
