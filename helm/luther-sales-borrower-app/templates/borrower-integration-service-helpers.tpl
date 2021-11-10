{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "luther-sales-borrower-app .name" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf "%s-luther-sales-borrower-app " .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "luther-sales-borrower-app .fullname" -}}
    {{- $name := default .Chart.Name .Values.nameOverride -}}
    {{- printf "%s-luther-sales-borrower-app " .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


