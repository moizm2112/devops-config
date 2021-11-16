Expand the name of the chart.
*/}}
{{- define "ach-service.name" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "ach-service.fullname" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf "%s-ach-service" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
