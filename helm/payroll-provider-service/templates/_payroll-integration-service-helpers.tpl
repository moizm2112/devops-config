{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "payroll-provider-service.name" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf "%s-payroll-provider-service" .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "payroll-provider-service.fullname" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf "%s-payroll-provider-service" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


