Expand the name of the chart.
*/}}
{{- define "helper-service.name" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "helper-service.fullname" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf "%s-helper-service" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
